import 'package:flutter/material.dart';
import 'package:wall_share/models/wallpaper.dart';
import 'package:wall_share/widgets/wallpaper_item.dart';

class WallpapersGrid extends StatelessWidget {
  const WallpapersGrid({
    super.key,
    required this.wallpapers,
    required this.onTap,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.75,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
  });

  final List<Wallpaper> wallpapers;
  final Function(Wallpaper) onTap;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: wallpapers.length,
        itemBuilder: (context, index) {
          final wallpaper = wallpapers[index];
          return WallpaperItem(
              wallpaper: wallpaper,
              onTap: () {
                onTap(wallpaper);
              });
        });
  }
}
