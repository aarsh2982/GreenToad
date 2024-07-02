// TaskBoards View Model
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greentoad_app/models/taskboard_model.dart';
import 'package:greentoad_app/repositories/taskboards_repo.dart';

class TaskBoardsViewModel extends ChangeNotifier {
  final TaskBoardsRepository _taskBoardsRepository;

  TaskBoardsViewModel(this._taskBoardsRepository);

  List<TaskBoardModel> _boards = [];
  List<TaskBoardModel> get boards => _boards;

  Future<void> fetchBoards() async {
    _boards = await _taskBoardsRepository.getAllBoards();
    notifyListeners();
  }

  Future<TaskBoardModel?> findBoardById(String id) async {
    return await _taskBoardsRepository.getBoard(id);
  }

  Future<void> createBoard(TaskBoardModel board) async {
    await _taskBoardsRepository.insertBoard(board);
    await fetchBoards();
  }

  Future<void> updateBoard(TaskBoardModel board) async {
    await _taskBoardsRepository.updateBoard(board);
    fetchBoards();
  }

  Future<void> deleteBoard(String boardId) async {
    await _taskBoardsRepository.deleteBoard(boardId);
    fetchBoards();
  }
}

// TaskBoard View Provider
final taskBoardViewModel = ChangeNotifierProvider((ref) {
  final taskBoardRepository = ref.watch(taskboardsRepositoryProvider);
  return TaskBoardsViewModel(taskBoardRepository);
});
