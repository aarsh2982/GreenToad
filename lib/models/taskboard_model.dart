// Task Board Model

class TaskBoard {
  int? id;
  String boardName;
  bool isHighPriority;
  String description;
  String startDate;
  String dueDate;
  String createdAt;
  String updatedAt;

  TaskBoard({
    this.id,
    required this.boardName,
    required this.isHighPriority,
    required this.description,
    required this.startDate,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
  });

  // parsing data into map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "boardName": boardName,
      "isHighPriority": isHighPriority ? 1 : 0, // converting boolean to int
      "description": description,
      "startDate": startDate,
      "dueDate": dueDate,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory TaskBoard.fromMap(Map<String, dynamic> map) {
    return TaskBoard(
      id: map["id"],
      boardName: map["boardName"],
      isHighPriority: map["isHighPriority"] == 1, // converting back to boolean
      description: map["description"],
      startDate: map["startDate"],
      dueDate: map["dueDate"],
      createdAt: map["createdAt"],
      updatedAt: map["updatedAt"],
    );
  }
}
