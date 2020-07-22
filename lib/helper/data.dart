import 'package:newsappp/models/category_model.dart';

List<CategoryModel> getCatories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel;

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1592924846804-3bda0e500761?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  return category;
}
