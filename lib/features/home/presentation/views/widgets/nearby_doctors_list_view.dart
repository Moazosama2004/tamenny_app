import 'package:flutter/material.dart';
import 'package:tamenny_app/core/entites/doctor_entity.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/doctor_card.dart';
import 'package:tamenny_app/features/map/presentation/views/doctor_details_view.dart';

class NearbyDoctorsListView extends StatelessWidget {
  const NearbyDoctorsListView({super.key, required this.doctors});
  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Doctors'),
      body: NearbyDoctorsListViewBody(doctors: doctors),
    );
  }
}

class NearbyDoctorsListViewBody extends StatelessWidget {
  const NearbyDoctorsListViewBody({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) => DoctorCard(
          doctor: doctors[index],
        ),
      ),
    );
  }
}
