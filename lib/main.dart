import 'package:flutter/material.dart';
import 'package:services/core/dependency_injection/injection.dart';
import 'package:services/services/geo_locator/presentation/location_screen.dart';
import '/services/navigation/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigate.navigatorKey,
      home: Scaffold(
        body: const Center(
          child: FlutterLogo(
            size: 140,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Get Current Location'),
          onPressed: () => Navigate.off(const GetLocationScreen()),
        ),
      ),
    );
  }
}
