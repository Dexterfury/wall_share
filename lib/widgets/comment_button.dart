import 'package:flutter/material.dart';
import 'package:wall_share/utilities/utilities.dart';

class CommentButton extends StatefulWidget {
  const CommentButton({
    super.key,
    required this.wallpaperId,
    required this.uid,
  });

  final String wallpaperId;
  final String uid;

  @override
  State<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  int commentCount = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.comment,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              Utilities.formatNumber(commentCount),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
