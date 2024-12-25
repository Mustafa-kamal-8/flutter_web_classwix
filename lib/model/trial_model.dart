//Trial Model
class TrialModel {
  TrialModel({
    required this.course,
    required this.trialUsers,
  });
  late final String course;
  late final List<TrialUsers> trialUsers;

  TrialModel.fromJson(Map<String, dynamic> json) {
    course = json['course'];
    trialUsers = List.from(json['trial_users'])
        .map((e) => TrialUsers.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['course'] = course;
    data['trial_users'] = trialUsers.map((e) => e.toJson()).toList();
    return data;
  }
}

class TrialUsers {
  TrialUsers({
    required this.userId,
    required this.name,
    required this.email,
  });
  late final int userId;
  late final String name;
  late final String email;

  TrialUsers.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

//trails link model

class TrailsLinkModel {
  TrailsLinkModel({
    required this.trialLink,
    required this.description,
  });
  late final String trialLink;
  late final String description;

  TrailsLinkModel.fromJson(Map<String, dynamic> json) {
    trialLink = json['trial_link'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['trial_link'] = trialLink;
    _data['description'] = description;
    return _data;
  }
}
