import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_commons/domain/providers/tokens_provider.dart';
import 'package:flutter_commons/domain/session_provider.dart';
import 'package:flutter_commons/router/redirection_handlers/redirection_handler.dart';
import 'package:flutter_commons/router/redirection_handlers/redirection_handler_data.dart';
import 'package:go_router/go_router.dart';

import '../../routes.dart';

class SessionValidationRedirectionHandler implements RedirectionHandler {
  factory SessionValidationRedirectionHandler.init({
    required TokensProvider tokensProvider,
    required SessionProvider sessionProvider,
  }) => SessionValidationRedirectionHandler._(
    tokensProvider: tokensProvider,
    sessionProvider: sessionProvider,
  );

  SessionValidationRedirectionHandler._({
    required this.tokensProvider,
    required this.sessionProvider,
    this.data,
  });

  final TokensProvider tokensProvider;
  final SessionProvider sessionProvider;

  @override
  RedirectionHandlerData? data;

  String get _invalidSessionRedirectionRoute => Routes.authentication.path;

  @override
  FutureOr<String?> onRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    try {
      if (sessionProvider.hasActiveSession) {
        final tokenValid = await tokensProvider.validate();
        if (!tokenValid.isOk) {
          return _invalidSessionRedirectionRoute;
        }
        return null;
      } else {
        return _invalidSessionRedirectionRoute;
      }
    } catch (e) {
      return _invalidSessionRedirectionRoute;
    }
  }

  @override
  RedirectionHandler setAdditionalData(RedirectionHandlerData data) {
    return SessionValidationRedirectionHandler._(
      tokensProvider: tokensProvider,
      sessionProvider: sessionProvider,
      data: data,
    );
  }
}
