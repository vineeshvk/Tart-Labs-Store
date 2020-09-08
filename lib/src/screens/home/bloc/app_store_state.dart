import 'package:equatable/equatable.dart';
import 'package:tartlabsstore/src/models/app_model.dart';

class AppStoreState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStoreInitialState extends AppStoreState {
  @override
  String toString() => "AppStoreInitialState";
}

class FetchAppLoadingState extends AppStoreState {
  @override
  String toString() => "FetchAppLoadingState";
}

class FetchAppSuccessState extends AppStoreState {
  final List<AppModel> apps;

  FetchAppSuccessState(this.apps);

  @override
  String toString() => "FetchAppSuccessState";
}

class FetchAppFailureState extends AppStoreState {
  final String error;

  FetchAppFailureState(this.error);

  @override
  String toString() => "FetchAppFailureState";
}
