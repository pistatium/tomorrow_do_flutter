import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tomorrow_do_flutter/converters/todo_converters.dart';
import 'package:tomorrow_do_flutter/entities/todo.dart';

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
  TabData(label: "いつかやる", status:TodoStatus.SomedayDo),
];

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    final firestore = Firestore.instance;
    final root = firestore
        .collection(todoDocumentName)
        .document('1')
        .collection('todos');
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  final List<Tab> tabs = tabDataList.map((t) => Tab(key: Key(statusToString(t.status)), text: t.label));

  void _createTodo() {
    var todo = Todo.create("userId", "test", "", 1, TodoStatus.TodayDo, null);
    final newDocument =
        Firestore.instance.collection(todoDocumentName).document();
    newDocument.setData(todoToFirestoreMap(todo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: TabBar(
//          isScrollable: true,
          tabs: tabs,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: TabBarView(
          controller: _tabController,
          children: tabs.asMap().map((i, tab) {
            return MapEntry(i, _createTab(tab));
          }).values.toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createTodo,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _createTab(Tab tab) {
    print(tab.key.toString());
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection(todoDocumentName)
          .where(FirestoreTodoField.status, isEqualTo: tab.key.toString())
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
