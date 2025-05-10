import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/map/domain/repos/nearby_doctors_repo.dart';
import 'package:tamenny_app/features/map/presentation/manager/nearby_doctors_cubit/nearby_doctors_cubit.dart';
import 'package:tamenny_app/features/map/presentation/views/widgets/nearby_doctors_view_body.dart';

class NearbyDoctorsView extends StatelessWidget {
  const NearbyDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NearbyDoctorsCubit(
        getIt<NearbyDoctorsRepo>(),
      )..fetchNearbyDoctors(),
      child: Scaffold(
        appBar: customAppBar(context, title: 'Nearby Doctors'),
        body: const NearbyDoctorsViewBlocBuilder(),
      ),
    );
  }
}
