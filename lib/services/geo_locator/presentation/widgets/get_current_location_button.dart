import 'package:flutter/material.dart';
import '/services/geo_locator/presentation/logic/providers/location_provider.dart';

class GetCurrentLocationButton extends StatelessWidget {
  const GetCurrentLocationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text("get current location"),
      icon: const Icon(Icons.location_on),
      onPressed: () {
        LocationProvider.read(context).getCurrentLocation();
      },
    );
  }
}
