class CoursesModel {
  final List<Course> courses;

  CoursesModel({required this.courses});

  factory CoursesModel.fromJson(List<dynamic> jsonList) {
    List<Course> courses =
        jsonList.map((json) => Course.fromJson(json)).toList();
    return CoursesModel(courses: courses);
  }
}

class Course {
  final dynamic id;
  final dynamic title;
  final dynamic slug;
  final dynamic shortDescription;
  final dynamic description;
  final dynamic courseCategoryId;
  final dynamic requirements;
  final dynamic outcomes;
  final dynamic faq;
  final dynamic tags;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final dynamic metaKeywords;
  final dynamic metaAuthor;
  final dynamic metaImage;
  final dynamic thumbnail;
  final dynamic videoUrl;
  final dynamic language;
  final dynamic courseType;
  final dynamic isAdmin;
  final dynamic price;
  final dynamic isDiscount;
  final dynamic discountType;
  final dynamic discountPrice;
  final dynamic discountStartDate;
  final dynamic discountEndDate;
  final dynamic instructorId;
  final bool isMultipleInstructor;
  final dynamic partnerInstructors;
  final bool isFree;
  final dynamic levelId;
  final dynamic statusId;
  final dynamic visibilityId;
  final dynamic rating;
  final dynamic totalReview;
  final dynamic totalSales;
  final dynamic courseDuration;
  final dynamic point;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic liveClassLink;
  final dynamic preRecordedVideos;
  final dynamic classId;
  final dynamic classesId;
  final Category category;

  Course({
    required this.id,
    required this.title,
    required this.slug,
    this.shortDescription,
    required this.description,
    required this.courseCategoryId,
    this.requirements,
    this.outcomes,
    this.faq,
    this.tags,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.metaAuthor,
    this.metaImage,
    this.thumbnail,
    this.videoUrl,
    required this.language,
    required this.courseType,
    required this.isAdmin,
    this.price,
    required this.isDiscount,
    required this.discountType,
    this.discountPrice,
    this.discountStartDate,
    this.discountEndDate,
    this.instructorId,
    required this.isMultipleInstructor,
    this.partnerInstructors,
    required this.isFree,
    required this.levelId,
    required this.statusId,
    required this.visibilityId,
    required this.rating,
    required this.totalReview,
    required this.totalSales,
    required this.courseDuration,
    required this.point,
    this.createdAt,
    this.updatedAt,
    this.liveClassLink,
    this.preRecordedVideos,
    this.classId,
    this.classesId,
    required this.category,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      shortDescription: json['short_description'],
      description: json['description'],
      courseCategoryId: json['course_category_id'],
      requirements: json['requirements'],
      outcomes: json['outcomes'],
      faq: json['faq'],
      tags: json['tags'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaKeywords: json['meta_keywords'],
      metaAuthor: json['meta_author'],
      metaImage: json['meta_image'],
      thumbnail: json['thumbnail'],
      videoUrl: json['video_url'],
      language: json['language'],
      courseType: json['course_type'],
      isAdmin: json['is_admin'],
      price:
          json['price'] != null ? int.tryParse(json['price'].toString()) : null,
      isDiscount: json['is_discount'],
      discountType: json['discount_type'],
      discountPrice: json['discount_price'] != null
          ? int.tryParse(json['discount_price'].toString())
          : null,
      discountStartDate: json['discount_start_date'],
      discountEndDate: json['discount_end_date'],
      instructorId: json['instructor_id'],
      isMultipleInstructor: json['is_multiple_instructor'] == 1,
      partnerInstructors: json['partner_instructors'],
      isFree: json['is_free'] == 1,
      levelId: json['level_id'],
      statusId: json['status_id'],
      visibilityId: json['visibility_id'],
      rating: json['rating'],
      totalReview: json['total_review'],
      totalSales: json['total_sales'],
      courseDuration: json['course_duration'],
      point: json['point'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      liveClassLink: json['live_class_link'],
      preRecordedVideos: json['pre_recorded_videos'],
      classId: json['class_id'],
      classesId: json['classes_id'],
      category: Category.fromJson(json['category']),
    );
  }
}

class Category {
  final int id;
  final String title;
  final String slug;
  final int? icon;
  final int? thumbnail;
  final int? userId;
  final int statusId;
  final bool isPopular;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Category({
    required this.id,
    required this.title,
    required this.slug,
    this.icon,
    this.thumbnail,
    this.userId,
    required this.statusId,
    required this.isPopular,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      icon: json['icon'],
      thumbnail: json['thumbnail'],
      userId: json['user_id'],
      statusId: json['status_id'],
      isPopular: json['is_popular'] == 1,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}
