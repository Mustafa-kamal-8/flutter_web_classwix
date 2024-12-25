class WorkshopModel {
  final int id;
  final String title;
  final String description;
  final String link;
  final DateTime createdAt;
  final DateTime updatedAt;

  WorkshopModel({
    required this.id,
    required this.title,
    required this.description,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create an instance from JSON
  factory WorkshopModel.fromJson(Map<String, dynamic> json) {
    return WorkshopModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'link': link,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

// Helper function to parse a list of workshopModels from JSON
List<WorkshopModel> workshopModelListFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => WorkshopModel.fromJson(json)).toList();
}

// Helper function to convert a list of workshopModels to JSON
List<Map<String, dynamic>> workshopModelListToJson(
    List<WorkshopModel> workshopModels) {
  return workshopModels.map((workshopModel) => workshopModel.toJson()).toList();
}
