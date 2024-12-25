class CourseCategoriesModel {
  final int id;
  final String title;
  final String slug;
  final int icon;
  final int thumbnail;
  final int? parentId;
  final int? userId; // Nullable userId
  final int statusId;
  final int isPopular;
  final DateTime? createdAt; // Nullable DateTime
  final DateTime? updatedAt; // Nullable DateTime

  CourseCategoriesModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.icon,
    required this.thumbnail,
    this.parentId,
    this.userId, // Nullable userId
    required this.statusId,
    required this.isPopular,
    this.createdAt, // Nullable DateTime
    this.updatedAt, // Nullable DateTime
  });

  factory CourseCategoriesModel.fromJson(Map<String, dynamic> json) {
    return CourseCategoriesModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      icon: json['icon'],
      thumbnail: json['thumbnail'],
      parentId: json['parent_id'],
      userId: json['user_id'], // This may be null
      statusId: json['status_id'],
      isPopular: json['is_popular'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null, // Handle nullable DateTime
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null, // Handle nullable DateTime
    );
  }

  static List<CourseCategoriesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => CourseCategoriesModel.fromJson(json))
        .toList();
  }
}
