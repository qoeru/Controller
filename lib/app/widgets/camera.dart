// import 'package:camerawesome/camerawesome_plugin.dart';
// import 'package:controler_app/app/pages/loading_page.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:controler_app/data_sources/app_util.dart';
// import 'package:intl/intl.dart';

// class Camera extends StatelessWidget {
//   const Camera({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CameraAwesomeBuilder.awesome(
//       saveConfig: SaveConfig.photo(
//         pathBuilder: () async {
//           DateFormat dateFormat = DateFormat("yyyy-MM-dd_HH:mm:ss");
//           final path = await AppUtil.returnPhotoFolder();
//           return '$path${dateFormat.format(DateTime.now())}.jpg';
//         },
//       ),
//       onMediaTap: (MediaCapture) {},
//       filter: AwesomeFilter.None,
//       flashMode: FlashMode.auto,
//       aspectRatio: CameraAspectRatios.ratio_16_9,
//       previewFit: CameraPreviewFit.fitWidth,
//       progressIndicator: const LoadingPage(),
//     );
//   }
// }
