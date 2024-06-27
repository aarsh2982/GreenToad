// Settings Profile Widget
import 'package:flutter/material.dart';
import 'package:greentoad_app/config/constants.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({super.key});

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildUserAvatar(),
          const SizedBox(width: 14.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Digvijaysinh Padhiyar",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "djpadhiyar881@gmail.com",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Destructured User Avatar widget
  Widget _buildUserAvatar() {
    return CircleAvatar(
      radius: 32.0,
      backgroundColor: secondaryColor,
      // ignore: unnecessary_null_comparison
      child: ("" != null)
          ? ClipOval(
              child: Image(
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                image: const NetworkImage(
                  "https://digvijay.tech/me.jpg",
                ),
                // Handles loading state of the image
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const CircularProgressIndicator(
                      color: whiteColor,
                      strokeWidth: 8.0,
                    );
                  }
                },
                // Handles any error caused by the image URL
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      "digvijaysinh"[0].toUpperCase() +
                          "padhiyar"[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                  );
                },
              ),
            )
          : Text(
              "digvijaysinh"[0].toUpperCase() + "padhiyar"[0].toUpperCase(),
              style: const TextStyle(fontSize: 22.0, color: whiteColor),
            ),
    );
  }
}
