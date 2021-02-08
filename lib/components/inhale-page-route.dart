import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InhalePageRoute<T> extends PageRoute<T> {
  InhalePageRoute(this.child);
  @override
  Color get barrierColor => Colors.lightBlue;

  @override
  String get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 0);
}
