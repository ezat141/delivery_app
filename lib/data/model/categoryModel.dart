class CategoryModel {
  String? sId;
  String? categoryName;
  String? categoryNameAr;
  String? image;
  String? categoryDatetime;

  CategoryModel(
      {this.sId,
      this.categoryName,
      this.categoryNameAr,
      this.image,
      this.categoryDatetime});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    image = json['image'];
    categoryDatetime = json['category_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['image'] = this.image;
    data['category_datetime'] = this.categoryDatetime;
    return data;
  }
}
