import 'package:flutter/material.dart';
import 'package:wall_share/widgets/main_app_button.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return MainAppButton(
      icon: Icons.person_add,
      label: 'Follow',
      onPressed: () {},
      backgroundColor: Colors.deepPurple,
      textColor: Colors.white,
    );
  }
}
