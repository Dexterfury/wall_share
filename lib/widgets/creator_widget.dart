import 'package:flutter/material.dart';

class CreatorWidget extends StatelessWidget {
  const CreatorWidget({
    super.key,
    required this.creatorId,
  });

  final String creatorId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigate to creator's profile
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person),
            ),
            const SizedBox(width: 8),
            const Text(
              'Dexter',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
