class CartModel {
  CartModel({
    required this.cartHash,
    required this.cartKey,
    required this.items,
    required this.itemCount,
    required this.needsPayment,
    required this.totals,
  });

  String cartHash;
  String cartKey;
  List<Item> items;
  int itemCount;
  bool needsPayment;
  CartModelTotals totals;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartHash: json["cart_hash"],
        cartKey: json["cart_key"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        itemCount: json["item_count"],
        needsPayment: json["needs_payment"],
        totals: CartModelTotals.fromJson(json["totals"]),
      );
}

class Item {
  Item({
    required this.itemKey,
    required this.id,
    required this.name,
    required this.title,
    required this.price,
    required this.quantity,
    required this.totals,
    required this.slug,
    required this.meta,
    required this.backorders,
    required this.featuredImage,
  });

  String itemKey;
  int id;
  String name;
  String title;
  String price;
  Quantity quantity;
  ItemTotals totals;
  String slug;
  Meta meta;
  String backorders;
  String featuredImage;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemKey: json["item_key"],
        id: json["id"],
        name: json["name"],
        title: json["title"],
        price: json["price"],
        quantity: Quantity.fromJson(json["quantity"]),
        totals: ItemTotals.fromJson(json["totals"]),
        slug: json["slug"],
        meta: Meta.fromJson(json["meta"]),
        backorders: json["backorders"],
        featuredImage: json["featured_image"],
      );
}

class Meta {
  Meta({
    required this.productType,
    required this.sku,
    required this.dimensions,
    required this.weight,
  });

  String productType;
  String sku;
  Dimensions dimensions;
  int weight;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        productType: json["product_type"],
        sku: json["sku"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        weight: json["weight"],
      );
}

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
    required this.unit,
  });

  String length;
  String width;
  String height;
  String unit;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
        unit: json["unit"],
      );
}

class Quantity {
  Quantity({
    required this.value,
    required this.minPurchase,
    required this.maxPurchase,
  });

  int value;
  int minPurchase;
  int maxPurchase;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        value: json["value"],
        minPurchase: json["min_purchase"],
        maxPurchase: json["max_purchase"],
      );
}

class ItemTotals {
  ItemTotals({
    required this.subtotal,
    required this.subtotalTax,
    required this.total,
    required this.tax,
  });

  String subtotal;
  int subtotalTax;
  int total;
  int tax;

  factory ItemTotals.fromJson(Map<String, dynamic> json) => ItemTotals(
        subtotal: json["subtotal"],
        subtotalTax: json["subtotal_tax"],
        total: json["total"],
        tax: json["tax"],
      );
}

class CartModelTotals {
  CartModelTotals({
    required this.subtotal,
    required this.subtotalTax,
    required this.feeTotal,
    required this.feeTax,
    required this.discountTotal,
    required this.discountTax,
    required this.shippingTotal,
    required this.shippingTax,
    required this.total,
    required this.totalTax,
  });

  String subtotal;
  String subtotalTax;
  String feeTotal;
  String feeTax;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String total;
  String totalTax;

  factory CartModelTotals.fromJson(Map<String, dynamic> json) =>
      CartModelTotals(
        subtotal: json["subtotal"],
        subtotalTax: json["subtotal_tax"],
        feeTotal: json["fee_total"],
        feeTax: json["fee_tax"],
        discountTotal: json["discount_total"],
        discountTax: json["discount_tax"],
        shippingTotal: json["shipping_total"],
        shippingTax: json["shipping_tax"],
        total: json["total"],
        totalTax: json["total_tax"],
      );
}
