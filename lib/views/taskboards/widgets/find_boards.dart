// Find Boards widget for All TaskBoards View
import 'package:flutter/material.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:greentoad_app/views/shared_widgets/text_input.dart';

class FindBoards extends StatefulWidget {
  const FindBoards({super.key});

  @override
  State<FindBoards> createState() => _FindBoardsState();
}

class _FindBoardsState extends State<FindBoards> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 12.0,
      ),
      child: SharedTextInputWidget(
        controller: _controller,
        labelText: "Search Boards",
        hintText: "find boards, checklists, or todo items",
        prefixIcon: const Icon(
          Icons.search,
          color: primaryColor,
        ),
      ),
    );
  }
}
