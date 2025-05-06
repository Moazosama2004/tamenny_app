import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamenny_app/core/functions/show_toast_message.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/scan/presentation/views/widgets/preview_scan_view_body.dart';
import '../../../../core/routes/routes.dart';

class PreviewScanView extends StatelessWidget {
  const PreviewScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Preview Your Scan'),
      body: PreviewScanViewBody(),
    );
  }
}
