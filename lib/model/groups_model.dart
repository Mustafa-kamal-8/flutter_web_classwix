class GroupsModel {
  GroupsModel({
    required this.message,
    required this.groups,
  });
  late final String message;
  late final List<Groups> groups;

  GroupsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    groups = List.from(json['groups']).map((e) => Groups.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['groups'] = groups.map((e) => e.toJson()).toList();
    return data;
  }
}

class Groups {
  Groups({
    required this.id,
    required this.courseId,
    required this.name,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
    required this.course,
  });
  late final int id;
  late final int courseId;
  late final String name;
  late final String description;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;
  late final List<Users> users;
  late final Course course;

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    name = json['name'];
    description = json['description'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = List.from(json['users']).map((e) => Users.fromJson(e)).toList();
    course = Course.fromJson(json['course']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['course_id'] = courseId;
    data['name'] = name;
    data['description'] = description;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['users'] = users.map((e) => e.toJson()).toList();
    data['course'] = course.toJson();
    return data;
  }
}

class Users {
  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.phoneVerifiedAt,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String phoneVerifiedAt;
  late final Null emailVerifiedAt;
  late final String createdAt;
  late final String updatedAt;
  late final Pivot pivot;

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    emailVerifiedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pivot'] = pivot.toJson();
    return data;
  }
}

class Pivot {
  Pivot({
    required this.groupId,
    required this.userId,
  });
  late final int groupId;
  late final int userId;

  Pivot.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['group_id'] = groupId;
    data['user_id'] = userId;
    return data;
  }
}

class Course {
  Course({
    required this.id,
    required this.title,
    required this.slug,
    required this.shortDescription,
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
    required this.thumbnail,
    this.courseOverviewType,
    required this.videoUrl,
    required this.language,
    required this.courseType,
    required this.isAdmin,
    required this.price,
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
    this.lastModified,
    required this.rating,
    required this.totalReview,
    required this.totalSales,
    required this.courseDuration,
    required this.point,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.liveClassLink,
    this.preRecordedVideos,
    this.classId,
    required this.classesId,
  });
  late final int id;
  late final String title;
  late final String slug;
  late final String shortDescription;
  late final String description;
  late final int courseCategoryId;
  late final Null requirements;
  late final Null outcomes;
  late final Null faq;
  late final Null tags;
  late final Null metaTitle;
  late final Null metaDescription;
  late final Null metaKeywords;
  late final Null metaAuthor;
  late final Null metaImage;
  late final int thumbnail;
  late final Null courseOverviewType;
  late final String videoUrl;
  late final String language;
  late final int courseType;
  late final int isAdmin;
  late final String price;
  late final int isDiscount;
  late final int discountType;
  late final Null discountPrice;
  late final Null discountStartDate;
  late final Null discountEndDate;
  late final Null instructorId;
  late final int isMultipleInstructor;
  late final Null partnerInstructors;
  late final int isFree;
  late final int levelId;
  late final int statusId;
  late final int visibilityId;
  late final Null lastModified;
  late final String rating;
  late final int totalReview;
  late final int totalSales;
  late final String courseDuration;
  late final String point;
  late final Null createdBy;
  late final Null updatedBy;
  late final Null deletedBy;
  late final Null deletedAt;
  late final String? createdAt;
  late final String? updatedAt;
  late final Null liveClassLink;
  late final Null preRecordedVideos;
  late final int? classId;
  late final int classesId;

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    description = json['description'];
    courseCategoryId = json['course_category_id'];
    requirements = null;
    outcomes = null;
    faq = null;
    tags = null;
    metaTitle = null;
    metaDescription = null;
    metaKeywords = null;
    metaAuthor = null;
    metaImage = null;
    thumbnail = json['thumbnail'];
    courseOverviewType = null;
    videoUrl = json['video_url'];
    language = json['language'];
    courseType = json['course_type'];
    isAdmin = json['is_admin'];
    price = json['price'];
    isDiscount = json['is_discount'];
    discountType = json['discount_type'];
    discountPrice = null;
    discountStartDate = null;
    discountEndDate = null;
    instructorId = null;
    isMultipleInstructor = json['is_multiple_instructor'];
    partnerInstructors = null;
    isFree = json['is_free'];
    levelId = json['level_id'];
    statusId = json['status_id'];
    visibilityId = json['visibility_id'];
    lastModified = null;
    rating = json['rating'];
    totalReview = json['total_review'];
    totalSales = json['total_sales'];
    courseDuration = json['course_duration'];
    point = json['point'];
    createdBy = null;
    updatedBy = null;
    deletedBy = null;
    deletedAt = null;
    createdAt = null;
    updatedAt = null;
    liveClassLink = null;
    preRecordedVideos = null;
    classId = null;
    classesId = json['classes_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['course_category_id'] = courseCategoryId;
    data['requirements'] = requirements;
    data['outcomes'] = outcomes;
    data['faq'] = faq;
    data['tags'] = tags;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['meta_author'] = metaAuthor;
    data['meta_image'] = metaImage;
    data['thumbnail'] = thumbnail;
    data['course_overview_type'] = courseOverviewType;
    data['video_url'] = videoUrl;
    data['language'] = language;
    data['course_type'] = courseType;
    data['is_admin'] = isAdmin;
    data['price'] = price;
    data['is_discount'] = isDiscount;
    data['discount_type'] = discountType;
    data['discount_price'] = discountPrice;
    data['discount_start_date'] = discountStartDate;
    data['discount_end_date'] = discountEndDate;
    data['instructor_id'] = instructorId;
    data['is_multiple_instructor'] = isMultipleInstructor;
    data['partner_instructors'] = partnerInstructors;
    data['is_free'] = isFree;
    data['level_id'] = levelId;
    data['status_id'] = statusId;
    data['visibility_id'] = visibilityId;
    data['last_modified'] = lastModified;
    data['rating'] = rating;
    data['total_review'] = totalReview;
    data['total_sales'] = totalSales;
    data['course_duration'] = courseDuration;
    data['point'] = point;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_by'] = deletedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['live_class_link'] = liveClassLink;
    data['pre_recorded_videos'] = preRecordedVideos;
    data['class_id'] = classId;
    data['classes_id'] = classesId;
    return data;
  }
}
