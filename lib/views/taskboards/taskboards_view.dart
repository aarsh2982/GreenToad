// All Task Boards View
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greentoad_app/views/taskboards/widgets/find_boards.dart';
import 'package:greentoad_app/views/taskboards/widgets/highlighted_boards.dart';
import 'package:greentoad_app/views/taskboards/widgets/other_boards.dart';

class TaskBoardsView extends StatelessWidget {
  const TaskBoardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Task Boards",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push("/taskboards/create");
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const FindBoards(),
            const HighlightedBoards(),
            OtherBoards(),
          ],
        ),
      ),
    );
  }
}
