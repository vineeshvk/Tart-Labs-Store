import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tartlabsstore/src/utils/constants.dart';

class DownloadHelper {
  static Future<String> downloadFile(
      String url, String appName, DateTime createdAt) async {
    appName =
        "${appName.replaceAll(" ", "_")}_${createdAt.toIso8601String().substring(0, 10)}.apk";

    final localPath = await getPath();

    final isGranted = await checkPermission();
    if (!isGranted) return null;

    final fileExists = await File("$localPath/$appName").exists();

    if (!fileExists)
      await FlutterDownloader.enqueue(
        url: url.replaceFirst(":", "s:"),
        savedDir: localPath,
        showNotification: true,
        openFileFromNotification: true,
        fileName: "$appName",
      );
    else {
      await installApk("$localPath/$appName");
    }

    return "$localPath/$appName";
  }

  static Future<void> installApk(String appPath) async {
    InstallPlugin.installApk(appPath, Constants.ANDROID_PACKAGE_NAME);
  }

  static Future<String> getPath() async {
    final directory = await getExternalStorageDirectory();

    final localPath = directory.path;
    return localPath;
  }

  static Future<bool> checkPermission() async {
    final status = await Permission.storage.status;

    if (status == PermissionStatus.granted) return true;

    final result = await Permission.storage.request();
    if (result == PermissionStatus.granted) return true;

    return false;
  }

  static Future<void> downloadCallback(
      String id, DownloadTaskStatus status, int progress) async {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }
}
