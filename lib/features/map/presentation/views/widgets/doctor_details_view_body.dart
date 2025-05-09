import 'package:flutter/material.dart';
import 'package:tamenny_app/core/entites/doctor_entity.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key, required this.doctor});
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
      child: Column(
        children: [
          if (doctor.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 3 / 2.5,
                child: Image.network(
                  doctor.imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            doctor.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (doctor.specialty != null)
            Text(
              doctor.specialty!,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          const SizedBox(height: 12),
          if (doctor.rating != null)
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(doctor.rating.toString()),
              ],
            ),
          const SizedBox(height: 12),
          if (doctor.address != null)
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8),
                Expanded(child: Text(doctor.address!)),
              ],
            ),
          const Spacer(),
          if (doctor.phone != null)
            CustomAppButton(
                text: 'Call Doctor',
                onTap: () {
                  _callDoctor(doctor.phone!);
                }),
        ],
      ),
    );
  }

  void _callDoctor(String phone) async {
    final Uri url = Uri.parse('tel:$phone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('Could not launch $phone');
    }
  }
}
