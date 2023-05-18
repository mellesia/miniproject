class Category_data {
  List<CategoryData>? categoryData;
  String? status;
  String? message;

  Category_data({this.categoryData, this.status, this.message});

  Category_data.fromJson(Map<String, dynamic> json) {
    if (json['category_data'] != null) {
      categoryData = <CategoryData>[];
      json['category_data'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryData != null) {
      data['category_data'] =
          this.categoryData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class CategoryData {
  int? groceryItemCategoryId;
  String? groceryItemCategoryName;
  String? groceryItemCategoryDesc;
  String? groceryItemCategoryImg;

  CategoryData(
      {this.groceryItemCategoryId,
        this.groceryItemCategoryName,
        this.groceryItemCategoryDesc,
        this.groceryItemCategoryImg});

  CategoryData.fromJson(Map<String, dynamic> json) {
    groceryItemCategoryId = json['grocery_item_category_id'];
    groceryItemCategoryName = json['grocery_item_category_name'];
    groceryItemCategoryDesc = json['grocery_item_category_desc'];
    groceryItemCategoryImg = json['grocery_item_category_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grocery_item_category_id'] = this.groceryItemCategoryId;
    data['grocery_item_category_name'] = this.groceryItemCategoryName;
    data['grocery_item_category_desc'] = this.groceryItemCategoryDesc;
    data['grocery_item_category_img'] = this.groceryItemCategoryImg;
    return data;
  }
}