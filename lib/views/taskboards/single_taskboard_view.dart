// Single Task Board View
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:greentoad_app/models/taskboard_model.dart';
import 'package:greentoad_app/view_models/taskboards_viewmodel.dart';

class SingleTaskBoardView extends ConsumerStatefulWidget {
  final String boardId;

  const SingleTaskBoardView({
    super.key,
    required this.boardId,
  });

  @override
  SingleTaskBoardViewState createState() => SingleTaskBoardViewState();
}

class SingleTaskBoardViewState extends ConsumerState<SingleTaskBoardView> {
  @override
  Widget build(BuildContext context) {
    final taskBoardsViewModel = ref.watch(taskBoardViewModel);

    return FutureBuilder<TaskBoardModel?>(
      future: taskBoardsViewModel.findBoardById(widget.boardId),
      builder: (context, snapshot) {
        // loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
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
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                  color: primaryColor,
                ),
              ),
            ),
          );
        }

        // error state
        if (snapshot.hasError || !snapshot.hasData) {
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
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    "Unable to get board with ID: ${widget.boardId}",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }

        // success state
        final board = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: board?.coverColor,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: ListView(
                children: [
                  _buildHeader(context, board!, taskBoardsViewModel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, TaskBoardModel board,
      TaskBoardsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // board name display and update function
        GestureDetector(
          onTap: () async {
            print("trigger update board name!");

            // use bottom sheet modal to update
          },
          child: Text(
            board.boardName
                .split(" ")
                .map((i) => i.replaceRange(0, 1, i[0].toUpperCase()))
                .join(" "),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),

        const SizedBox(height: 20.0),

        // board description display and update function
        GestureDetector(
          onTap: () {
            print("trigger update board description!");

            // use bottom sheet modal to update
          },
          child: Text(
            (board.description != null)
                ? board.description!
                : "Tap to add description!",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
