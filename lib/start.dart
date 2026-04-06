import 'package:app_core/app_config/app_config.dart';
import 'package:chasis_admin/app.dart';
import 'package:chasis_admin/config/app_config_strategy_impl.dart';
import 'package:flutter/material.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.setStrategy(AppConfigStrategyImpl());
  await AppConfig.instance.start();

  runApp(const App());
  AppConfig.instance.startUI();
}
