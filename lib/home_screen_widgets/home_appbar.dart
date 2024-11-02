import 'package:flutter/material.dart';
import 'package:wall_share/screens/profile_screen.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Text(
            'WallShare',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              // navigate to the profile screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen(uid: '123')));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person),
            ),
          )
        ],
      ),
    );
  }
}
