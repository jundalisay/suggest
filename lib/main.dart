import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/config_dependencies.dart';
import 'package:suggestion_app/suggest_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => ConfigDependencies().init());
  runApp(const SuggestApp());
}
