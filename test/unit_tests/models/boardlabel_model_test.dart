// Unit Test for Board Label Model
// Purpose: To test serialization and deserialization of model methods.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greentoad_app/models/boardlabel_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  group(
    'BoardLabelModel',
    () {
      test(
        'should convert from and to map correctly!',
        () {
          // creating new BoardLabel Mode
          final boardLabel = BoardLabelModel(
            id: const Uuid().v4(), // primary key
            taskBoardId: const Uuid().v4(), // foreign key
            labelName: "In Progress",
            labelColor: const Color(0xFFFF8F00),
          );

          // convert to map
          final map = boardLabel.toMap();

          // converts back to model
          final newBoardLabel = BoardLabelModel.fromMap(map);

          // expecting test results
          expect(boardLabel.id, newBoardLabel.id);
          expect(boardLabel.taskBoardId, newBoardLabel.taskBoardId);
          expect(boardLabel.labelName, newBoardLabel.labelName);
          expect(boardLabel.labelColor, newBoardLabel.labelColor);
          expect(boardLabel.isSelected, newBoardLabel.isSelected);
        },
      );
    },
  );
}
