import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:tamenny_app/core/models/doctor_model.dart';
import 'package:tamenny_app/features/map/presentation/views/doctor_details_view.dart';

class NearbyDoctorsViewBody extends StatelessWidget {
  const NearbyDoctorsViewBody({super.key});

  final List<Map<String, dynamic>> doctors = const [
    {
      "name": "دار الطب",
      "latitude": 26.555103288417282,
      "longitude": 31.70732953335323,
      "specialty": "أمراض قلب",
      "city": "سوهاج",
      "imageUrl":
          'https://scontent.fcai21-2.fna.fbcdn.net/v/t39.30808-6/271894495_1822485861473052_3106524423238112275_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH1ff24Lud19M3ZZJxGK0vje1BdjTV9q757UF2NNX2rvgEU75K61xUPTQSgGorjPNJb4mmDdAY9GVvPDZPr1PcC&_nc_ohc=ceJvJuO5MdIQ7kNvwEApSv2&_nc_oc=AdnQdw8RdGEq6dTFTCjB5EdZfLzTmFXppl-IxWMaMI17ZQL5lguLNXTIA6o9LYPG_P0&_nc_zt=23&_nc_ht=scontent.fcai21-2.fna&_nc_gid=t4Mw4Wl8UB-aOWfSPyiFIw&oh=00_AfLo_sK2aSuHxY8I7jHvD7N7kZjHJayuV2FEGqHkMyWvfg&oe=6824182D',
      "rating": 4.6,
      "address": "شارع الجمهورية، أمام مستشفى سوهاج العام",
      "phone": "01001234567",
    },
    {
      "name": "El Helal Hospital",
      "latitude": 26.559244975143987,
      "longitude": 31.6956741324039,
      "specialty": "عظام وركبة",
      "city": "سوهاج",
      "imageUrl": null,
      "rating": 4.2,
      "address": "نهاية شارع التحرير، بجوار معهد القلب",
      "phone": "01007654321",
    },
  ];

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
                point: LatLng(doc["latitude"], doc["longitude"]),
                width: 120,
                height: 80,
                builder: (BuildContext context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorDetailsView(
                                    doctor: DoctorModel.fromJson(doctors[0])
                                        .toEntity())));
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
                    ));
          }).toList(),
        ),
      ],
    );
  }
}
