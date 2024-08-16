class CartModel {
  int? productsprice;
  Product? product;
  int? quantity;
  int? cartOrders;
  String? sId;

  CartModel(
      {this.productsprice,
      this.product,
      this.quantity,
      this.cartOrders,
      this.sId});

  CartModel.fromJson(Map<String, dynamic> json) {
    productsprice = json['productsprice'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    cartOrders = json['cart_orders'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productsprice'] = this.productsprice;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['cart_orders'] = this.cartOrders;
    data['_id'] = this.sId;
    return data;
  }
}

class Product {
  String? sId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  String? image;
  int? productCount;
  bool? productActive;
  int? productPrice;
  int? productDiscount;
  String? productCat;
  bool? favorite;
  String? productDate;
  int? iV;

  Product(
      {this.sId,
      this.productName,
      this.productNameAr,
      this.productDesc,
      this.productDescAr,
      this.image,
      this.productCount,
      this.productActive,
      this.productPrice,
      this.productDiscount,
      this.productCat,
      this.favorite,
      this.productDate,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    image = json['image'];
    productCount = json['product_count'];
    productActive = json['product_active'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productCat = json['product_cat'];
    favorite = json['favorite'];
    productDate = json['product_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_desc'] = this.productDesc;
    data['product_desc_ar'] = this.productDescAr;
    data['image'] = this.image;
    data['product_count'] = this.productCount;
    data['product_active'] = this.productActive;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_cat'] = this.productCat;
    data['favorite'] = this.favorite;
    data['product_date'] = this.productDate;
    data['__v'] = this.iV;
    return data;
  }
}
