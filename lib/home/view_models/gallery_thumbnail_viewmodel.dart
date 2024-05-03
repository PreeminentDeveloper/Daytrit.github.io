import 'package:daytrit/home/models/dataModel/status_upload_model.dart';
import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';

class GalleryThumbnailProvider extends ChangeNotifier {
  int currentPage = 0;
  int? lastPage;
  List<StatusUploadModel> selectedMedia = [];
  List<StatusUploadModel> tickedImages = [];
  // List<AssetPathEntity> getAllAlbums = [];
  // List<AssetEntity> getAllMediaAlbums = [];

  // List<AssetEntity> getMedia = [];
  handleScrollEvent(ScrollNotification scroll, {String? title}) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        // fetchNewMedia(title!);
        // getMediaAlbums();
      }
    }
  }

  // fetchNewMedia(String title) async {
  //   lastPage = currentPage;
  //   final PermissionState ps = await PhotoManager.requestPermissionExtend();
  //   if (ps.isAuth) {
  //     List<AssetPathEntity> albums = await PhotoManager.getAssetPathList();
  //     AssetPathEntity? androidFolder;
  //     for (var album in albums) {
  //       if (album.name == title) {
  //         androidFolder = album;
  //         break;
  //       }
  //     }
  //     if (androidFolder != null) {
  //       List<AssetEntity> media = await androidFolder.getAssetListPaged(
  //           size: 60, page: currentPage); // Preloading files

  //       getMedia = media;
  //       notifyListeners();
  //     } else {
  //       print('Folder not found');
  //       // Handle the case when the desired folder is not found
  //     }
  //   } else {
  //     PhotoManager.openSetting();
  //   }
  // }

  // void toggleSelectedMedia(AssetEntity asset) async {
  //   final getAsset = await asset.file;
  //   bool isSelected = false;
  //   for (StatusUploadModel status in selectedMedia) {
  //     if (status.statusMedia.absolute.path == getAsset!.absolute.path) {
  //       isSelected = true;
  //       break;
  //     }
  //   }
  //   if (isSelected) {
  //     selectedMedia.removeWhere((status) =>
  //         status.statusMedia.absolute.path == getAsset!.absolute.path);
  //     notifyListeners();
  //   } else {
  //     selectedMedia.add(StatusUploadModel(statusMedia: getAsset!));
  //     notifyListeners();
  //   }
  // }

  // void toggleTickedMedia(AssetEntity asset) async {
  //   final getAsset = await asset.file;
  //   bool isSelected = false;
  //   for (StatusUploadModel status in tickedImages) {
  //     if (status.statusMedia.absolute.path == getAsset!.absolute.path) {
  //       isSelected = true;
  //       break;
  //     }
  //   }
  //   if (isSelected) {
  //     tickedImages.removeWhere((status) =>
  //         status.statusMedia.absolute.path == getAsset!.absolute.path);
  //     notifyListeners();
  //   } else {
  //     tickedImages.add(StatusUploadModel(statusMedia: getAsset!));
  //     notifyListeners();
  //   }
  // }

  // getMediaAlbums() async {
  //   lastPage = currentPage;
  //   final PermissionState ps = await PhotoManager.requestPermissionExtend();
  //   try {
  //     if (ps.isAuth) {
  //       List<AssetPathEntity> albums = await PhotoManager.getAssetPathList();
  //       getAllAlbums = albums;
  //       List<AssetEntity> media = await albums[0]
  //           .getAssetListPaged(size: 60, page: currentPage); //preloading files
  //       getAllMediaAlbums = media;
  //       notifyListeners();
  //       return getAllMediaAlbums;
  //     } else {
  //       PhotoManager.openSetting();
  //     }
  //   } catch (e) {
  //     //!TO BE IMPLEMENTED
  //   }
  // }
}
