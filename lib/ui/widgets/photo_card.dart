import 'package:flutter/material.dart';
import 'package:pagination/models/photo.dart';
import 'package:pagination/ui/image_viewer.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  PhotoCard(this.photo);

  @override
  Widget build(BuildContext context) {
    if (photo.urlS == null)
      return Container();
    else
      return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewer(photo.urlS, photo.id))
          ),
          child: Hero(

            tag: photo.id,
            child: Image.network(
              photo.urlS,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  }
}
