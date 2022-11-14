import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/services/geo_locator/presentation/logic/providers/location_provider.dart';
import 'package:services/services/navigation/navigation.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationProvider read = LocationProvider.read(context);
    return GoogleMap(
      initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
      onMapCreated: read.onMapCreated,
      markers: LocationProvider.write(context).markers,
      onLongPress: (latLng) async {
        bool? isOk = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Change location:'),
            actions: [
              TextButton(
                onPressed: () => Navigate.back(true),
                child: Text('change'),
              ),
              TextButton(
                onPressed: () => Navigate.back(false),
                child: Text('xD'),
              )
            ],
          ),
        );
        if (isOk ?? false) {
          read.onMapLongPress(latLng);
        }
      },
    );
  }
}
