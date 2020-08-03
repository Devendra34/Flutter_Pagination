import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {

  final String imageUrl;
  final tag;
  ImageViewer(this.imageUrl, this.tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container (
          color: Colors.black,
          child: Hero (
            tag: tag,
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}