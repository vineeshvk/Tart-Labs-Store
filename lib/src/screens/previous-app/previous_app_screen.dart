import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/models/app_url_model.dart';
import 'package:tartlabsstore/src/screens/previous-app/bloc/previoius_app_event.dart';
import 'package:tartlabsstore/src/screens/previous-app/bloc/previous_app_bloc.dart';
import 'package:tartlabsstore/src/utils/download_helper.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/app_display_card.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/custom_text.dart';
import 'package:tartlabsstore/src/widgets/version_display_card.dart';

class PreviousAppScreen extends StatefulWidget {
  final AppModel appDetail;
  final List<AppUrlModel> appUrls;

  const PreviousAppScreen({Key key, this.appDetail, this.appUrls})
      : super(key: key);
  @override
  _PreviousAppScreenState createState() => _PreviousAppScreenState();
}

class _PreviousAppScreenState extends State<PreviousAppScreen> {
  PreviousAppBloc _previousAppBloc;
  ReceivePort _port = ReceivePort();

  initState() {
    super.initState();

    _previousAppBloc = BlocProvider.of<PreviousAppBloc>(context);

    IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      if (status == DownloadTaskStatus.complete)
        FlutterDownloader.open(taskId: id);
    });
    FlutterDownloader.registerCallback(DownloadHelper.downloadCallback);
  }

  _onInstallButtonPressed(String url) {
    _previousAppBloc.add(DownloadAppVersionEvent(
      url,
      widget.appDetail.appName,
    ));
  }

  _onShareButtonPressed(String url) {
    _previousAppBloc.add(ShareAppUrlEvent(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomText(StringResources.tempAppTitleText, fontSize: 24),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AppDisplayCard(
              app: widget.appDetail,
              isSelectable: false,
            ),
            Container(margin: EdgeInsets.only(top: 10)),
            Expanded(
              child: ListView.separated(
                itemCount: widget.appUrls.length,
                separatorBuilder: (context, index) => Container(height: 10),
                itemBuilder: (context, index) {
                  return VersionDisplayCard(
                    previousApp: widget.appUrls[index],
                    onInstallButtonPressed: () =>
                        _onInstallButtonPressed(widget.appUrls[index].appUrl),
                    onShareButtonPressed: () =>
                        _onShareButtonPressed(widget.appUrls[index].appUrl),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    _port.close();
    _previousAppBloc.close();
    super.dispose();
  }
}

class PreviousAppScreenArguments {
  final AppModel appDetail;
  final List<AppUrlModel> appUrls;

  PreviousAppScreenArguments(this.appDetail, this.appUrls);
}
