// Create New TaskBoard Form widget for Create Task Board View
import 'package:flutter/material.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:greentoad_app/views/shared_widgets/text_input.dart';
import 'package:uuid/uuid.dart';

class NewTaskBoardForm extends StatefulWidget {
  const NewTaskBoardForm({super.key});

  @override
  State<NewTaskBoardForm> createState() => _NewTaskBoardFormState();
}

class _NewTaskBoardFormState extends State<NewTaskBoardForm> {
  // global form key
  final _formKey = GlobalKey<FormState>();

  // preparing payload
  late final String _currentTaskBoardId;
  final TextEditingController _boardNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentTaskBoardId = const Uuid().v4();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _boardNameController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedTextInputWidget(
            controller: _boardNameController,
            labelText: "Board Name*",
            maxLength: 60,
            validatorFn: (value) => (value == null || value.trim().isEmpty)
                ? "board name is required!"
                : null,
          ),

          SharedTextInputWidget(
            controller: _descriptionController,
            labelText: "Description",
            maxLength: 2500,
            maxLines: 4,
          ),

          // _buildDescriptionInput(context),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  // Submit Button widget
  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print("create new board now");
          }
        },
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          overlayColor: WidgetStatePropertyAll(Colors.green[400]),
          backgroundColor: const WidgetStatePropertyAll(primaryColor),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 14.0),
          ),
        ),
        child: const Text(
          "Create Board",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
