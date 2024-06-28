// All Task Boards View
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: const SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
