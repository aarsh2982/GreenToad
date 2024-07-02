// Unit Test for Check List Model
// Purpose: To test serialization and deserialization of model methods.

import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:greentoad_app/models/checklist_model.dart';

void main() {
  group(
    'CheckListModel',
    () {
      test(
        'should convert from and to map correctly!',
        () {
          // creating new checklist
          final checklist = CheckListModel(
            id: const Uuid().v4(),
            taskBoardId: const Uuid().v4(),
            name: 'Test Checklist',
          );

          // converts to map
          final map = checklist.toMap();

          // converts back to model
          final newChecklist = CheckListModel.fromMap(map);

          // comparing results
          expect(checklist.id, newChecklist.id);
          expect(checklist.taskBoardId, checklist.taskBoardId);
          expect(checklist.name, checklist.name);
        },
      );
    },
  );
}
