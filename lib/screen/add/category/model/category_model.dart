class CategoryModel{
  String? title;
  int? id;

  CategoryModel({this.title, this.id});
  factory CategoryModel.mapToModel(Map m1)
  {
    return CategoryModel(id: m1["id"],title: m1["title"]);
  }
}