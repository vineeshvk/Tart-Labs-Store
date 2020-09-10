import 'package:json_annotation/json_annotation.dart';
import 'package:tartlabsstore/src/models/app_url_model.dart';

part 'app_url_response.g.dart';

@JsonSerializable()
class AppUrlResponse {
  @JsonKey(name: 'appUrls')
  List<AppUrlModel> appUrls;

  AppUrlResponse({this.appUrls});

  factory AppUrlResponse.fromJson(Map<String, dynamic> map) =>
      _$AppUrlResponseFromJson(map);
  Map<String, dynamic> toJson() => _$AppUrlResponseToJson(this);
}
