import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wall_share/models/wallpaper.dart';
import 'package:wall_share/utilities/utilities.dart';
import 'package:wall_share/widgets/wallpaper_info_overlay.dart';

class TopLikedCarousel extends StatefulWidget {
  const TopLikedCarousel({super.key});

  @override
  State<TopLikedCarousel> createState() => _TopLikedCarouselState();
}

class _TopLikedCarouselState extends State<TopLikedCarousel> {
  // carpusel controller
  final CarouselSliderController carouselController =
      CarouselSliderController();

  // currentt page index
  int currentPageIndex = 0;

  // get a list of 10 most liked wallpapers
  List<Wallpaper> getMostLikedWallpapers() {
    var sortedWallpapers = List<Wallpaper>.from(Wallpaper.wallpapers)
      ..sort((a, b) => b.likes.compareTo(a.likes));
    return sortedWallpapers.take(10).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // carousel slider
        CarouselSlider.builder(
          itemCount: getMostLikedWallpapers().length,
          carouselController: carouselController,
          itemBuilder: (context, index, realIndex) {
            final wallpaper = getMostLikedWallpapers()[index];
            return _buildCarouselItem(wallpaper);
          },
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
        ),

        // Overlay with page indicator
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
                activeIndex: currentPageIndex,
                count: getMostLikedWallpapers().length,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 12,
                  dotColor: Colors.white.withOpacity(0.4),
                  activeDotColor: Colors.white,
                ),
                onDotClicked: (index) {
                  carouselController.animateToPage(index);
                }),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(Wallpaper wallpaper) {
    return GestureDetector(
      onTap: () {
        // navigate to the wallpaper detail screen
        Utilities.navigateToWallpaperDetailsScreen(context, wallpaper);
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(wallpaper.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          child: WallpaperInfoOverlay(
            wallpaperName: wallpaper.name,
            likes: wallpaper.likes,
            comments: wallpaper.comments,
          ),
        ),
      ),
    );
  }
}
