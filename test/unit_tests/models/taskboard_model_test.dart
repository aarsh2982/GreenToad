// Unit Test for Task Board Model
// Purpose: To test serialization and deserialization of model methods.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:greentoad_app/models/taskboard_model.dart';

void main() {
  group(
    'TaskBoardModel',
    () {
      test(
        'should convert from and to map correctly!',
        () {
          // creating a taskboard instance with required fields only
          final taskboardOne = TaskBoardModel(
            id: const Uuid().v4(),
            coverColor: const Color(0xFFFFC107),
            boardName: 'University 2024',
          );

          // creating a taskboard instance with optional fields
          final taskboardTwo = TaskBoardModel(
            id: const Uuid().v4(),
            coverColor: const Color(0xFF4CAF50),
            boardName: 'Pestana Chelseabridge',
            description:
                'All work related documents and tasklists for the month of July 2024',
            startTime: DateTime.parse('2024-07-01 00:00:00'),
            endTime: DateTime.parse('2024-07-31 23:59:59'),
            isStarred: true,
          );

          // should convert both model instances to map
          final mapOne = taskboardOne.toMap();
          final mapTwo = taskboardTwo.toMap();

          // should convert map back to model instance
          final newtaskboardOne = TaskBoardModel.fromMap(mapOne);
          final newtaskboardTwo = TaskBoardModel.fromMap(mapTwo);

          // comparing results
          expect(taskboardOne.id, newtaskboardOne.id);
          expect(taskboardOne.coverColor, newtaskboardOne.coverColor);
          expect(taskboardOne.boardName, newtaskboardOne.boardName);
          expect(taskboardOne.description, newtaskboardOne.description);
          expect(taskboardOne.startTime, newtaskboardOne.startTime);
          expect(taskboardOne.endTime, newtaskboardOne.endTime);
          expect(taskboardOne.attachment, newtaskboardOne.attachment);
          expect(taskboardOne.isStarred, newtaskboardOne.isStarred);

          expect(taskboardTwo.id, newtaskboardTwo.id);
          expect(taskboardTwo.coverColor, newtaskboardTwo.coverColor);
          expect(taskboardTwo.boardName, newtaskboardTwo.boardName);
          expect(taskboardTwo.description, newtaskboardTwo.description);
          expect(taskboardTwo.startTime, newtaskboardTwo.startTime);
          expect(taskboardTwo.endTime, newtaskboardTwo.endTime);
          expect(taskboardTwo.attachment, newtaskboardTwo.attachment);
          expect(taskboardTwo.isStarred, newtaskboardTwo.isStarred);
        },
      );
    },
  );
}
