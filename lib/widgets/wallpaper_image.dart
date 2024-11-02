import 'package:flutter/material.dart';

class WallpaperImage extends StatelessWidget {
  const WallpaperImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
