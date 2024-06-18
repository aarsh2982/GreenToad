// GreenToad Menu In Home view AppBar
import 'package:flutter/material.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:go_router/go_router.dart';

class GreenToadMenu extends StatefulWidget {
  const GreenToadMenu({super.key});

  @override
  State<GreenToadMenu> createState() => _GreenToadMenuState();
}

class _GreenToadMenuState extends State<GreenToadMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (modalContext) => Container(
            width: double.maxFinite,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 14.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildGreenHandle(),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildUserAvatar(),
                      _buildUserDetails(),
                      IconButton(
                        onPressed: () {
                          // closing the bottom sheet when user navigates to settings page
                          modalContext.pop();

                          // navigate user to 'settings page'
                          context.push("/settings");
                        },
                        icon: Icon(
                          Icons.settings,
                          color: (MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark)
                              ? whiteColor
                              : const Color(0xFF353b48),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: const CircleAvatar(
        radius: 26.0,
        backgroundColor: offWhiteColor,
        backgroundImage: AssetImage("assets/images/Main Logo.png"),
      ),
    );
  }

  // destructured green handle bar
  Widget _buildGreenHandle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Center(
        child: Container(
          height: 10.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  // destructured circular user profile avatar
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

  // destructured user details
  Widget _buildUserDetails() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "${"digvijaysinh"[0].toUpperCase() + "digvijaysinh".substring(1)}"
              " ${"padhiyar"[0].toUpperCase() + "padhiyar".substring(1)}",
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
