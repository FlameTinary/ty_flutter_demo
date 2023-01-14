import 'package:flutter/material.dart';

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
  });

  final WidgetBuilder builder;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  final Duration transitionDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
