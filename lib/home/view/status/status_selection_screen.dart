// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:camera/camera.dart';
// import 'package:daytrit/home/view/status/display_selected_images.dart';
// import 'package:daytrit/home/view/status/status_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_video_info/flutter_video_info.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// List<CameraDescription>? cameras;

// bool _willExtraPop = false;
// bool isImageLoading = false;

// class StatusSelectionScreen extends StatefulWidget {
//   const StatusSelectionScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _StatusSelectionScreenState createState() => _StatusSelectionScreenState();
// }

// class _StatusSelectionScreenState extends State<StatusSelectionScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   CameraController? _cameraController;
//   int _cameraIndex = 0;
//   bool isShowGallery = true;

//   PanelController? _panelController;
//   String? filePath;

//   var info;
//   int currentPage = 0;
//   int? lastPage;
//   List<AssetEntity>? getAllAlbums;
//   int _seconds = 0;
//   bool alreadyTicked = false;
//   late Timer _timer;
//   bool isFlashOn = false;
//   bool isVideoRecording = false;
//   late Uint8List? thumbnailBytes;
//   final ScrollController _scrollController = ScrollController();

//   final videoInfo = FlutterVideoInfo();

//   bool isPermissionsGranted = false;
//   List<Permission> permissionsNeeded = [
//     Permission.camera,
//     Permission.microphone,
//     Permission.storage,
//     Permission.photos
//   ];

//   @override
//   void initState() {
//     super.initState();

//     initScreen();
//     _fetchNewMedia();

//     _panelController = PanelController();
//   }

//   void initScreen() async {
//     if (await allPermissionsGranted()) {
//       setState(() {
//         isPermissionsGranted = true;
//       });
//       startCamera();
//     } else {
//       requestPermission();
//     }
//   }

//   void startCamera() {
//     _initCamera(_cameraIndex);
//   }

//   void startCaptuerVideo() {
//     onVideoRecordButtonPressed(context);
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _seconds++;
//         if (_seconds == 30) {
//           onStopButtonPressed(context);
//           _timer.cancel();
//           _seconds = 0;
//         }
//       });
//     });
//   }

//   Future<bool> allPermissionsGranted() async {
//     bool resVideo = await Permission.camera.isGranted;
//     bool resAudio = await Permission.microphone.isGranted;
//     return resVideo && resAudio;
//   }

//   void requestPermission() async {
//     Map<Permission, PermissionStatus> statuses =
//         await permissionsNeeded.request();
//     if (statuses.values.every((status) => status == PermissionStatus.granted)) {
//       setState(() {
//         isPermissionsGranted = true;
//       });
//       startCamera();
//       _fetchNewMedia();
//     } else {
//       SnackBar(
//         content: Text('Permission denied'),
//         duration: Duration(seconds: 1),
//       );
//     }
//   }

//   void refreshGallery() {
//     _fetchNewMedia();
//   }

//   _handleScrollEvent(ScrollNotification scroll) {
//     if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
//       if (currentPage != lastPage) {
//         _fetchNewMedia();
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _disposeCamera();
//     if (_timer != null) {
//       _timer.cancel();
//     }
//     super.dispose();
//   }

//   _disposeCamera() {
//     _cameraController!.dispose();
//   }

//   _initCamera(int index) async {
//     if (_cameraController != null) {
//       await _cameraController!.dispose();
//     }
//     cameras = await availableCameras();

//     _cameraController =
//         CameraController(cameras![index], ResolutionPreset.high);

//     _cameraController!.addListener(() {
//       if (mounted) {
//         setState(() {
//           if (isFlashOn) {
//             _cameraController!.setFlashMode(FlashMode.always);
//           } else {
//             _cameraController!.setFlashMode(FlashMode.off);
//           }
//         });
//       }
//       if (_cameraController!.value.hasError) {
//         print('Camera error ${_cameraController!.value.errorDescription}');
//       }
//     });

