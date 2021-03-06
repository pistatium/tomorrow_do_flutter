import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tomorrow_do_flutter/converters/todo_converters.dart';
import 'package:tomorrow_do_flutter/entities/todo.dart';
import 'package:tomorrow_do_flutter/pages/todo_create_dialog.dart';

final String todoDocumentName = 'todo_test';

class TabData {
  String label;
  TodoStatus status;

  TabData({this.label, this.status});
}

final List<TabData> tabDataList = [
  TabData(label: "終わった", status: TodoStatus.Done),
  TabData(label: "今日やる", status: TodoStatus.TodayDo),
  TabData(label: "明日やる", status: TodoStatus.TomorrowDo),
  TabData(label: "いつかやる", status: TodoStatus.SomedayDo),
];

class MainPage extends StatefulWidget {
  MainPage({this.title});

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: tabDataList.length, vsync: this, initialIndex: 1);
  }

  void _createTodo() async {
    Navigator.push(context, TodoCreateDialog(Center(
      child: Text("test")
    ),
    isAndroidBackEnable: true));
//    final FirebaseAuth _auth = FirebaseAuth.instance;
//    var user = await _auth.currentUser();
//    var todo = Todo.create(user.uid, "test", "", 1, TodoStatus.TodayDo, null);
//    final newDocument =
//        Firestore.instance.collection(todoDocumentName).document();
//    newDocument.setData(todoToFirestoreMap(todo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          unselectedLabelColor: Color.fromARGB(255, 1, 1, 1),
          labelColor: Color.fromARGB(255, 255, 255, 255),
          indicatorPadding: EdgeInsets.only(left: 18.0),
          tabs: tabDataList
              .map((t) => new Container(
                    child: Tab(
                      text: t.label,
                      key: Key(statusToString(t.status)),
                    ),
                  ))
              .toList(),
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: Center(
        child: TabBarView(
            controller: _tabController,
            children: tabDataList.map((t) => _createTab(t)).toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createTodo,
        tooltip: 'Create',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _createTab(TabData tabData) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection(todoDocumentName)
          .where(FirestoreTodoField.status,
              isEqualTo: statusToString(tabData.status))
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                var todo = todoFromFirestoreMap(document.data);
                return new ListTile(
                  title: new Text(todo.title),
                  subtitle: new Text(todo.memo),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
