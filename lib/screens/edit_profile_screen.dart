import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_share/home_screen_widgets/home_appbar.dart';
import 'package:wall_share/providers/authentication_provider.dart';
import 'package:wall_share/screens/home_screen.dart';
import 'package:wall_share/widgets/main_app_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.person),
              ),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              // logout button
              MainAppButton(
                icon: Icons.logout,
                label: 'Logout',
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  final authProvider = context.read<AuthenticationProvider>();

                  await authProvider.signOut().whenComplete(() {
                    // navigaet user to home screen
                    if (context.mounted) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  });
                },
              )
            ],
          ),
        ));
  }
}
