// Other TaskBoards widget for All TaskBoards View
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtherBoards extends StatefulWidget {
  const OtherBoards({super.key});

  @override
  State<OtherBoards> createState() => _OtherBoardsState();
}

class _OtherBoardsState extends State<OtherBoards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          for (var i = 0; i < 8; i++) _buildBoardTile(context),
        ],
      ),
    );
  }

  // Header widget
  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.tableCellsLarge,
            size: 18.0,
            color: Colors.amber,
          ),
          const SizedBox(width: 10.0),
          Text(
            "Other",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  // ListTile Widget
  Widget _buildBoardTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: ListTile(
        leading: const Icon(
          Icons.square_rounded,
          color: Colors.blue,
        ),
        title: Text(
          "University Modules",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: Text(
          "Indication of the button's disabled state and works well in both light and dark modes",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        splashColor: const Color(0x319E9E9E),
        selectedColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onTap: () {},
      ),
    );
  }
}
