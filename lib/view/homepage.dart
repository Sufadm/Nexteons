import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons/controller/api_service.dart';

class GalleryPage extends StatelessWidget {
  final GalleryController galleryController = Get.put(GalleryController());

  GalleryPage({super.key});

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
            return Column(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('Name'),
                    ),
                    DataColumn(
                      label: Text('UID'),
                    ),
                    DataColumn(
                      label: Text('Doc type'),
                    ),
                    DataColumn(
                      label: Text('Image'),
                    ),
                  ],
                  rows: const [],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.list.length,
                    itemBuilder: (context, index) {
                      final item = data.list[index];
                      return ListTile(
                        title: DataTable(
                          columns: const [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: [
                            DataRow(cells: [
                              const DataCell(Text("Java")),
                              DataCell(Text(item.uid.toString())),
                              const DataCell(Text("1")),
                              DataCell(Image.network(
                                item.url,
                                height: 30,
                                width: 70,
                              )),
                            ]),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
