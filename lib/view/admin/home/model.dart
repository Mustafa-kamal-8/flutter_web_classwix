// File: models/course_category.dart

class CourseCategory {
  int id;
  String title;
  String slug;
  int icon;
  int thumbnail;
  int? parentId;
  int userId;
  int statusId;
  int isPopular;
  String createdAt;
  String updatedAt;
  List<Course> courses;

  CourseCategory({
    required this.id,
    required this.title,
    required this.slug,
    required this.icon,
    required this.thumbnail,
    this.parentId,
    required this.userId,
    required this.statusId,
    required this.isPopular,
    required this.createdAt,
    required this.updatedAt,
    required this.courses,
  });

  factory CourseCategory.fromJson(Map<String, dynamic> json) {
    return CourseCategory(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      icon: json['icon'],
      thumbnail: json['thumbnail'],
      parentId: json['parent_id'],
      userId: json['user_id'],
      statusId: json['status_id'],
      isPopular: json['is_popular'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      courses: (json['courses'] as List)
          .map((course) => Course.fromJson(course))
          .toList(),
    );
  }

  static List<CourseCategory>? fromJsonList(List<dynamic>? responseData) {
    if (responseData == null) return null;
    return responseData.map((data) => CourseCategory.fromJson(data)).toList();
  }
}

class Course {
  int id;
  String title;
  String slug;
  String? shortDescription;
  String description;
  int courseCategoryId;
  int? thumbnail;
  String language;
  int courseType;
  int isAdmin;
  int isDiscount;
  int discountType;
  int instructorId;
  int isFree;
  int levelId;
  int statusId;
  int visibilityId;
  String rating;
  int totalReview;
  int totalSales;
  String courseDuration;
  String point;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  String? deletedAt;
  String createdAt;
  String updatedAt;
  String? liveClassLink;
  String? preRecordedVideos;
  String thumbnailUrl;
  ThumbnailUpload? thumbnailUpload;

  Course({
    required this.id,
    required this.title,
    required this.slug,
    this.shortDescription,
    required this.description,
    required this.courseCategoryId,
    this.thumbnail,
    required this.language,
    required this.courseType,
    required this.isAdmin,
    required this.isDiscount,
    required this.discountType,
    required this.instructorId,
    required this.isFree,
    required this.levelId,
    required this.statusId,
    required this.visibilityId,
    required this.rating,
    required this.totalReview,
    required this.totalSales,
    required this.courseDuration,
    required this.point,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.liveClassLink,
    this.preRecordedVideos,
    required this.thumbnailUrl,
    this.thumbnailUpload,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      shortDescription: json['short_description'],
      description: json['description'],
      courseCategoryId: json['course_category_id'],
      thumbnail: json['thumbnail'],
      language: json['language'],
      courseType: json['course_type'],
      isAdmin: json['is_admin'],
      isDiscount: json['is_discount'],
      discountType: json['discount_type'],
      instructorId: json['instructor_id'],
      isFree: json['is_free'],
      levelId: json['level_id'],
      statusId: json['status_id'],
      visibilityId: json['visibility_id'],
      rating: json['rating'],
      totalReview: json['total_review'],
      totalSales: json['total_sales'],
      courseDuration: json['course_duration'],
      point: json['point'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      liveClassLink: json['live_class_link'],
      preRecordedVideos: json['pre_recorded_videos'],
      thumbnailUrl: json['thumbnail_url'],
      thumbnailUpload: json['thumbnail_upload'] != null
          ? ThumbnailUpload.fromJson(json['thumbnail_upload'])
          : null,
    );
  }
}

class ThumbnailUpload {
  int id;
  String filePath;
  String? fileName;
  String mimeType;
  String? size;
  String fileType;
  String? uploadedBy;
  String createdAt;
  String updatedAt;

  ThumbnailUpload({
    required this.id,
    required this.filePath,
    this.fileName,
    required this.mimeType,
    this.size,
    required this.fileType,
    this.uploadedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ThumbnailUpload.fromJson(Map<String, dynamic> json) {
    return ThumbnailUpload(
      id: json['id'],
      filePath: json['file_path'],
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      size: json['size'],
      fileType: json['file_type'],
      uploadedBy: json['uploaded_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
