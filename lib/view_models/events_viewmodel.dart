// Events View Model
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greentoad_app/models/event_model.dart';
import 'package:greentoad_app/repositories/events_repo.dart';

class EventsViewModel extends ChangeNotifier {
  final EventsRepository _eventsRepository;

  EventsViewModel(this._eventsRepository);

  List<EventModel> _events = [];
  List<EventModel> get events => _events;

  Future<void> fetchEvents() async {
    _events = await _eventsRepository.getAllEvents();
    notifyListeners();
  }

  Future<void> addEvent(EventModel event) async {
    await _eventsRepository.insertEvent(event);
    await fetchEvents();
  }

  Future<void> updateEvent(EventModel event) async {
    await _eventsRepository.updateEvent(event);
    await fetchEvents();
  }

  Future<void> deleteEvent(String id) async {
    await _eventsRepository.deleteEvent(id);
    await fetchEvents();
  }

  Future<EventModel?> getEventById(String id) async {
    return await _eventsRepository.getEvent(id);
  }
}

// Event View Provider
final eventViewModelProvider = ChangeNotifierProvider((ref) {
  final eventRepository = ref.watch(eventsRepositoryProvider);
  return EventsViewModel(eventRepository);
});
