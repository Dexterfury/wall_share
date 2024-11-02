import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_share/providers/wallpaper_provider.dart';

class ControlsOverlay extends StatefulWidget {
  const ControlsOverlay({
    super.key,
    required this.isAIMode,
  });

  final bool isAIMode;

  @override
  State<ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<WallpaperProvider>().clearState();
              },
              backgroundColor: Colors.white.withOpacity(0.3),
              child: const Icon(Icons.close),
            ),
            FloatingActionButton(
              onPressed: () {
                if (!widget.isAIMode) {
                  // show dialog for user inputs
                } else {
                  // share the wallpaper
                }
              },
              backgroundColor: Colors.white.withOpacity(0.3),
              child: const Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
