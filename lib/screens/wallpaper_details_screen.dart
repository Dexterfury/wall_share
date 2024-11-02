import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wall_share/models/wallpaper.dart';
import 'package:wall_share/widgets/bottom_content.dart';
import 'package:wall_share/widgets/comment_button.dart';
import 'package:wall_share/widgets/like_button.dart';
import 'package:wall_share/widgets/wallpaper_image.dart';

class WallpaperDetailsScreen extends StatelessWidget {
  const WallpaperDetailsScreen({
    super.key,
    required this.wallpaper,
    required this.uid,
  });

  final Wallpaper wallpaper;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          LikeButton(
            wallpaperId: wallpaper.wallpaperId,
            uid: uid,
          ),
          CommentButton(
            wallpaperId: wallpaper.wallpaperId,
            uid: uid,
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WallpaperImage(imageUrl: wallpaper.imageUrl),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),

          // Bottom content
          BottomContent(
            wallpaper: wallpaper,
            uid: uid,
          ),
        ],
      ),
    );
  }
}
