// Create New Task Board View
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateTaskBoardView extends StatelessWidget {
  const CreateTaskBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Task Board",
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
        child: Container(),
      ),
    );
  }
}
