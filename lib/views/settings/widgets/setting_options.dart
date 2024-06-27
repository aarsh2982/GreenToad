// Setting Options Widget
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentoad_app/config/constants.dart';

// Custom Options Class
class Option {
  final String link;
  final String label;
  final IconData icon;

  Option({
    required this.link,
    required this.label,
    required this.icon,
  });
}

// options data
final List<Option> options = [
  Option(
    link: "/settings",
    label: "Manage Account",
    icon: FontAwesomeIcons.user,
  ),
  Option(
    link: "/settings",
    label: "Notifications Setting",
    icon: FontAwesomeIcons.bell,
  ),
  Option(
    link: "/settings",
    label: "Help & Support",
    icon: FontAwesomeIcons.headset,
  ),
  Option(
    link: "/settings",
    label: "Privacy Policy",
    icon: FontAwesomeIcons.userShield,
  ),
  Option(
    link: "/settings",
    label: "Terms & Conditions",
    icon: FontAwesomeIcons.fileLines,
  ),
  Option(
    link: "/settings",
    label: "Feedback",
    icon: FontAwesomeIcons.commentDots,
  ),
];

//
class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var option in options)
          ListTile(
            onTap: () {
              print(option.link);
            },
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 14.0,
            ),
            leading: Icon(
              option.icon,
              size: 18.0,
              color: primaryColor,
            ),
            iconColor: Colors.grey,
            title: Text(
              option.label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
      ],
    );
  }
}
