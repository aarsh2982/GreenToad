// TaskBoard Label Model
import 'package:flutter/material.dart';

class BoardLabelModel {
  final String id; // primary key
  final String taskBoardId; // foreign key
  final String labelName;
  final Color labelColor;
  bool isSelected;

  BoardLabelModel({
    required this.id,
    required this.taskBoardId,
    required this.labelName,
    required this.labelColor,
    this.isSelected = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskBoardId': taskBoardId,
      'labelName': labelName,
      'labelColor': labelColor,
      'isSelected': isSelected ? 1 : 0,
    };
  }

  factory BoardLabelModel.fromMap(Map<String, dynamic> map) {
    return BoardLabelModel(
      id: map['id'],
      taskBoardId: map['taskBoardId'],
      labelName: map['labelName'],
      labelColor: map['labelColor'],
      isSelected: map['isSelected'] == 1,
    );
  }
}
