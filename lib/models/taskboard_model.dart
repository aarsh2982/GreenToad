// Task Board Model
import 'dart:typed_data';
import 'package:flutter/material.dart';

class TaskBoardModel {
  final String id; // primary key
  final Color coverColor;
  final String boardName;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;
  final Uint8List? attachment;
  bool isStarred;

  TaskBoardModel({
    required this.id,
    required this.coverColor,
    required this.boardName,
    this.description,
    this.startTime,
    this.endTime,
    this.attachment,
    this.isStarred = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'coverColor': coverColor.value,
      'boardName': boardName,
      'description': description,
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'attachment': attachment,
      'isStarred': isStarred ? 1 : 0,
    };
  }

  factory TaskBoardModel.fromMap(Map<String, dynamic> map) {
    return TaskBoardModel(
      id: map['id'],
      coverColor: Color(map['coverColor']),
      boardName: map['boardName'],
      description: map['description'],
      startTime:
          map['startTime'] != null ? DateTime.parse(map['startTime']) : null,
      endTime: map['endTime'] != null ? DateTime.parse(map['endTime']) : null,
      attachment: map['attachment'],
      isStarred: map['isStarred'] == 1,
    );
  }
}
