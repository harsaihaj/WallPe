import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:image_downloader/image_downloader.dart';

class FullScreen extends StatelessWidget {
  String imgUrl;
  FullScreen({super.key, required this.imgUrl});

  // final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  // Future<void> setWallpaperFromFile(String wallpaperUrl, BuildContext context)async{
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloading")));
  //   try {
  //     // Saved with this method.
  //     var imageId = await ImageDownloader.downloadImage(imgUrl);
  //     if (imageId == null) {
  //       return;
  //     }
  //
  //     // Below is a method of obtaining saved image information.
  //     var fileName = await ImageDownloader.findName(imageId);
  //     var path = await ImageDownloader.findPath(imageId);
  //     var size = await ImageDownloader.findByteSize(imageId);
  //     var mimeType = await ImageDownloader.findMimeType(imageId);
  //   } on PlatformException catch (error) {
  //     print(error);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldkey,
      //   floatingActionButton: ElevatedButton(onPressed: () async{
      //     await setWallpaperFromFile(imgUrl, context);
      //   }, child: Text("Click To Download")),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,

        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),

        ),
      ),
    );
  }
}
