///
/// do what u want with this code
/// u can add or delete what u want
///

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/core/dependency_injection/injection.dart';
import 'logic/providers/location_provider.dart';
import 'widgets/google_map_widget.dart';

class GetLocationScreen extends StatelessWidget {
  const GetLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocationProvider>(
      create: (_) => Get.locationProvider,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Location'),
        ),
        body: const GoogleMapWidget(),
      ),
    );
  }
}
