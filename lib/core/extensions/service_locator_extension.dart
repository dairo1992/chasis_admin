import 'package:chasis_admin/core/services/services_locator_impl.dart';
import 'package:flutter/widgets.dart';

extension ServiceLocatorExtension on BuildContext {
  T resolve<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? instanceName,
    Type? type,
  }) {
    return ServiceLocatorImpl.instance.get<T>(instanceName: instanceName);
  }
}
