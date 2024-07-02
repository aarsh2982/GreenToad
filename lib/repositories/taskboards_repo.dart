// Task Boards Repository

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greentoad_app/models/taskboard_model.dart';
import 'package:greentoad_app/services/database_service.dart';

class TaskBoardsRepository {
  // creates new board record in TaskBoards table
  Future<void> insertBoard(TaskBoardModel board) async {
    final db = await DataBaseService.instance.database;
    await db.insert('task_boards', board.toMap());
  }

  // fetch all boards
  Future<List<TaskBoardModel>> getAllBoards() async {
    final db = await DataBaseService.instance.database;
    final boards = await db.query('task_boards');

    return boards.map((map) => TaskBoardModel.fromMap(map)).toList();
  }

  // find board with given id
  Future<TaskBoardModel?> getBoard(String id) async {
    final db = await DataBaseService.instance.database;
    final maps =
        await db.query('task_boards', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return TaskBoardModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // update board details
  Future<int> updateBoard(TaskBoardModel board) async {
    final db = await DataBaseService.instance.database;

    return await db.update(
      'task_boards',
      board.toMap(),
      where: 'id = ?',
      whereArgs: [board.id],
    );
  }

  // delete board
  Future<int> deleteBoard(String id) async {
    final db = await DataBaseService.instance.database;

    return await db.delete(
      'task_boards',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

// riverpod provider setup for taskboards
final taskboardsRepositoryProvider = Provider((ref) => TaskBoardsRepository());
