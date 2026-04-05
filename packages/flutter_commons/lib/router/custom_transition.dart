import 'package:flutter/widgets.dart';
import 'package:flutter_commons/utils/extensions/context_display_target_extension.dart';
import 'package:go_router/go_router.dart';

abstract class CustomTransition {
  static CustomTransitionPage animation(Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      name: state.name,
      child: child,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, _, child) {
        if (context.displayTarget.isWeb) {
          return child;
        }
        return SlideTransition(
          position: animation.drive(_getAppTransitionTween()),
          child: child,
        );
      },
    );
  }

  static Animatable<Offset> _getAppTransitionTween() {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    return Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  }
}
