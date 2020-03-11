import 'package:flutter/material.dart';

class TodoCreateDialog extends ModalRoute<void> {

  final Widget contents;

  final bool isAndroidBackEnable;

  TodoCreateDialog(this.contents, {this.isAndroidBackEnable = true}) : super();

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {

  }

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: 100);
}
