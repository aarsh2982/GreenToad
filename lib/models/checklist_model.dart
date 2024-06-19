// Check List Model

class CheckListModel {
  final String id; // primary key
  final String taskBoardId; // foreign key
  final String name;

  CheckListModel({
    required this.id,
    required this.taskBoardId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskBoardId': taskBoardId,
      'name': name,
    };
  }

  factory CheckListModel.fromMap(Map<String, dynamic> map) {
    return CheckListModel(
      id: map['id'],
      taskBoardId: map['taskBoardId'],
      name: map['name'],
    );
  }
}
