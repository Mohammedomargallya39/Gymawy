import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gym/core/utils/constants.dart';

class SetYourLocation extends StatefulWidget {
  const SetYourLocation({Key? key}) : super(key: key);

  @override
  State<SetYourLocation> createState() => _SetYourLocationState();
}

class _SetYourLocationState extends State<SetYourLocation> {
  
  late GoogleMapController googleMapController;
  final LatLng center = LatLng(currentLat!, currentLng!);

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }
  
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            target: center,
            zoom: 11.0,
        ),
    );
  }
}
