import 'dart:io';
import 'package:dio/dio.dart';

class AIDiagnosisService {
  final Dio dio;
  final String baseUrl = 'https://lungapi-production.up.railway.app/';

  AIDiagnosisService(this.dio);

  // Future<Map<String, dynamic>> kneeDiagnosis({required File imageFile}) async {

  // }

  Future<Map<String, dynamic>> lungDiagnosis({required File imageFile}) async {
    try {
      if (!await imageFile.exists()) {
        throw Exception('File does not exist');
      }

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'lung_scan.jpg', // renamed from knee_scan.jpg
        ),
      });

      final response = await dio.post(
        '${baseUrl}predict_Lung', // make sure this URL is correct
        data: formData,
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Unexpected response structure',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (dioError) {
      print('DioException during lung diagnosis: ${dioError.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error during lung diagnosis: $e');
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
