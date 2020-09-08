import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/screens/app-details/app_details_screen.dart';
import 'package:tartlabsstore/src/screens/home/bloc/app_store_bloc.dart';
import 'package:tartlabsstore/src/screens/home/bloc/app_store_event.dart';
import 'package:tartlabsstore/src/screens/home/bloc/app_store_state.dart';
import 'package:tartlabsstore/src/utils/image_resources.dart';
import 'package:tartlabsstore/src/widgets/app_display_card.dart';
import 'package:tartlabsstore/src/widgets/custom_appbar.dart';
import 'package:tartlabsstore/src/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppStoreBloc _appStoreBloc;

  @override
  void initState() {
    super.initState();
    _appStoreBloc = BlocProvider.of<AppStoreBloc>(context)
      ..add(FetchAppEvent());
  }

  void _onAppTilePressed(AppModel appDetail) {
    Navigator.pushNamed(context, AppDetailsScreen.routeName,
        arguments: AppDetailsScreenArguments(appDetail));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        title: Image.asset(
          ImageResources.tartlabsStoreAppBarImage,
          width: 146,
        ),
      ),
      body: BlocBuilder(
        cubit: _appStoreBloc,
        builder: (context, state) {
          if (state is FetchAppSuccessState)
            return ListView.separated(
              padding: EdgeInsets.all(10),
              itemCount: state.apps.length,
              separatorBuilder: (context, index) => Container(height: 10),
              itemBuilder: (context, index) {
                return AppDisplayCard(
                  app: state.apps[index],
                  onTap: () => _onAppTilePressed(state.apps[index]),
                );
              },
            );
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    _appStoreBloc.close();
    super.dispose();
  }
}
