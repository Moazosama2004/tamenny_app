import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tamenny_app/core/entites/doctor_entity.dart';
import 'package:tamenny_app/features/map/presentation/views/functions/build_custom_marker.dart';

class NearbyDoctorsViewBody extends StatelessWidget {
  const NearbyDoctorsViewBody({super.key, required this.doctors});
  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        maxZoom: 18,
        minZoom: 3,
        center: const LatLng(26.563760, 31.686651),
        zoom: 13,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'tamenny_app',
        ),
        MarkerLayer(
          markers: doctors.map((doc) {
            return buildCustomMarker(doctor: doc);
          }).toList(),
        ),
      ],
    );
  }
}
