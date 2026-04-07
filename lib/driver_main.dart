import 'package:flutter_driver/driver_extension.dart';
import 'package:chasis_admin/start.dart';

void main() async {
  // Habilita la extensión de Flutter Driver ANTES de runApp.
  enableFlutterDriverExtension();
  await start();
}
