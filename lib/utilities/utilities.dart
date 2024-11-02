import 'package:flutter/material.dart';
import 'package:wall_share/models/wallpaper.dart';
import 'package:wall_share/screens/wallpaper_details_screen.dart';

class Utilities {
  // Method to format a number with thound separators
  static String formatNumber(int number) {
    if (number >= 1000 && number < 1000000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else {
      return number.toString();
    }
  }

  // Method to navigate to wallpaper details screen
  static void navigateToWallpaperDetailsScreen(
    BuildContext context,
    Wallpaper wallpaper,
  ) {
    // TODO: Implement getting uid from provider class
    final uid = '123';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WallpaperDetailsScreen(
          wallpaper: wallpaper,
          uid: uid,
        ),
      ),
    );
  }
}
