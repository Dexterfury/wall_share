import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wall_share/providers/wallpaper_provider.dart';
import 'package:wall_share/widgets/controls_overlay.dart';
import 'package:wall_share/widgets/main_app_button.dart';
import 'package:wall_share/widgets/wallpaper_placeholder.dart';
import 'package:wall_share/widgets/wallpaper_preview.dart';

class CreateWallpaperScreen extends StatefulWidget {
  const CreateWallpaperScreen({super.key});

  @override
  State<CreateWallpaperScreen> createState() => _CreateWallpaperScreenState();
}

class _CreateWallpaperScreenState extends State<CreateWallpaperScreen> {
  String prompt = '';
  bool _isAIMode = true;
  bool _showControls = false;

  // toggle mode
  void _toggleMode() {
    // 1. Clear wallpaper state from provider
    context.read<WallpaperProvider>().clearState();

    // 2. toggle mode
    setState(() {
      _isAIMode = !_isAIMode;
    });
  }

  // toggle controls
  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  // pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      if (mounted) {
        await context
            .read<WallpaperProvider>()
            .setImage(XFile(pickedFile.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final wallpaperProvider = context.watch<WallpaperProvider>();
    final hasImage = wallpaperProvider.image != null;

    return GestureDetector(
      onTap: hasImage ? _toggleControls : null,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buidAppBar(hasImage),
        body: Stack(
          children: [
            // Main content
            hasImage
                ? WallpaperPreview(imageSource: wallpaperProvider.image)
                : const WallpaperPlaceholder(),

            // Controls overlay
            if (hasImage && _showControls) _buildControlsOverlay(),

            // Bottom UI elements (generate button, etc)
            if (!hasImage) _buildBottomUI(wallpaperProvider),
          ],
        ),
      ),
    );
  }

  // build controls overlay
  Widget _buildControlsOverlay() {
    return ControlsOverlay(isAIMode: _isAIMode);
  }

  // build bottom UI
  Widget _buildBottomUI(WallpaperProvider wallpaperProvider) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: _isAIMode ? _buildAIModeUI() : _buildUploadModeUI(),
        ));
  }

  // build AI mode UI
  Widget _buildAIModeUI() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Prompt input
      TextField(
        onChanged: (value) => setState(() => prompt = value),
        decoration: const InputDecoration(
          hintText: 'Enter a prompt',
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }

  // build upload mode UI
  Widget _buildUploadModeUI() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
        child: MainAppButton(
          icon: Icons.photo_library,
          label: 'Gallery',
          onPressed: () => _pickImage(ImageSource.gallery),
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: MainAppButton(
          icon: Icons.camera_alt,
          label: 'Camera',
          onPressed: () => _pickImage(ImageSource.camera),
        ),
      ),
    ]);
  }

  PreferredSizeWidget _buidAppBar(bool hasImage) {
    return AppBar(
      backgroundColor: hasImage
          ? Colors.transparent
          : Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: hasImage ? const SizedBox() : null,
      title: _showControls || !hasImage
          ? Text(
              _isAIMode ? 'Create AI Wallpaper' : 'Upload Wallpaper',
              style: TextStyle(
                color: hasImage ? Colors.white : null,
                shadows: hasImage
                    ? [const Shadow(color: Colors.black, blurRadius: 2)]
                    : null,
              ),
            )
          : null,
      actions: _showControls || !hasImage
          ? [
              IconButton(
                onPressed: _toggleMode,
                icon: Icon(
                  _isAIMode ? Icons.photo_library : Icons.auto_awesome,
                  color: hasImage ? Colors.white : null,
                ),
              ),
            ]
          : null,
    );
  }
}
