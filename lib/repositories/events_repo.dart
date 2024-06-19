// Events Repository
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greentoad_app/models/event_model.dart';
import 'package:greentoad_app/services/database_service.dart';

class EventsRepository {
  // creates new event record in the Events table
  Future<void> insertEvent(EventModel event) async {
    final db = await DataBaseService.instance.database;
    await db.insert('events', event.toMap());
  }

  // fetch all events
  Future<List<EventModel>> getAllEvents() async {
    final db = await DataBaseService.instance.database;
    final result = await db.query('events');

    return result.map((map) => EventModel.fromMap(map)).toList();
  }

  // fetch specified event
  Future<EventModel?> getEvent(String id) async {
    final db = await DataBaseService.instance.database;
    final maps = await db.query('events', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return EventModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // update event
  Future<int> updateEvent(EventModel event) async {
    final db = await DataBaseService.instance.database;

    return await db.update(
      'events',
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }

  // delete event
  Future<int> deleteEvent(String id) async {
    final db = await DataBaseService.instance.database;

    return await db.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

// riverpod provider setup for events
final eventsRepositoryProvider = Provider((ref) => EventsRepository());
