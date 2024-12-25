class VideoModel {
  final int id;
  final int courseId;
  final String title;
  final String videoPath;
  final int playLimit;
  final int timesPlayed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int groupId;

  VideoModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.videoPath,
    required this.playLimit,
    required this.timesPlayed,
    this.createdAt,
    this.updatedAt,
    required this.groupId,
  });

  // Factory method to create VideoModel from JSON
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      courseId: json['course_id'],
      title: json['title'],
      videoPath: json['video_path'],
      playLimit: json['play_limit'],
      timesPlayed: json['times_played'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      groupId: json['group_id'],
    );
  }

  // Method to convert VideoModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'title': title,
      'video_path': videoPath,
      'play_limit': playLimit,
      'times_played': timesPlayed,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'group_id': groupId,
    };
  }
}

// Function to convert JSON list to a List of VideoModel objects
List<VideoModel> videoModelFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => VideoModel.fromJson(json)).toList();
}

// Function to convert a List of VideoModel objects to JSON list
List<Map<String, dynamic>> videoModelToJson(List<VideoModel> videoList) {
  return videoList.map((video) => video.toJson()).toList();
}
