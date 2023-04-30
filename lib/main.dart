import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/config_dependencies.dart';
import 'package:suggest/suggest_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => ConfigDependencies().init());
  runApp(const SuggestApp());
}


// suggest_app + service --> 