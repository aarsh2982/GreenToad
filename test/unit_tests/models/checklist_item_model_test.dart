// Unit Test for CheckListItem Model
// Purpose: To test serialization and deserialization of model methods.

import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:greentoad_app/models/checklist_item_model.dart';

void main() {
  group(
    'CheckListModel',
    () {
      test(
        'should convert from and to map correctly!',
        () {
          // creating new checklist item model instance
          final checklistItem = CheckListItemModel(
            id: const Uuid().v4(), // primary key
            checkListId: const Uuid().v4(), // foreign key
            text: 'Both examples demonstrate how to use.',
          );

          // converts to map
          final map = checklistItem.toMap();

          // converts back to model
          final newChecklistItem = CheckListItemModel.fromMap(map);

          // expecting test results
          expect(checklistItem.id, newChecklistItem.id);
          expect(checklistItem.checkListId, newChecklistItem.checkListId);
          expect(checklistItem.text, newChecklistItem.text);
          expect(checklistItem.isCompleted, newChecklistItem.isCompleted);
        },
      );
    },
  );
}
