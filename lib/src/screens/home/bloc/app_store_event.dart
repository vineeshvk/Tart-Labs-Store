import 'package:equatable/equatable.dart';

class AppStoreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAppEvent extends AppStoreEvent {
  @override
  String toString() => "FetchAppEvent";
}
