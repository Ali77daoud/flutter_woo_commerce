class ProductsModel {
  final int? id;
  final String? productName;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final String? stockStatus;

  final List<ImageModel>? images;
  final List<CategoryModel>? categories;

  ProductsModel({
    required this.id,
    required this.productName,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.stockStatus,
    required this.images,
    required this.categories,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json['id'],
        productName: json['name'],
        description: json['description'],
        shortDescription: json['short_description'],
        sku: json['sku'],
        price: json['price'],
        regularPrice: json['regular_price'],
        salePrice: json['sale_price'],
        stockStatus: json['stock_status'],
        categories: json['categories'] != null
            ? (json['categories'] as List)
                .map((e) => CategoryModel.fromJson(e))
                .toList()
            : null,
        images:
            // (json['images'] as List)
            //     .map((e) => ImageModel.fromJson(e))
            //     .toList());

            json['images'] != null
                ? (json['images'] as List)
                    .map((e) => ImageModel.fromJson(e))
                    .toList()
                : null);
  }

  Map<String, dynamic> productModeltoJson() {
    return {
      'id': id,
      'name': productName,
      'description': description,
      'short_description': shortDescription,
      'sku': sku,
      'price': price,
      'regular_price': regularPrice,
      'sale_price': salePrice,
      'stock_status': stockStatus,
      'images': images!.map((e) => e.imagesModeltoJson()).toList(),
      'categories': categories!.map((e) => e.categoryModeltoJson()).toList(),
    };
  }
}

class ImageModel {
  final int? id;
  final String? imgUrl;

  ImageModel({required this.id, required this.imgUrl});

  factory ImageModel.fromJson(Map<String, dynamic>? json) {
    return ImageModel(id: json!['id'], imgUrl: json['src']);
  }

  Map<String, dynamic> imagesModeltoJson() {
    return {
      'id': id,
      'src': imgUrl,
    };
  }
}

class CategoryModel {
  final int? id;
  final String? name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic>? json) {
    return CategoryModel(id: json!['id'], name: json['name']);
  }

  Map<String, dynamic> categoryModeltoJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
