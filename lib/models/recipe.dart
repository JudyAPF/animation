class Recipe {
  Recipe({
    required this.id,
    required this.categoryId,
    required this.name,
    this.steps,
    this.ingredients,
    this.duration = 0,
    this.imageUrl,
    this.isFavorite = false,
  });

  final int id;
  final int categoryId;
  final String name;
  final List<String>? steps;
  final List<String>? ingredients;
  final int duration;
  final String? imageUrl;
  bool isFavorite;
}
