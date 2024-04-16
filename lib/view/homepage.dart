import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons/controller/api_service.dart';

class GalleryPage extends StatelessWidget {
  final GalleryController galleryController = Get.put(GalleryController());

  GalleryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Page'),
      ),
      body: Center(
        child: Obx(() {
          if (galleryController.isLoading.value) {
            return const CircularProgressIndicator();
          } else if (galleryController.dataModel.value == null) {
            return const Text('No data available');
          } else {
            final data = galleryController.dataModel.value!.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable2(
                dataRowHeight: 60,
                columns: const [
                  DataColumn2(label: Text('Name')),
                  DataColumn2(label: Text('UID')),
                  DataColumn2(label: Text('Doc')),
                  DataColumn2(label: Text('Image')),
                ],
                rows: List<DataRow>.generate(data.list.length, (index) {
                  final item = data.list[index];
                  return DataRow(cells: [
                    const DataCell(Text("Java")),
                    DataCell(Text(item.uid.toString())),
                    const DataCell(Text("1")),
                    DataCell(Image.network(
                      item.url,
                      height: 30,
                      width: 70,
                    )),
                  ]);
                }),
              ),
            );
          }
        }),
      ),
    );
  }
}
