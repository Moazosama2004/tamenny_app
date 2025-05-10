import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tamenny_app/core/entites/doctor_entity.dart';
import 'package:tamenny_app/features/map/presentation/views/doctor_details_view.dart';

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
            return Marker(
                point: LatLng(doc.latitude, doc.longitude),
                width: 120,
                height: 80,
                builder: (BuildContext context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorDetailsView(doctor: doc),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              doc.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 36,
                          ),
                        ],
                      ),
                    ));
          }).toList(),
        ),
      ],
    );
  }
}
