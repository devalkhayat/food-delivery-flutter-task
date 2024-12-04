
class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String description;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.description});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {

    return CategoryModel(
        id: json['idCategory'],
        name: json['strCategory'],
        image: json['strCategoryThumb'],
        description: json['strCategoryDescription']);
  }
}

class CategoriesResponse {
  final List<CategoryModel> categories;
  CategoriesResponse({required this.categories});
  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {

    final List<CategoryModel> tempCategories = [];
    json["categories"].forEach((item) => tempCategories.add(CategoryModel.fromJson(item)));

    return CategoriesResponse(categories: tempCategories);
  }
}
