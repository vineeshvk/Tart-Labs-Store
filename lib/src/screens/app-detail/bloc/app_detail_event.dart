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

class AppInstallPressedEvent extends AppDetailEvent {
  final String url;

  AppInstallPressedEvent(this.url);

  @override
  String toString() => "AppInstallPressedEvent";
}
