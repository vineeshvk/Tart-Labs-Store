import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:tartlabsstore/src/repositories/app_url_repository.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_event.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_state.dart';
import 'package:tartlabsstore/src/utils/app_utils.dart';
import 'package:tartlabsstore/src/utils/download_helper.dart';

class AppDetailBloc extends Bloc<AppDetailEvent, AppDetailState> {
  AppDetailBloc() : super(AppDetailInitialState());

  @override
  Stream<AppDetailState> mapEventToState(AppDetailEvent event) async* {
    if (event is AppDetailFetchEvent) {
      yield AppDetailLoadingState();
      final response = await AppUrlRepository.getAppUrl(event.appId);

      if (response.appUrls != null) {
        yield AppDetailSuccessState(response.appUrls);
      } else {
        yield AppDetailFailureState();
      }
    }

    if (event is DownloadAppEvent) {
      await DownloadHelper.downloadFile(event.url, event.name,event.createdAt);
    }

    if (event is InstallAppFailedEvent) {
      AppUtils.showToast("Install failed");
    }

    if (event is ShareAppUrlEvent) {
      Share.share(event.url);
    }
  }
}
