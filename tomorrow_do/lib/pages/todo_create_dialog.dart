import 'package:flutter/material.dart';

class TodoCreateDialog extends ModalRoute<void> {

  final Widget contents;

  final bool isAndroidBackEnable;

  TodoCreateDialog(this.contents, {this.isAndroidBackEnable = true}) : super();

  @override
  // TODO: implement barrierColor
  Color get barrierColor => throw UnimplementedError();

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => throw UnimplementedError();

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => throw UnimplementedError();

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    throw UnimplementedError();
  }

  @override
  // TODO: implement maintainState
  bool get maintainState => throw UnimplementedError();

  @override
  // TODO: implement opaque
  bool get opaque => throw UnimplementedError();

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => throw UnimplementedError();
}
