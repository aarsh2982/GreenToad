// Check List Model

class CheckListItem {
  final String id;
  final String name;
  bool isCompleted;

  CheckListItem({
    required this.id,
    required this.name,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory CheckListItem.fromMap(Map<String, dynamic> map) {
    return CheckListItem(
      id: map['id'],
      name: map['name'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}

class CheckListModel {
  final String id;
  final String name;
  List<CheckListItem> items;

  CheckListModel({
    required this.id,
    required this.name,
    List<CheckListItem>? items,
  }) : items = items ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  factory CheckListModel.fromMap(Map<String, dynamic> map) {
    return CheckListModel(
      id: map['id'],
      name: map['name'],
      items: List<CheckListItem>.from(
          map['items']?.map((itemMap) => CheckListItem.fromMap(itemMap)) ?? []),
    );
  }
}
