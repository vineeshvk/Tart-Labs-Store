import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabsstore/src/repositories/app_store_repository.dart';
import 'package:tartlabsstore/src/screens/home/bloc/app_store_event.dart';
import 'package:tartlabsstore/src/screens/home/bloc/app_store_state.dart';

class AppStoreBloc extends Bloc<AppStoreEvent, AppStoreState> {
  AppStoreBloc() : super(AppStoreInitialState());

  @override
  Stream<AppStoreState> mapEventToState(AppStoreEvent event) async* {
    if (event is FetchAppEvent) {
      try {
        yield FetchAppLoadingState();
        final response = await AppStoreRepository.fetchApps();
        yield FetchAppSuccessState(response.apps);
      } catch (e) {
        yield FetchAppFailureState(e.toString());
      }
    }
  }
}
