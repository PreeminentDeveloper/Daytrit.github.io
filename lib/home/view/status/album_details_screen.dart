// import 'package:camera/camera.dart';
// import 'package:daytrit/home/view_models/gallery_thumbnail_viewmodel.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:provider/provider.dart';


// class AlbumDetails extends StatefulWidget {

//   final ScrollController? scrollCtr;
//   final String? title;
//   const AlbumDetails({
//     Key? key,
//     this.scrollCtr,
//     required this.title,
   
//   }) : super(key: key);

//   @override
//   _AlbumDetailsState createState() => _AlbumDetailsState();
// }

// class _AlbumDetailsState extends State<AlbumDetails> {
//   List<AssetPathEntity> getAllAlbums = [];

//   CameraController? controller;

//   @override
//   void didChangeDependencies() {
//     final getMedia = Provider.of<GalleryThumbnailProvider>(context)
//         .fetchNewMedia(widget.title!);
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<GalleryThumbnailProvider>(
//       builder: (BuildContext context, gallery, Widget? child) {
//         return Scaffold(
//           appBar: AppBar(
//             leading: gallery.selectedMedia.isEmpty
//                 ? IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.arrow_back),
//                     color: Color(0xff00897b),
//                   )
//                 : IconButton(
//                     onPressed: () {
//                       setState(() {
//                         gallery.selectedMedia.clear();
//                       });
//                     },
//                     icon: Icon(Icons.arrow_back),
//                     color: Colors.black,
//                   ),
//             title: Text(
//               gallery.selectedMedia.isEmpty
//                   ? '${widget.title}'
//                   : '${gallery.selectedMedia.length} selected',
//               style: TextStyle(color: Colors.black),
//             ),
//             elevation: 0,
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           ),
//           body: SafeArea(
//             child: NotificationListener<ScrollNotification>(
//               onNotification: (ScrollNotification scroll) {
//                 gallery.handleScrollEvent(scroll, title: widget.title!);
//                 return false;
//               },
//               child: Stack(
//                 children: [
//                   GridView.builder(
//                     controller: widget.scrollCtr,
//                     itemCount: gallery.getMedia.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       mainAxisSpacing: 6.0,
//                       crossAxisCount: 4,
//                       mainAxisExtent: 80,
//                       crossAxisSpacing: 6.0,
//                     ),
//                     itemBuilder: (BuildContext context, int index) {
//                       final asset = gallery.getMedia[index];
//                       return GestureDetector(
//                         onTap: () async {
//                           gallery.toggleSelectedMedia(asset);
//                         },
//                         child: Stack(
//                           children: [
//                             Positioned.fill(
//                               child: AssetEntityImage(
//                                 asset,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             if (asset.type == AssetType.video)
//                               Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(right: 5, bottom: 5),
//                                   child: Icon(
//                                     Icons.videocam,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
                          
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                   Positioned(
//                     bottom: 30.0,
//                     right: 10.0,
//                     child: gallery.selectedMedia.isEmpty
//                         ? SizedBox()
//                         : TextButton(
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (context) => CameraView(
                            
//                               //     ),
//                               //   ),
//                               // );
//                             },
//                             child: Container(
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   color: Colors.black, shape: BoxShape.circle),
//                               height: 62,
//                               width: 62,
//                               child: Stack(
//                                 children: [
//                                   Positioned(
//                                     left: 5,
//                                     top: 10,
//                                     child: SvgPicture.asset(
//                                       'assets/svgs/send.svg',
//                                      color: Colors.white,
//                                     ),
//                                   ),
//                                   Positioned(
//                                     left: 40,
//                                     top: 35,
//                                     child: Text(
//                                       '${gallery.selectedMedia.length}',
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
