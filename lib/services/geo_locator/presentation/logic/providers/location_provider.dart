/// project files
import '/services/geo_locator/presentation/logic/use_cases/current_location.dart';
import '/core/errors/failures.dart';

/// packages
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:android_intent_plus/android_intent.dart';

class LocationProvider extends ChangeNotifier {
  ///
  /// get instance of [LocationProvider] with listen false
  ///
  static LocationProvider read(BuildContext context) =>
      Provider.of<LocationProvider>(
        context,
        listen: false,
      );

  ///
  /// get instance of [LocationProvider] with listen true
  ///
  static LocationProvider write(BuildContext context) =>
      Provider.of<LocationProvider>(
        context,
        listen: true,
      );

  // use cases ...
  GetCurrentLocation getLocation;

  // constructor
  LocationProvider({
    required this.getLocation,
  }) {
    markers = {};
  }

  void _openLocationSetting() async {
    await const AndroidIntent(
      action: 'android.settings.LOCATION_SOURCE_SETTINGS',
    ).launch();
  }

  Future<void> getCurrentLocation() async {
    final positionOrFailure = await getLocation();
    positionOrFailure.fold(
      (position) {
        mapAnimateTo(position.latitude, position.longitude);
      },
      (failure) {
        if (failure is DisabledLocationFailure) {
          _openLocationSetting();
          return;
        }
        failure.showMessage();
      },
    );
  }

  // ================= map ================
  //! variables :
  late final GoogleMapController _mapController;
  late final Set<Marker> markers;

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void mapAnimateTo(double lat, double lng) {
    final CameraPosition position =
        CameraPosition(target: LatLng(lat, lng), zoom: 18.5);
    markers.add(
      Marker(markerId: const MarkerId('id_1'), position: LatLng(lat, lng)),
    );
    notifyListeners();
    _mapController.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  /// dispose method
  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void onMapLongPress(LatLng argument) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('id_1'), position: argument));
    notifyListeners();
  }
}
