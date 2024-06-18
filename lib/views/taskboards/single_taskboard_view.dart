// Single Task Board View
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SingleTaskBoardView extends StatefulWidget {
  final String boardId;

  const SingleTaskBoardView({
    super.key,
    required this.boardId,
  });

  @override
  State<SingleTaskBoardView> createState() => _SingleTaskBoardViewState();
}

class _SingleTaskBoardViewState extends State<SingleTaskBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "University module task masker board djsn ahfiabdc af and ckabdo",
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text("task biard: ${widget.boardId}"),
          ),
        ),
      ),
    );
  }
}
