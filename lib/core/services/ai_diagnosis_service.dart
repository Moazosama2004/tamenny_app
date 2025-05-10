import 'dart:io';
import 'package:dio/dio.dart';

class AIDiagnosisService {
  final Dio dio;
  final String baseUrl = 'https://2641-197-38-192-59.ngrok-free.app/';

  AIDiagnosisService(this.dio);

  Future<Map<String, dynamic>> kneeDiagnosis({required File imageFile}) async {
    try {
      if (!await imageFile.exists()) {
        throw Exception('File does not exist');
      }

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path,
            filename: 'knee_scan.jpg'),
      });

      final response = await dio.post(
        '${baseUrl}predict_Knee',
        data: formData,
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Unexpected response structure',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (dioError) {
      print('DioException during knee diagnosis: ${dioError.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error during knee diagnosis: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> lungDiagnosis({required File imageFile}) async {
    try {
      if (!await imageFile.exists()) {
        throw Exception('Invalid image file');
      }

      var formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path,
            filename: 'lung_scan.jpg'),
      });

      var response = await dio.post(
        '${baseUrl}predict_Lung',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data;
      } else {
        throw Exception('Invalid response from the server');
      }
    } catch (e) {
      print('Error during lung diagnosis: $e');
      rethrow;
    }
  }

  // Future<Map<String, dynamic>> heartDiagnosis() async {
  //   try {
  //     // Implement the logic for heart diagnosis
  //   } catch (e) {
  //     print('Error during heart diagnosis: $e');
  //     rethrow;
  //   }
  // }

  // Future<Map<String, dynamic>> brainDiagnosis() async {
  //   try {
  //     // Implement the logic for brain diagnosis
  //   } catch (e) {
  //     print('Error during brain diagnosis: $e');
  //     rethrow;
  //   }
  // }
}
