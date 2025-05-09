import 'package:flutter/material.dart';
import 'package:tamenny_app/features/scan/presentation/views/widgets/processing_view_body.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  bool isBack = false;
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 5000),
      () => Navigator.pushNamed(
        context,
        Routes.completedScreen,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(context, title: '', leadingIcon: false),
      appBar: customAppBar(context, title: 'Processing'),
      body: const ProcessingViewBody(),
    );
  }
}
