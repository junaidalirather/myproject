// ignore_for_file: unused_element, depend_on_referenced_packages

import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppUpdate extends GetxController {
  //device path to download
  late String _localPath;

  //port to receive updte on notification bar
  final ReceivePort _port = ReceivePort();

  //Download progress
  RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    if(!kIsWeb) {
      if (Platform.isAndroid) {
        //create background isolate to listen for progreesss
        _bindBackgroundIsolate();

        FlutterDownloader.registerCallback(downloadCallback);
      }
    }
    super.onInit();
  }


  Future<String?> requestDownload(TaskInfo task) async {
    return await FlutterDownloader.enqueue(
      url: task.link!,
      headers: {'auth': 'test_for_sql_encoding'},
      savedDir: _localPath,
      showNotification: true,
      saveInPublicStorage: true,
      openFileFromNotification: true,
    );
  }

  Future<void> _pauseDownload(TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  Future<void> _resumeDownload(TaskInfo task) async {
    final newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<void> _retryDownload(TaskInfo task) async {
    final newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    debugPrint(
      'Callback on background isolate: '
      'task ($id) is in status ($status) and process ($progress)',
    );

    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }

  Future<bool> openDownloadedFile(String? task) {
    if (task != null) {
      return FlutterDownloader.open(taskId: task);
    } else {
      return Future.value(false);
    }
  }

  Future<bool> checkPermission() async {
    if (Platform.isIOS) {
      return true;
    }
    final status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      final result = await Permission.storage.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    debugPrint(savedDir.toString());
    final hasExisted = savedDir.existsSync();
    if (!hasExisted) {
      await savedDir.create();
    }
  }

  Future<bool> deleteFile(String fileName) async {
    File file = File('$_localPath/$fileName');
    try {
      if (await file.exists()) {
        await file.delete();
        return true;
      } else {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }


  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      (data as List<dynamic>)[0] as String;
      final status = data[1] as DownloadTaskStatus;
      final progress = data[2];

      //if(progress is more than zero update the ui with current value
      if (progress >= 0) {
        this.progress.value = progress.toDouble();
      }
      //if the status is 4 the download is failed go back to update pop up
      if (status.value == 4) {
        Get.back();
      }
      /*  if (status.value == 3 && progress as int == 100) {

        openDownloadedFile(Get.find<VehicleDetailsController>().task.taskId);
      }*/
      /*    debugPrint(
        'Callback on UI isolate: '
        'task ($taskId) is in status ($status) and process ($progress)',
      );*/
    });
  }

  //unbinbd isolate once the controler is is destroyed
  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @override
  void onClose() {
    _unbindBackgroundIsolate();
    super.onClose();
  }
}

//basic information if the apk
class TaskInfo {
  TaskInfo({this.name, this.link});

  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;
}
