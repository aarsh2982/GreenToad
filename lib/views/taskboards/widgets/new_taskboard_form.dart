// Create New TaskBoard Form widget for Create Task Board View
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:greentoad_app/models/taskboard_model.dart';
import 'package:greentoad_app/views/shared_widgets/text_input.dart';
import 'package:greentoad_app/views/shared_widgets/buttons.dart';
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
  Color? _coverColor;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentTaskBoardId = const Uuid().v4();
      _coverColor = coverColors[Random().nextInt(coverColors.length)];
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

          _buildColorPicker(context),

          SharedTextInputWidget(
            controller: _descriptionController,
            labelText: "Description",
            maxLength: 2500,
            maxLines: 4,
          ),

          // submit button
          SharedPrimaryActionButton(
            label: "Create Board",
            isEnabled: true,
            callback: () {
              if (_formKey.currentState!.validate()) {
                TaskBoardModel(
                  id: _currentTaskBoardId,
                  boardName: _boardNameController.text.trim(),
                  coverColor: _coverColor!,
                );

                // proceed to create new board (later)
              }
            },
            overlayColor: const Color(0xFF66BB6A),
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }

  // color picker dropdown widget
  Widget _buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Set Cover Color*",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 4.0),
        DropdownButtonFormField(
          value: _coverColor,
          items: coverColors.map((Color color) {
            return DropdownMenuItem(
              value: color,
              child: Icon(Icons.square_rounded, color: color),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _coverColor = value!;
            });
          },
          icon: const Icon(FontAwesomeIcons.chevronDown),
          iconSize: 18.0,
          dropdownColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: primaryColor),
            ),
            counterStyle: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
