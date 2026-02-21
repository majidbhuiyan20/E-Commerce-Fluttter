// {
// "_id": "6799c5d785b54cac3abec28f",
// "title": "New Category",
// "icon": "https://cdn.ostad.app/public/upload/2023-06-22T06-40-41.054Z-code-box-line.png",
// }

class CategoryModel {
  final String id;
  final String title;
  final String icon;

  CategoryModel({required this.id, required this.title, required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      title: json['title'],
      icon: json['icon'],
    );
  }
}
