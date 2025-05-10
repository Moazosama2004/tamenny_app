import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tamenny_app/core/entites/doctor_entity.dart';
import 'package:tamenny_app/features/map/presentation/views/doctor_details_view.dart';

Marker buildCustomMarker({required DoctorEntity doctor}) {
  return Marker(
      point: LatLng(doctor.latitude, doctor.longitude),
      width: 120,
      height: 80,
      builder: (BuildContext context) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DoctorDetailsView(doctor: doctor),
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
                    doctor.name,
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
}
