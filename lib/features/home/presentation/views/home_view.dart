import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/features/home/domain/repos/latest_scans_repo.dart';
import 'package:tamenny_app/features/home/domain/repos/medical_news_repo.dart';
import 'package:tamenny_app/features/home/presentation/manager/latest_scans_cubit/latest_scans_cubit.dart';
import 'package:tamenny_app/features/home/presentation/manager/medical_news_cubit/medical_news_cubit.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MedicalNewsCubit(
            getIt<MedicalNewsRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              LatestScansCubit(getIt<LatestScansRepo>())..fetchLatestScans(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: const SafeArea(
          child: Scaffold(
            body: HomeViewBody(),
          ),
        ),
      ),
    );
  }
}
