// Unit Test for Event Repository
// Purpose:

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:greentoad_app/models/event_model.dart';
import 'package:greentoad_app/repositories/events_repo.dart';
import 'package:greentoad_app/services/database_service.dart';
import 'package:uuid/uuid.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'mock.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize sqflite for ffi
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group(
    'EventRepository',
    () {
      late MockDatabase mockDatabase;
      late EventsRepository eventsRepository;
      late DataBaseService dataBaseService;

      setUp(() async {
        mockDatabase = MockDatabase();
        dataBaseService = DataBaseService.instance;
        dataBaseService.mockDatabase = mockDatabase;
        eventsRepository = EventsRepository();
      });

      test(
        'should insert an event',
        () async {
          final event = EventModel(
            id: Uuid().v4(),
            title: "Test Event Title",
            startTime: DateTime.parse('2024-06-25T10:00:00.000'),
            endTime: DateTime.parse('2024-06-26T10:00:00.000'),
            description: 'Test Description',
            location: 'Online Meeting',
            color: Color(0xFFE74C3C),
            url: 'https:test-event.digvijay.tech',
            phone: '+447831358032',
            email: 'test-eventmodel.greentoad@digvijay.tech',
            isAllDay: true,
          );

          when(mockDatabase.insert(any, any)).thenAnswer((_) async => 1);

          await eventsRepository.insertEvent(event);

          verify(mockDatabase.insert('events', event.toMap())).called(1);
        },
      );
    },
  );
}
