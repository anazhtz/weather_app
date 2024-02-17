import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/helper/theme_helper.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp( Homepage());
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeHelper.light,
      home: HomeView(),
    );
  }
}
