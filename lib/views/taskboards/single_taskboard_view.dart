// Single Task Board View
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:greentoad_app/models/taskboard_model.dart';
import 'package:greentoad_app/view_models/taskboards_viewmodel.dart';

// utilities
import 'package:greentoad_app/utils/capitalize.dart';
import 'package:greentoad_app/views/shared_widgets/text_input.dart';

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
  // controllers and local variables
  final TextEditingController _boardNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool editingBoardName = false;
  bool editingDescription = false;

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
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
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
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
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
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.change_circle),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: ListView(
                children: [
                  // Board Name Widget
                  _buildBoardName(context, board!, taskBoardsViewModel),

                  const SizedBox(height: 10.0),

                  // Board Description Widget
                  _buildBoardDescription(context, board!, taskBoardsViewModel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBoardName(BuildContext context, TaskBoardModel board,
      TaskBoardsViewModel viewModel) {
    return GestureDetector(
      onTap: () async {
        // use bottom sheet modal to update
        setState(() {
          // load initial value from db
          _boardNameController.text = board.boardName;

          // toggle edit mode
          (editingBoardName)
              ? editingBoardName = false
              : editingBoardName = true;
        });
      },
      child: (!editingBoardName)
          ? Text(
              toCap(board.boardName),
              style: Theme.of(context).textTheme.headlineLarge,
            )
          : SharedTextInputWidget(
              controller: _boardNameController,
              callbackFn: (newValue) {
                if (newValue!.trim().isEmpty) {
                  setState(() {
                    _boardNameController.text = board.boardName;
                  });
                } else {
                  setState(() {
                    // update in db
                    final newBoardName = newValue.trim();

                    final newBoard = TaskBoardModel(
                      id: board.id,
                      coverColor: board.coverColor,
                      boardName: newBoardName,
                    );

                    viewModel.updateBoard(newBoard);

                    editingBoardName = false;
                  });
                }
              },
            ),
    );
  }

  // Board Description Widget
  Widget _buildBoardDescription(BuildContext context, TaskBoardModel board,
      TaskBoardsViewModel viewModel) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          // add initial descrioption value
          (board.description == null)
              ? _descriptionController.text = ""
              : _descriptionController.text = board.description!;

          // toggle between edit mode
          (editingDescription)
              ? editingDescription = false
              : editingDescription = true;
        });
      },
      child: (editingDescription)
          ? SharedTextInputWidget(
              controller: _descriptionController,
              callbackFn: (newValue) async {
                if (newValue!.trim().isEmpty) {
                  _descriptionController.text = board.boardName;
                } else {
                  String newDescription = newValue.trim();

                  final newBoard = TaskBoardModel(
                    id: board.id,
                    coverColor: board.coverColor,
                    boardName: board.boardName,
                    description: newDescription,
                  );

                  // upadate in db
                  await viewModel.updateBoard(newBoard);

                  editingDescription = false;
                }
              },
            )
          : Text(
              (board.description != null)
                  ? board.description!
                  : "Tap to add description!",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
    );
  }
}
