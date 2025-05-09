import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // ✅ الاستيراد الصحيح

class NearbyDoctorsViewBody extends StatelessWidget {
  const NearbyDoctorsViewBody({super.key});

  final List<Map<String, dynamic>> doctors = const [
    {"name": "دار الطب", "lat": 26.555103288417282, "lng": 31.70732953335323},
    {
      "name": "El Helal Hospital",
      "lat": 26.559244975143987,
      "lng": 31.6956741324039,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        maxZoom: 18,
        minZoom: 3,
        initialCenter: LatLng(26.556, 31.701), // يمكنك تعديلها حسب المكان
        initialZoom: 13,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'tamenny_app',
        ),
        MarkerLayer(
          markers: doctors.map((doc) {
            return Marker(
              point: LatLng(doc["lat"], doc["lng"]),
              width: 120,
              height: 80,
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
                      doc["name"],
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
            );
          }).toList(),
        ),
      ],
    );
  }
}
