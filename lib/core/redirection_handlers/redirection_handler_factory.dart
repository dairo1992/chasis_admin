import 'package:chasis_admin/core/redirection_handlers/implementations/redirection_handler_type.dart';
import 'package:chasis_admin/core/redirection_handlers/implementations/route_data_validation_redirection_handler.dart';

class RedirectionHandlerFactory {
  final RouteDataValidationRedirectionHandler
      routeDataValidationRedirectionHandler;

  RedirectionHandlerFactory({
    required this.routeDataValidationRedirectionHandler,
  });

  RouteDataValidationRedirectionHandler get({
    required RedirectionHandlerType type,
  }) {
    return switch (type) {
      RedirectionHandlerType.routeDataValidation =>
        routeDataValidationRedirectionHandler,
    };
  }
}
