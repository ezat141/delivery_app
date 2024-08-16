class MyFavoriteModel {
  String? sId;
  FavoriteUsersid? favoriteUsersid;
  FavoriteProductsid? favoriteProductsid;

  MyFavoriteModel({this.sId, this.favoriteUsersid, this.favoriteProductsid});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    favoriteUsersid = json['favorite_usersid'] != null
        ? new FavoriteUsersid.fromJson(json['favorite_usersid'])
        : null;
    favoriteProductsid = json['favorite_productsid'] != null
        ? new FavoriteProductsid.fromJson(json['favorite_productsid'])
        : null;
  }

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.favoriteUsersid != null) {
      data['favorite_usersid'] = this.favoriteUsersid!.toJson();
    }
    if (this.favoriteProductsid != null) {
      data['favorite_productsid'] = this.favoriteProductsid!.toJson();
    }
    return data;
  }
}

class FavoriteUsersid {
  String? sId;

  FavoriteUsersid({this.sId});

  FavoriteUsersid.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}

class FavoriteProductsid {
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
  String? productDate;

  FavoriteProductsid(
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
      this.productDate});

  FavoriteProductsid.fromJson(Map<String, dynamic> json) {
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
    productDate = json['product_date'];
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
    data['product_date'] = this.productDate;
    return data;
  }
}