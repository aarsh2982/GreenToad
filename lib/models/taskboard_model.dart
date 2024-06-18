// Task Board Model
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:greentoad_app/models/checklist_model.dart';

class BoardLabel {
  final String labelText;
  final Color labelColor;

  BoardLabel({
    required this.labelText,
    required this.labelColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'labelText': labelText,
      'labelColor': labelColor.value,
    };
  }

  factory BoardLabel.fromMap(Map<String, dynamic> map) {
    return BoardLabel(
      labelText: map['labelText'],
      labelColor: Color(map['labelColor']),
    );
  }
}

class TaskBoardModel {
  final String id;
  final Color coverColor;
  final String boardName;
  final String description;
  final BoardLabel boardLabel;
  DateTime? startTime;
  DateTime? endTime;
  File? attachment;
  bool isStarred;
  List<CheckListModel> checkLists;

  TaskBoardModel({
    required this.id,
    required this.coverColor,
    required this.boardName,
    required this.description,
    required this.boardLabel,
    this.startTime,
    this.endTime,
    this.attachment,
    this.isStarred = false,
    List<CheckListModel>? checkLists,
  }) : checkLists = checkLists ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'coverColor': coverColor.value,
      'boardName': boardName,
      'description': description,
      'boardLabel': boardLabel.toMap(),
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'attachment': attachment?.path,
      'isStarred': isStarred,
      'checkLists': checkLists.map((checkList) => checkList.toMap()).toList(),
    };
  }

  factory TaskBoardModel.fromMap(Map<String, dynamic> map) {
    return TaskBoardModel(
      id: map['id'],
      coverColor: Color(map['coverColor']),
      boardName: map['boardName'],
      description: map['description'],
      boardLabel: BoardLabel.fromMap(map['boardLabel']),
      startTime:
          map['startTime'] != null ? DateTime.parse(map['startTime']) : null,
      endTime: map['endTime'] != null ? DateTime.parse(map['endTime']) : null,
      attachment: map['attachment'] != null ? File(map['attachment']) : null,
      isStarred: map['isStarred'] ?? false,
      checkLists: List<CheckListModel>.from(map['checkLists']
              ?.map((checkListMap) => CheckListModel.fromMap(checkListMap)) ??
          []),
    );
  }
}
