import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:tartlabsstore/routes.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/models/app_url_model.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_bloc.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_event.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_state.dart';
import 'package:tartlabsstore/src/screens/previous-app/previous_app_screen.dart';
import 'package:tartlabsstore/src/utils/color_resources.dart';
import 'package:tartlabsstore/src/utils/download_helper.dart';
import 'package:tartlabsstore/src/utils/string_resources.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/custom_text.dart';
import 'package:tartlabsstore/src/widgets/primary_button.dart';

class AppDetailScreen extends StatefulWidget {
  final AppModel appDetail;

  AppDetailScreen({this.appDetail});

  @override
  _AppDetailScreenState createState() => _AppDetailScreenState();
}

class _AppDetailScreenState extends State<AppDetailScreen> {
  AppDetailBloc _appDetailBloc;
  ReceivePort _port = ReceivePort();

  initState() {
    super.initState();
    _appDetailBloc = BlocProvider.of<AppDetailBloc>(context)
      ..add(AppDetailFetchEvent(widget.appDetail.id));

    IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      if (status == DownloadTaskStatus.complete)
        FlutterDownloader.open(taskId: id);
      if (status == DownloadTaskStatus.failed) {
        _appDetailBloc.add(InstallAppFailedEvent());
      }
    });
    FlutterDownloader.registerCallback(DownloadHelper.downloadCallback);
  }

  void _onInstallButtonPressed(String url) {
    _appDetailBloc.add(DownloadAppEvent(url, widget.appDetail.appName));
  }

  void _onShareButtonPressed(String url) {
    _appDetailBloc.add(ShareAppUrlEvent(url));
  }

  void _onViewOldBuildButtonPressed(List<AppUrlModel> appUrls) {
    Navigator.pushNamed(
      context,
      AppRoutes.PREVIOUS_APP_SCREEN,
      arguments: PreviousAppScreenArguments(
        widget.appDetail,
        appUrls.reversed.toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomText(
          widget.appDetail.appName,
          fontSize: 24,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 2),
              color: Colors.black.withOpacity(0.2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppDisplayWidget(),
            getSharebleLinkWidget(),
            getAppDescriptionWidget(),
            getWhatsNewWidget(),
            getViewOlderBuildWidget()
          ],
        ),
      ),
    );
  }

  Widget getAppDisplayWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.appDetail.appLogo,
            width: 67,
            height: 67,
          ),
          Container(margin: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(widget.appDetail.appName, fontSize: 16),
                CustomText(
                  DateFormat.MMMd().format(widget.appDetail.updatedAt),
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          BlocBuilder(
            cubit: _appDetailBloc,
            builder: (context, state) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  label: StringResources.installText,
                  onPressed: (state is AppDetailSuccessState &&
                          state.appUrls.length != 0)
                      ? () => _onInstallButtonPressed(
                            state.appUrls.last.appUrl ?? "",
                          )
                      : null,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  getSharebleLinkWidget() {
    return BlocBuilder(
      cubit: _appDetailBloc,
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (state is AppDetailSuccessState &&
                      state.appUrls.length != 0)
                    _onShareButtonPressed(state.appUrls.last.appUrl);
                },
                icon: Icon(Icons.share_outlined),
              ),
              CustomText(StringResources.getSharableAppLinkText)
            ],
          ),
        );
      },
    );
  }

  getAppDescriptionWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: CustomText(widget.appDetail.appDescription,
          color: Colors.grey, fontSize: 12),
    );
  }

  Widget getWhatsNewWidget() {
    return BlocBuilder(
      cubit: _appDetailBloc,
      builder: (c, state) {
        if (!(state is AppDetailSuccessState &&
            state.appUrls.length != 0 &&
            state.appUrls.last.description != null)) {
          return Container();
        }

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorResources.FADED_RED.withOpacity(0.8),
                ColorResources.FADED_RED.withOpacity(0.6),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                StringResources.whatsNewText,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              Container(margin: EdgeInsets.only(top: 4)),
              CustomText(
                state.appUrls.last.description ?? "",
                color: Colors.white,
              ),
              Container(margin: EdgeInsets.only(top: 4)),
            ],
          ),
        );
      },
    );
  }

  getViewOlderBuildWidget() {
    return BlocBuilder(
      cubit: _appDetailBloc,
      builder: (context, state) {
        if (!(state is AppDetailSuccessState && state.appUrls.length != 0))
          return Container();
        return GestureDetector(
          onTap: () => _onViewOldBuildButtonPressed(state.appUrls),
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                CustomText(
                  StringResources.viewOlderBuildsText,
                  fontSize: 12,
                ),
                Icon(Icons.navigate_next, color: ColorResources.FADED_RED)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    _port.close();
    _appDetailBloc.close();
    super.dispose();
  }
}

class AppDetailScreenArguments {
  final AppModel appDetail;

  AppDetailScreenArguments(this.appDetail);
}
