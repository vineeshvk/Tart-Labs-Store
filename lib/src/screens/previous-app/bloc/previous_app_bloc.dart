import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:tartlabsstore/src/screens/previous-app/bloc/previoius_app_event.dart';
import 'package:tartlabsstore/src/screens/previous-app/bloc/previous_app_state.dart';
import 'package:tartlabsstore/src/utils/download_helper.dart';

class PreviousAppBloc extends Bloc<PreviousAppEvent, PreviousAppState> {
  PreviousAppBloc() : super(PreviousAppInitialState());

  @override
  Stream<PreviousAppState> mapEventToState(PreviousAppEvent event) async* {
    if (event is DownloadAppVersionEvent) {
      await DownloadHelper.downloadFile(event.url, event.name,event.createdAt);
    }

    if (event is ShareAppUrlEvent) {
      Share.share(event.url);
    }
  }
}
