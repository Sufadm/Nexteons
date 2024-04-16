import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nexteons/model/gallery_item_model.dart';

class GalleryController extends GetxController {
  final String apiUrl = 'https://ajcjewel.com:4000/api/global-gallery/list';

  Rx<DataModel?> dataModel = Rx<DataModel?>(null);
  RxBool isLoading = true.obs;
  late Dio dio;

  @override
  void onInit() {
    dio = Dio();
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    isLoading(true);
    try {
      final response = await dio.post(
        apiUrl,
        data: jsonEncode({
          "statusArray": [1],
          "screenType": [],
          "responseFormat": [],
          "globalGalleryIds": [],
          "categoryIds": [],
          "docTypes": [],
          "types": [],
          "limit": 10,
          "skip": 0,
          "searchingText": ""
        }),
        options: Options(
          headers: {
            'Authorization':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcxMTQ0NTY1OSwiZXhwIjoxNzQyOTgxNjU5fQ.lE1Gbdm8YZ6Fany4184Pb7kSUg-z6Rk8Ag1irB3fstc',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = response.data;
        dataModel.value = DataModel.fromJson(jsonData);
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    } finally {
      isLoading(false);
    }
  }
}
