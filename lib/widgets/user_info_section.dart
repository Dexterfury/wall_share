import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:wall_share/screens/edit_profile_screen.dart';
import 'package:wall_share/widgets/follow_button.dart';
import 'package:wall_share/widgets/main_app_button.dart';
import 'package:wall_share/widgets/social_details.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    final isOwner = uid.isNotEmpty;
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade200,
          child: const Icon(Icons.person),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Dexter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '@dexter_profile',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 8,
        ),
        ReadMoreText(
          'Hello, I am using WallShare',
          style: Theme.of(context).textTheme.bodyMedium,
          trimMode: TrimMode.Line,
          trimLines: 2,
          colorClickableText: Colors.blue,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialDetails(label: 'Post', count: 952),
            SocialDetails(label: 'Followers', count: 2002),
            SocialDetails(label: 'Following', count: 1200),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        isOwner
            ? MainAppButton(
                icon: Icons.edit,
                label: 'Edit Profile',
                onPressed: () {
                  // navigate to edit profile screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                })
            : FollowButton(uid: uid),
      ],
    );
  }
}
