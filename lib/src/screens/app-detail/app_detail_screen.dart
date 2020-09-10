import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tartlabsstore/routes.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_bloc.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_event.dart';
import 'package:tartlabsstore/src/screens/app-detail/bloc/app_detail_state.dart';
import 'package:tartlabsstore/src/screens/previous-app/previous_app_screen.dart';
import 'package:tartlabsstore/src/utils/color_resources.dart';
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

  initState() {
    super.initState();
    _appDetailBloc = BlocProvider.of<AppDetailBloc>(context)
      ..add(AppDetailFetchEvent(widget.appDetail.id));
  }

  void _onInstallButtonPressed(String url) {
    _appDetailBloc.add(AppInstallPressedEvent(url));
  }

  void _onShareButtonPressed() {}

  void _onViewOldBuildButtonPressed() {
    Navigator.pushNamed(context, AppRoutes.PREVIOUS_APP_SCREEN,
        arguments: PreviousAppScreenArguments(widget.appDetail));
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
                  onPressed: () => _onInstallButtonPressed(
                    state is AppDetailSuccessState
                        ? state.appUrls.last.appUrl
                        : "",
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  getSharebleLinkWidget() {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: _onShareButtonPressed,
            icon: Icon(Icons.share_outlined),
          ),
          CustomText(StringResources.getSharableAppLinkText)
        ],
      ),
    );
  }

  getAppDescriptionWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: CustomText(widget.appDetail.appDescription,
          color: Colors.grey, fontSize: 12),
    );
  }

  getWhatsNewWidget() {
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
            StringResources.tempBugFixText,
            color: Colors.white,
          ),
          Container(margin: EdgeInsets.only(top: 4)),
        ],
      ),
    );
  }

  getViewOlderBuildWidget() {
    return GestureDetector(
      onTap: _onViewOldBuildButtonPressed,
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
  }

  @override
  void dispose() {
    _appDetailBloc.close();
    super.dispose();
  }
}

class AppDetailScreenArguments {
  final AppModel appDetail;

  AppDetailScreenArguments(this.appDetail);
}
