import 'package:equatable/equatable.dart';
import 'package:tartlabsstore/src/models/app_url_model.dart';

class AppDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppDetailInitialState extends AppDetailState {
  @override
  String toString() => "AppDetailInitialState";
}

class AppDetailLoadingState extends AppDetailState {
  @override
  String toString() => "AppDetailLoadingState";
}

class AppDetailSuccessState extends AppDetailState {
  final List<AppUrlModel> appUrls;

  AppDetailSuccessState(this.appUrls);
  
  @override
  String toString() => "AppDetailSuccessState";
}

class AppDetailFailureState extends AppDetailState {
  @override
  String toString() => "AppDetailFailureState";
}
