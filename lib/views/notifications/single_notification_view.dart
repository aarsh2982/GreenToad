// Single Notification View
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:greentoad_app/config/constants.dart';

class SingleNotificationView extends StatefulWidget {
  final String notificationId;
  const SingleNotificationView({
    super.key,
    required this.notificationId,
  });

  @override
  State<SingleNotificationView> createState() => _SingleNotificationViewState();
}

class _SingleNotificationViewState extends State<SingleNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              _buildTimeStamp(context),
              _buildDescription(context),
              _buildDeleteButton(),
            ],
          ),
        ),
      ),
    );
  }

  // destructured headline widget
  Widget _buildHeader(BuildContext context) {
    return Text(
      "New Notification Title New Notification Title",
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  // destructured timestamp widget
  Widget _buildTimeStamp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 26.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            FontAwesomeIcons.clock,
            color: primaryColor,
            size: 18.0,
          ),
          const SizedBox(width: 10.0),
          Text(
            DateFormat("EEE dd MMM yyyy - hh:mm a").format(DateTime.now()),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  // destructured notification description widget
  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10.0),
        Text(
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  // destructured delete button widget
  Widget _buildDeleteButton() {
    return Container(
      margin: const EdgeInsets.only(top: 60.0),
      child: ElevatedButton(
        onPressed: () {
          context.pop();
        },
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          overlayColor: WidgetStatePropertyAll(Colors.red[700]),
          backgroundColor: const WidgetStatePropertyAll(Colors.red),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 14.0),
          ),
        ),
        child: const Text(
          "Delete Notification",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
