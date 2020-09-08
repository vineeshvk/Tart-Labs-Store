class AppModel {
  final int id;
  final String appName;
  final String appLogo;
  final DateTime createdAt;
  final String appDescription;
  final DateTime updatedAt;
  final String appLink;

  AppModel({
    this.id,
    this.appLogo,
    this.appDescription,
    this.updatedAt,
    this.appLink,
    this.appName,
    this.createdAt,
  });

  factory AppModel.fromJson(Map json) {
    return AppModel(
      appName: json['app_name'],
      createdAt: DateTime.parse(json['created_at']),
      appDescription: json['app_description'],
      appLink: json['app_link'],
      appLogo: json['app_logo'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}