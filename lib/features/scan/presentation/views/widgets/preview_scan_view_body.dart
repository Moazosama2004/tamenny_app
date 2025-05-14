import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:tamenny_app/core/functions/build_error_snack_bar.dart';
import 'package:tamenny_app/core/functions/show_toast_message.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/scan/presentation/manager/cubit/dianosis_state.dart';

import '../../manager/cubit/dianosis_cubit.dart';

class PreviewScanViewBody extends StatefulWidget {
  const PreviewScanViewBody({super.key});

  @override
  State<PreviewScanViewBody> createState() => _PreviewScanViewBodyState();
}

class _PreviewScanViewBodyState extends State<PreviewScanViewBody> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;
  bool _isLoading = false;

  Future<void> _pickImageFromGallery() async {
    setState(() {
      _isLoading = true;
    });

    final image = await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = image != null ? XFile(image.path) : null;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiagnosisCubit, DiagnosisState>(
      listener: (context, state) {
        if (state is DiagnosisSuccess) {
          Navigator.pushNamed(context, Routes.completedScreen,
              arguments: state.diagnosisResultEntity);
        } else if (state is DiagnosisFailure) {
          log(state.errMessage);
          showErrorBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is DiagnosisLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://lottie.host/c14b4722-a922-4bbb-9cda-1c836fa19d4a/Mr5j84wclT.json'),
                const Text('Loading .... '),
              ],
            ),
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Expanded(child: SizedBox(height: 16)),
                  InkWell(
                    onTap: _pickImageFromGallery,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[100],
                      ),
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : _pickedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    File(_pickedImage!.path),
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 40,
                                      color: Colors.blueAccent,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Tap to upload your scan',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 24)),
                  CustomAppButton(
                    text: 'Processed',
                    onTap: () {
                      if (_pickedImage != null) {
                        context
                            .read<DiagnosisCubit>()
                            .startDiagnosis(image: _pickedImage!);
                      } else {
                        showErrorBar(context,
                            message: 'Please select an image to proceed');
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
