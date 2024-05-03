// import 'package:daytrit/home/view/status/album_details_screen.dart';
// import 'package:daytrit/home/view_models/gallery_thumbnail_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:provider/provider.dart';

// class DisplaySelectedImages extends StatefulWidget {
//   final ScrollController? scrollCtr;

//   const DisplaySelectedImages({
//     Key? key,
//     this.scrollCtr,
//   }) : super(key: key);

//   @override
//   _DisplaySelectedImagesState createState() => _DisplaySelectedImagesState();
// }

// class _DisplaySelectedImagesState extends State<DisplaySelectedImages> {
//   List<AssetPathEntity> getAllAlbums = [];
//   int currentPage = 0;
//   int? lastPage;
//   List<AssetEntity> selectedMedia = [];

//   @override
//   void didChangeDependencies() {
//     final getMedia =
//         Provider.of<GalleryThumbnailProvider>(context).getMediaAlbums();
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<GalleryThumbnailProvider>(
//       builder: (BuildContext context, gallery, Widget? child) {
//         return NotificationListener<ScrollNotification>(
//             onNotification: (ScrollNotification scroll) {
//               gallery.handleScrollEvent(scroll);
//               return false;
//             },
//             child: GridView.builder(
//                 controller: widget.scrollCtr,
//                 itemCount: gallery.getAllAlbums.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisSpacing: 3.0,
//                   crossAxisCount: 2,
//                   mainAxisExtent: 256,
//                   crossAxisSpacing: 3.0,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AlbumDetails(
//                             title: gallery.getAllAlbums[index].name,
//                           ),
//                         ),
//                       );
//                     },
//                     child: GetAssetsImage(
//                       getEntityPath: gallery.getAllAlbums[index],
//                     ),
//                   );
//                 }));
//       },
//     );
//   }
// }

// class GetAssetsImage extends StatefulWidget {
//   final AssetPathEntity? getEntityPath;

//   const GetAssetsImage({super.key, this.getEntityPath});

//   @override
//   State<GetAssetsImage> createState() => _GetAssetsImageState();
// }

// class _GetAssetsImageState extends State<GetAssetsImage> {
//   @override
//   void initState() {
//     getAllFileEntities();
//     super.initState();
//   }

//   AssetEntity? fetchedEntity;

//   getAllFileEntities() async {
//     List<AssetEntity> entityList = [];
//     entityList = await widget.getEntityPath!.getAssetListPaged(
//       page: 0,
//       size: 1,
//     );

//     try {
//       if (entityList.isNotEmpty) {
//         fetchedEntity = entityList.first;
//       }
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           fetchedEntity != null
//               ? AssetEntityImage(
//                   height: 256,
//                   width: 300,
//                   fetchedEntity!,
//                   fit: BoxFit.cover,
//                   filterQuality: FilterQuality.low,
//                   frameBuilder:
//                       (context, child, frame, wasSynchronouslyLoaded) {
//                     if (wasSynchronouslyLoaded) {
//                       return child;
//                     }
//                     return AnimatedOpacity(
//                       opacity: frame == null ? 0 : 1,
//                       duration: const Duration(seconds: 1),
//                       curve: Curves.easeOut,
//                       child: child,
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return Center(
//                       child: Text(
//                         'Error loading image: $error',
//                       ),
//                     );
//                   },
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) {
//                       return child;
//                     }
//                     return Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                                 loadingProgress.expectedTotalBytes!
//                             : null,
//                       ),
//                     );
//                   },
//                 )
//               : SizedBox(),
//           SizedBox(
//             height: 10,
//           ),
//           widget.getEntityPath!.name == 'Camera'
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
//                     child: Icon(
//                       Icons.camera_alt_outlined,
//                       size: 12,
//                       color: Colors.blueGrey,
//                     ),
//                   ))
//               : Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
//                     child: Icon(
//                       Icons.file_copy,
//                       size: 12,
//                       color: Colors.blueGrey,
//                     ),
//                   )),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 18.0, bottom: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.getEntityPath!.name,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 5.0),
//                     child: Text(
//                       widget.getEntityPath!.assetCount.toString(),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
