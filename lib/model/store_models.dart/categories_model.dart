class CategoriesModel {
  final int? id;
  final String? categoryName;
  final String? categoryDesc;
  final ImageModel? image;

  CategoriesModel(
      {required this.id,
      required this.categoryName,
      required this.categoryDesc,
      required this.image});

  factory CategoriesModel.fromJson(Map<String, dynamic>? json) {
    return CategoriesModel(
        id: json!['id'],
        categoryName: json['name'],
        categoryDesc: json['description'],
        image:
            json['image'] != null ? ImageModel.fromJson(json['image']) : null);
  }
}

class ImageModel {
  final int? id;
  final String? imgUrl;

  ImageModel({required this.id, required this.imgUrl});

  factory ImageModel.fromJson(Map<String, dynamic>? json) {
    return ImageModel(id: json!['id'], imgUrl: json['src']);
  }
}
