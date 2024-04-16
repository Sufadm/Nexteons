class DataModel {
  final String message;
  final Data data;

  DataModel({required this.message, required this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<Item> list;
  final int totalCount;

  Data({required this.list, required this.totalCount});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Item> itemList = list.map((i) => Item.fromJson(i)).toList();

    return Data(
      list: itemList,
      totalCount: json['totalCount'],
    );
  }
}

class Item {
  final String id;
  final String name;
  final String globalGalleryCategoryId;
  final int docType;
  final int uid;
  final int type;
  final String url;
  final String createdUserId;
  final int createdAt;
  final String? updatedUserId;
  final int updatedAt;
  final int status;
  final int v;

  Item({
    required this.id,
    required this.name,
    required this.globalGalleryCategoryId,
    required this.docType,
    required this.uid,
    required this.type,
    required this.url,
    required this.createdUserId,
    required this.createdAt,
    this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      name: json['_name'],
      globalGalleryCategoryId: json['_globalGalleryCategoryId'] ?? '',
      docType: json['_docType'],
      uid: json['_uid'],
      type: json['_type'],
      url: json['_url'],
      createdUserId: json['_createdUserId'],
      createdAt: json['_createdAt'],
      updatedUserId: json['_updatedUserId'],
      updatedAt: json['_updatedAt'],
      status: json['_status'],
      v: json['__v'],
    );
  }
}
