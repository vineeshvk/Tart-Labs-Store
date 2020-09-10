import 'dart:async';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadHelper {
  static Future<void> downloadFile(String url) async {
    final localPath = await getPath();
    print("url $localPath");
    final isGranted = await checkPermission();

    if (!isGranted) return;

    final taskId = await FlutterDownloader.enqueue(
      url: url.replaceFirst(":", "s:"),
      savedDir: localPath,
      showNotification: true,
      openFileFromNotification: true,
    );
    await FlutterDownloader.open(taskId: taskId);
  }

  static Future<String> getPath() async {
    final directory = await getExternalStorageDirectory();

    final localPath = directory.path;
    return localPath;
  }

  static Future<bool> checkPermission() async {
    final status = await Permission.storage.status;
    print("state $status");
    if (status == PermissionStatus.granted) return true;

    final result = await Permission.storage.request();
    if (result == PermissionStatus.granted) return true;

    return false;
  }
}
