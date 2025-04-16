import 'package:dio/dio.dart';
import '../model/upload_model.dart';

class ApiService {
  static const String _endpoint =
      'https://script.google.com/macros/s/AKfycbxZtymNUF-3MxUTI43WVaYMvwNJVF3kLc8B3jC5J4-luhfB4w1ylCpIdR7sQqknb5-k/exec';

  static Future<String> uploadData(UploadModel data) async {
    final dio = Dio();
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('globalid', data.globalId),
      MapEntry('objectid', data.objectId),
      MapEntry('subfolder', data.subfolder),
      MapEntry('latitude', data.latitude),
      MapEntry('longitude', data.longitude),
    ]);

    for (int i = 0; i < data.images.length; i++) {
      formData.files.add(MapEntry(
        'file$i',
        MultipartFile.fromBytes(
          data.images[i],
          filename: data.filenames[i],
          contentType: DioMediaType('image', 'jpeg'),
        ),
      ));
    }

    final response = await dio.post(_endpoint, data: formData);
    return response.data.toString();
  }
}
