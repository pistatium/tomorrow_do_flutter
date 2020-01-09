import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:tomorrow_do_flutter/pages/login.dart';
import 'package:tomorrow_do_flutter/pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '明日から本気だす',
      theme: ThemeData(
        primarySwatch: Colors.grey,

      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new LoginPage(),
        '/main': (BuildContext context) => MainPage(title: '明日から本気だす')
      },
    );
  }
}

