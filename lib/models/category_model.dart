class CategoryModel {
  String categoryName;
  String imageUrl;

  CategoryModel({this.categoryName, this.imageUrl});
}

final List<CategoryModel> getCategories = [
  CategoryModel(categoryName : "Business", imageUrl : "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"),
  CategoryModel(categoryName : "Clasical", imageUrl : "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"),
];
