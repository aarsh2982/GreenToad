// Create New Task Board View
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greentoad_app/views/taskboards/widgets/new_taskboard_form.dart';

class CreateTaskBoardView extends StatefulWidget {
  const CreateTaskBoardView({super.key});

  @override
  State<CreateTaskBoardView> createState() => _CreateTaskBoardViewState();
}

class _CreateTaskBoardViewState extends State<CreateTaskBoardView> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
          child: ListView(
            children: const [
              NewTaskBoardForm(),
            ],
          ),
        ),
      ),
    );
  }
}
