import 'package:flutter/material.dart';
import 'package:wall_share/utilities/utilities.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    super.key,
    required this.wallpaperId,
    required this.uid,
  });

  final String wallpaperId;
  final String uid;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  int localLikeCount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isLiked = !isLiked;
              if (isLiked) {
                localLikeCount++;
              } else {
                localLikeCount--;
              }
            });
          },
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            key: ValueKey<bool>(isLiked),
            color: isLiked ? Colors.red : Colors.grey,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          Utilities.formatNumber(localLikeCount),
          key: ValueKey<int>(localLikeCount),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
