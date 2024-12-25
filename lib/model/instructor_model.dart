class InstructorModel {
  InstructorModel({
    required this.instructors,
  });
  late final List<Instructors> instructors;

  InstructorModel.fromJson(Map<String, dynamic> json) {
    instructors = List.from(json['instructors'])
        .map((e) => Instructors.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['instructors'] = instructors.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Instructors {
  Instructors({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.course,
    required this.group,
  });
  late final int id;
  late final int userId;
  late final int courseId;
  late final int groupId;
  late final String createdAt;
  late final String updatedAt;
  late final User user;
  late final Course course;
  late final Group group;

  Instructors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    groupId = json['group_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = User.fromJson(json['user']);
    course = Course.fromJson(json['course']);
    group = Group.fromJson(json['group']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['course_id'] = courseId;
    _data['group_id'] = groupId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user'] = user.toJson();
    _data['course'] = course.toJson();
    _data['group'] = group.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.phoneVerifiedAt,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String phoneVerifiedAt;
  late final Null emailVerifiedAt;
  late final String createdAt;
  late final String updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    emailVerifiedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['phone_verified_at'] = phoneVerifiedAt;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Course {
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
    required this.thumbnail,
    this.courseOverviewType,
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
    required this.createdAt,
    required this.updatedAt,
    this.liveClassLink,
    this.preRecordedVideos,
    this.classId,
    required this.classesId,
  });
  late final int id;
  late final String title;
  late final String slug;
  late final String? shortDescription;
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
  late final String? videoUrl;
  late final String language;
  late final int courseType;
  late final int isAdmin;
  late final String? price;
  late final int isDiscount;
  late final int discountType;
  late final Null discountPrice;
  late final Null discountStartDate;
  late final Null discountEndDate;
  late final int? instructorId;
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
  late final String createdAt;
  late final String updatedAt;
  late final Null liveClassLink;
  late final Null preRecordedVideos;
  late final Null classId;
  late final int classesId;

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = null;
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
    videoUrl = null;
    language = json['language'];
    courseType = json['course_type'];
    isAdmin = json['is_admin'];
    price = null;
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    liveClassLink = null;
    preRecordedVideos = null;
    classId = null;
    classesId = json['classes_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['slug'] = slug;
    _data['short_description'] = shortDescription;
    _data['description'] = description;
    _data['course_category_id'] = courseCategoryId;
    _data['requirements'] = requirements;
    _data['outcomes'] = outcomes;
    _data['faq'] = faq;
    _data['tags'] = tags;
    _data['meta_title'] = metaTitle;
    _data['meta_description'] = metaDescription;
    _data['meta_keywords'] = metaKeywords;
    _data['meta_author'] = metaAuthor;
    _data['meta_image'] = metaImage;
    _data['thumbnail'] = thumbnail;
    _data['course_overview_type'] = courseOverviewType;
    _data['video_url'] = videoUrl;
    _data['language'] = language;
    _data['course_type'] = courseType;
    _data['is_admin'] = isAdmin;
    _data['price'] = price;
    _data['is_discount'] = isDiscount;
    _data['discount_type'] = discountType;
    _data['discount_price'] = discountPrice;
    _data['discount_start_date'] = discountStartDate;
    _data['discount_end_date'] = discountEndDate;
    _data['instructor_id'] = instructorId;
    _data['is_multiple_instructor'] = isMultipleInstructor;
    _data['partner_instructors'] = partnerInstructors;
    _data['is_free'] = isFree;
    _data['level_id'] = levelId;
    _data['status_id'] = statusId;
    _data['visibility_id'] = visibilityId;
    _data['last_modified'] = lastModified;
    _data['rating'] = rating;
    _data['total_review'] = totalReview;
    _data['total_sales'] = totalSales;
    _data['course_duration'] = courseDuration;
    _data['point'] = point;
    _data['created_by'] = createdBy;
    _data['updated_by'] = updatedBy;
    _data['deleted_by'] = deletedBy;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['live_class_link'] = liveClassLink;
    _data['pre_recorded_videos'] = preRecordedVideos;
    _data['class_id'] = classId;
    _data['classes_id'] = classesId;
    return _data;
  }
}

class Group {
  Group({
    required this.id,
    required this.courseId,
    required this.name,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int courseId;
  late final String name;
  late final String description;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    name = json['name'];
    description = json['description'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['course_id'] = courseId;
    _data['name'] = name;
    _data['description'] = description;
    _data['created_by'] = createdBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
