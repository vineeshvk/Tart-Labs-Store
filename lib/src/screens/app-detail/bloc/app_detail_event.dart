import 'package:equatable/equatable.dart';

class AppDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppDetailFetchEvent extends AppDetailEvent {
  final int appId;

  AppDetailFetchEvent(this.appId);

  @override
  List<Object> get props => [];

  @override
  String toString() => "AppDetailFetchEvent";
}

class DownloadAppEvent extends AppDetailEvent {
  final String url;
  final String name;

  DownloadAppEvent(this.url, this.name);

  @override
  String toString() => "DownloadAppEvent";
}

class InstallAppFailedEvent extends AppDetailEvent {
  @override
  String toString() => "InstallAppFailedEvent";
}

class ShareAppUrlEvent extends AppDetailEvent {
  final String url;

  ShareAppUrlEvent(this.url);

  @override
  String toString() => "ShareAppUrlEvent";
}
