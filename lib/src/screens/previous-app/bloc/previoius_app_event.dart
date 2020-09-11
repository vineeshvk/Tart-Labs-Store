import 'package:equatable/equatable.dart';

class PreviousAppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DownloadAppVersionEvent extends PreviousAppEvent {
  final String url;
  final String name;

  DownloadAppVersionEvent(this.url, this.name);

  @override
  String toString() => "DownloadAppEvent";
}

class ShareAppUrlEvent extends PreviousAppEvent {
  final String url;

  ShareAppUrlEvent(this.url);

  @override
  String toString() => "ShareAppUrlEvent";
}
