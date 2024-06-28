// Settings View
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentoad_app/views/settings/widgets/setting_options.dart';
import 'package:greentoad_app/views/settings/widgets/setting_profile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  // user profile pic, name and email address
                  const SettingProfile(),

                  const SizedBox(height: 20.0),

                  // settings options
                  const SettingOptions(),

                  // logout button
                  _buildLogOutTile(context),
                ],
              ),
            ),

            // copyrights
            _buildCopyRights(),
          ],
        ),
      ),
    );
  }

  // destructured logout tile widget
  Widget _buildLogOutTile(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 14.0,
      ),
      leading: const Icon(
        FontAwesomeIcons.arrowRightFromBracket,
        size: 18.0,
      ),
      iconColor: Colors.grey,
      title: Text(
        "Logout",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _buildCopyRights() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: Text(
        "© 2024 Digvijaysinh Padhiyar. All rights reserved.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
