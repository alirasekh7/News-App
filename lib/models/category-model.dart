// category-model.dart
class Category {
  final String CategoryName;
  final String ImagePath;

  Category({required this.CategoryName, required this.ImagePath});

  static List<Category> getCategory() {
    return [
      Category(CategoryName: "Business", ImagePath: ""),
      Category(CategoryName: "Entertainment", ImagePath: ""),
      Category(CategoryName: "General", ImagePath: ""),
      Category(CategoryName: "Health", ImagePath: ""),
      Category(CategoryName: "Science", ImagePath: ""),
      Category(CategoryName: "Sports", ImagePath: ""),
      Category(CategoryName: "Technology", ImagePath: ""),

    ];
  }
}
