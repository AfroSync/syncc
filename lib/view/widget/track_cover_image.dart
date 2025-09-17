// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../controller/audio/audio_service.dart';
// import '../../core/color.dart';
//
// class TrackCoverImage extends StatelessWidget {
//   final String imageUrl;
//   final double width;
//   final double height;
//
//
//   const TrackCoverImage(this.imageUrl,{super.key, this.width = 60,this.height = 60,});
//
//   @override
//   Widget build(BuildContext context) {
//     return                 Container(
//       height: 60,
//       width: 60,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         color: ModernColors.textSecondary,
//       ),
//       clipBehavior: Clip.hardEdge,
//       child: Stack(
//         alignment: AlignmentGeometry.center,
//         children: [
//           SizedBox(
//             height: 60,
//             width: 60,
//             child: CachedNetworkImage(
//               imageUrl: imageUrl,
//               fit: BoxFit.cover,
//               errorWidget: (context, stuff, object) => SizedBox(),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsGeometry.all(12),
//             child: IconButton.filled(
//               onPressed: () {
//                 if (isCurrentTrack) {
//                   AudioService.instance.togglePlayPause();
//                 } else {
//                   AudioService.instance.playTrack(widget.track);
//                 }
//               },
//               style: IconButton.styleFrom(
//                 backgroundColor: Colors.white.withValues(
//                   alpha: 0.8,
//                 ),
//               ),
//               icon: Icon(
//                 isCurrentTrack && isPlaying
//                     ? CupertinoIcons.pause_fill
//                     : CupertinoIcons.play_fill,
//                 color: Colors.black87,
//                 size: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     ;
//   }
// }
