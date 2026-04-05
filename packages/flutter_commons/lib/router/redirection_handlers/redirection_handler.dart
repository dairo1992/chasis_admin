import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_commons/router/redirection_handlers/redirection_handler_data.dart';
import 'package:go_router/go_router.dart';

abstract class RedirectionHandler {
  abstract final RedirectionHandlerData? data;

  FutureOr<String?> onRedirect(BuildContext context, GoRouterState state);

  RedirectionHandler setAdditionalData(RedirectionHandlerData data);
}
