// Single List Tile Widget for Notifications View

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:greentoad_app/config/constants.dart';

class SingleNotificationTile extends StatefulWidget {
  final String id;
  final bool isRead;
  final String title;
  final String message;
  final DateTime time;

  const SingleNotificationTile({
    super.key,
    required this.id,
    required this.isRead,
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  State<SingleNotificationTile> createState() => _SingleNotificationTileState();
}

class _SingleNotificationTileState extends State<SingleNotificationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print("Take user to notification which has id: ${widget.id}");
      },
      isThreeLine: false,
      leading: Icon(
        (widget.isRead)
            ? Icons.mark_email_read_rounded
            : Icons.mark_email_unread_rounded,
        color: primaryColor,
      ),
      tileColor:
          (widget.isRead) ? Colors.transparent : Theme.of(context).primaryColor,
      title: Text(
        widget.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            // widget.time.toIso8601String(),
            DateFormat("EEE dd MMM yyyy - hh:mm a").format(widget.time),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
