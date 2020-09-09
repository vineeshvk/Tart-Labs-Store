import 'package:json_annotation/json_annotation.dart';
import 'package:tartlabsstore/src/models/app_model.dart';

part 'app_response.g.dart';

@JsonSerializable()
class AppResponse {
  @JsonKey(name: 'apps')
  List<AppModel> apps;

  AppResponse({this.apps});

  factory AppResponse.fromJson(Map<String, dynamic> map) =>
      _$AppResponseFromJson(map);
  Map<String, dynamic> toJson() => _$AppResponseToJson(this);
}
