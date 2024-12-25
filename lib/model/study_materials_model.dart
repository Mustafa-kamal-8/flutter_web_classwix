class StudyMaterialsModel {
  final int id;
  final int courseId;
  final String photo;
  final String? pdf;
  final String? audio;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Constructor
  StudyMaterialsModel({
    required this.id,
    required this.courseId,
    required this.photo,
    this.pdf,
    this.audio,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to convert JSON to StudyMaterialsModel
  factory StudyMaterialsModel.fromJson(Map<String, dynamic> json) {
    return StudyMaterialsModel(
      id: json['id'],
      courseId: json['course_id'],
      photo: json['photo'],
      pdf: json['pdf'],
      audio: json['audio'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert StudyMaterialsModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'photo': photo,
      'pdf': pdf,
      'audio': audio,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