//     try {
//       await _cameraController!.initialize();
//     } on CameraException catch (e) {
//       print(e);
//     }

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   Widget _cameraPreviewWidget() {
//     if (mounted) {
//       setState(() {});
//     }

//     if (_cameraController == null || !_cameraController!.value.isInitialized) {
//       return const Center(
//         child: Text(
//           '',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       );
//     } else {
//       return GestureDetector(
//         onTap: () {
//           setState(() {
//             isShowGallery = !isShowGallery;
//           });
//         },
//         child: AspectRatio(
//           aspectRatio: _cameraController!.value.aspectRatio / 2,
//           child: CameraPreview(_cameraController!),
//         ),
//       );
//     }
//   }

//   double _opacity = 0.0;
//   final double _minHeight = 210.0;

//   _fetchNewMedia() async {
//     lastPage = currentPage;
//     final PermissionState ps = await PhotoManager.requestPermissionExtend();
//     try {
//       if (ps.isAuth) {
//         List<AssetPathEntity> albums =
//             await PhotoManager.getAssetPathList(onlyAll: true);
//         List<AssetEntity> media =
//             await albums[0].getAssetListPaged(size: 60, page: currentPage);
//         getAllAlbums = media;
//         log('albums $albums');
//         return getAllAlbums;
//       } else {
//         PhotoManager.openSetting();
//       }
//       log('$ps THIS IS A WAYYYYYYYYY');
//     } catch (e) {
//       log('$e THIS IS THE IMAEGE EXCEPTION');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Container(
//         color: Colors.black,
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: <Widget>[
//             SlidingUpPanel(
//               controller: _panelController,
//               maxHeight: MediaQuery.of(context).size.height,
//               minHeight: _minHeight,
//               panel: Opacity(
//                 opacity: _opacity,
//                 child: DefaultTabController(
//                   length: 2,
//                   child: Scaffold(
//                     appBar: AppBar(
//                       bottom: TabBar(tabs: const [
//                         Text(
//                           'Recents',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                         Text(
//                           'Gallery',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ]),
//                       elevation: 0.0,
//                       backgroundColor:
//                           Theme.of(context).scaffoldBackgroundColor,
//                       leading: IconButton(
//                         color: Color(0xff00897b),
//                         icon: const Icon(Icons.arrow_back),
//                         onPressed: () {
//                           _panelController!.close();
//                         },
//                       ),
//                     ),
//                     body: TabBarView(
//                       children: [
//                         Stack(
//                           children: [
//                             Container(
//                                 color: Colors.white,
//                                 child: getAllAlbums!.isEmpty
//                                     ? CircularProgressIndicator()
//                                     : GridView.builder(
//                                         controller: _scrollController,
//                                         gridDelegate:
//                                             SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 4,
//                                           mainAxisSpacing: 6.0,
//                                           crossAxisSpacing: 6.0,
//                                         ),
//                                         itemCount: getAllAlbums!.length,
//                                         itemBuilder:
//                                             (BuildContext context, int index) {
//                                           return GestureDetector(
//                                             onTap: () async {
//                                               var getFile =
//                                                   await getAllAlbums![index]
//                                                       .file;
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           StatusScreen(
//                                                             file: getFile!,
//                                                           )));
//                                             },
//                                             child: Stack(
//                                               children: [
//                                                 Positioned.fill(
//                                                   child: AssetEntityImage(
//                                                     getAllAlbums![index],
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                                 if (getAllAlbums![index].type ==
//                                                     AssetType.video)
//                                                   Align(
//                                                     alignment:
//                                                         Alignment.bottomRight,
//                                                     child: Padding(
//                                                       padding: EdgeInsets.only(
//                                                           right: 5, bottom: 5),
//                                                       child: Icon(
//                                                         Icons.videocam,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       )),
//                           ],
//                         ),
//                         DisplaySelectedImages()
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               color: const Color.fromARGB(0, 0, 0, 0),
//               collapsed: isShowGallery ? _buildCollapsedPanel() : Container(),
//               body: Stack(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: _cameraController != null &&
//                                 _cameraController!.value.isRecordingVideo
//                             ? Colors.transparent
//                             : Colors.black,
//                         width: 5.0,
//                       ),
//                       color: Colors.black,
//                     ),
//                     child: _cameraPreviewWidget(),
//                   ),
//                   _cameraController != null &&
//                           _cameraController!.value.isRecordingVideo
//                       ? Padding(
//                           padding: EdgeInsets.only(bottom: 640),
//                           child: Center(
//                             child: Container(
//                               child: Text(
//                                 '00:${_seconds.toString().padLeft(2, '0')}',
//                                 style: TextStyle(
//                                     color: Colors.red,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           ),
//                         )
//                       : SizedBox(),
//                 ],
//               ),
//               onPanelSlide: (double pos) {
//                 setState(() {
//                   _opacity = pos;
//                 });
//               },
//             ),
//             Positioned(
//               bottom: 8.0,
//               child: Opacity(
//                   opacity: 1 - _opacity,
//                   child: Column(
//                     children: <Widget>[
//                       _buildCameraControls(context),
//                       Text(
//                         'Hold for Video, Tap for Photo',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                         textAlign: TextAlign.center,
//                       )
//                     ],
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _toggleCamera() {
//     setState(() {
//       if (_cameraIndex == 0) {
//         _cameraIndex = 1;
//       } else {
//         _cameraIndex = 0;
//       }
//     });
//     _initCamera(_cameraIndex);
//   }

//   Widget _buildCollapsedPanel() {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           const Icon(
//             Icons.keyboard_arrow_up,
//             color: Colors.white,
//           ),
//           _buildGalleryItems(),
//         ],
//       ),
//     );
//   }

//   String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

//   Future<String?> _takePicture() async {
//     if (!_cameraController!.value.isInitialized) {
//       const SnackBar(content: Text('Error: camera is not initialized'));
//     }

//     if (_cameraController!.value.isTakingPicture) {
//       return null;
//     }

//     try {
//       await _cameraController!
//           .takePicture()
//           .then((value) => filePath = value.path);
//     } on CameraException catch (e) {
//       SnackBar(content: Text('Error: ${e.description}'));
//     }
//     return filePath;
//   }

//   Future<String?> startVideoRecording() async {
//     if (!_cameraController!.value.isInitialized) {
//       const SnackBar(content: Text('Error: camera is not initialized'));
//       return null;
//     }

//     if (_cameraController!.value.isRecordingVideo) {
//       return null;
//     }

//     try {
//       await _cameraController!.startVideoRecording();
//     } on CameraException catch (e) {
//       SnackBar(content: Text('Error: ${e.description}'));
//       return null;
//     }
//     return filePath;
//   }

//   Future<XFile?> stopVideoRecording() async {
//     if (!_cameraController!.value.isRecordingVideo) {
//       return null;
//     }

//     try {
//       return _cameraController!.stopVideoRecording();
//     } on CameraException catch (e) {
//       SnackBar(content: Text('Error: ${e.description}'));
//     }
//     return null;
//   }

//   void onTakePictureButtonPressed(BuildContext context) {
//     log('kkkk');
//     _takePicture().then((String? filePath) async {
//       if (mounted) {
//         setState(() {});
//       }
//       if (filePath != null) {
//         log('nfn');
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => StatusScreen(file: File(filePath))));
//         refreshGallery();
//       }
//     });
//   }

//   void onVideoRecordButtonPressed(BuildContext context) {
//     startVideoRecording().then((String? filePath) async {
//       if (mounted) {
//         setState(() {});
//       }

//       if (filePath != null) {
//         refreshGallery();
//       }
//     });
//   }

//   void onStopButtonPressed(BuildContext context) {
//     stopVideoRecording().then((XFile? filePath) async {
//       if (mounted) {
//         setState(() {});
//       }
//       info = await videoInfo.getVideoInfo(filePath!.path);
//       print("videoPath: ${filePath.path} Duration: ${info.duration}");

//       if (filePath != null) {
//         _seconds = 0;
//         _timer.cancel();
//       }
//     });
//   }

//   Widget _buildCameraControls(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           IconButton(
//             icon: isFlashOn
//                 ? const Icon(
//                     Icons.flash_on,
//                     color: Colors.white,
//                   )
//                 : const Icon(
//                     Icons.flash_off,
//                     color: Colors.white,
//                   ),
//             color: Colors.white,
//             onPressed: isPermissionsGranted
//                 ? () {
//                     if (isFlashOn) {
//                       setState(() {
//                         isFlashOn = false;
//                       });
//                     } else {
//                       setState(() {
//                         isFlashOn = true;
//                       });
//                     }
//                   }
//                 : null,
//           ),
//           GestureDetector(
//               onTap: isPermissionsGranted
//                   ? () {
//                       log('jjj');
//                       if (_cameraController == null ||
//                           !_cameraController!.value.isInitialized ||
//                           _cameraController!.value.isRecordingVideo) return;
//                       onTakePictureButtonPressed(context);
//                     }
//                   : null,
//               onLongPress: isPermissionsGranted
//                   ? () {
//                       if (_cameraController == null ||
//                           !_cameraController!.value.isInitialized ||
//                           _cameraController!.value.isRecordingVideo) return;
//                       startCaptuerVideo();
//                     }
//                   : null,
//               onLongPressUp: isPermissionsGranted
//                   ? () {
//                       if (_cameraController == null ||
//                           !_cameraController!.value.isInitialized ||
//                           !_cameraController!.value.isRecordingVideo) return;
//                       onStopButtonPressed(context);
//                     }
//                   : null,
//               child: const Icon(
//                 Icons.panorama_fish_eye,
//                 size: 70.0,
//                 color: Colors.white,
//               )),
//           IconButton(
//             icon: SvgPicture.asset("assets/svgs/StatusSwitch.svg"),
//             color: Colors.white,
//             highlightColor: Colors.green,
//             splashColor: Colors.red,
//             onPressed: isPermissionsGranted ? _toggleCamera : null,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGalleryItems() {
//     return SizedBox(
//       height: 80.0,
//       child: getAllAlbums!.isEmpty
//           ? CircularProgressIndicator()
//           : ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 1.0),
//               itemCount: getAllAlbums!.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: GestureDetector(
//                     onTap: () async {
//                       var getFile = await getAllAlbums![index].file;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => StatusScreen(
//                                     file: getFile!,
//                                   )));
//                     },
//                     child: SizedBox(
//                       height: 60,
//                       width: 80,
//                       child: Stack(
//                         children: [
//                           Positioned.fill(
//                             child: AssetEntityImage(
//                               getAllAlbums![index],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           if (getAllAlbums![index].type == AssetType.video)
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: Padding(
//                                 padding: EdgeInsets.only(right: 5, bottom: 5),
//                                 child: Icon(
//                                   Icons.videocam,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate({
//     required this.text,
//   });

//   final String text;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//         color: Colors.white,
//         child: Text(
//           text,
//           style: const TextStyle(
//               fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.bold),
//         ));
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }

//   @override
//   double get maxExtent => 46.0;

//   @override
//   double get minExtent => 46.0;
// }
