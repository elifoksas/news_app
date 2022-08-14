import '../models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryText = "iş dünyası";
  categoryModel.categoryName = "business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryText = "spor";
  categoryModel.categoryName = "sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryText = "teknoloji";
  categoryModel.categoryName = "technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1592659762303-90081d34b277?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1546&q=80";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryText = "sağlık";
  categoryModel.categoryName = "health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryText = "eğlence";
  categoryModel.categoryName = "entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1603739903239-8b6e64c3b185?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryText = "bilim";
  categoryModel.categoryName = "science";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryText = "genel";
  categoryModel.categoryName = "general";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80";
  category.add(categoryModel);

  return category;
}
