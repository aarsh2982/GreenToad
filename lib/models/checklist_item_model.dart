// Check List Item Model

class CheckListItemModel {
  final String id; // primary key
  final String checkListId; // foreign key
  final String text;
  bool isCompleted;

  CheckListItemModel({
    required this.id,
    required this.checkListId,
    required this.text,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'checkListId': checkListId,
      'text': text,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory CheckListItemModel.fromMap(Map<String, dynamic> map) {
    return CheckListItemModel(
      id: map['id'],
      checkListId: map['checkListId'],
      text: map['text'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
