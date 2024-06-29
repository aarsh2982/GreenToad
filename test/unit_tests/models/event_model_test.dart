// Unit Test for Event Model
// Purpose: To test serialization and deserialization of model methods.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greentoad_app/models/event_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  group(
    'EventModel',
    () {
      test(
        'should convert from and to map correctly!',
        () {
          // creating new event model
          final event = EventModel(
            id: const Uuid().v4(), // primary key
            title: "Test Event Title",
            startTime: DateTime.parse('2024-06-25T10:00:00.000'),
            endTime: DateTime.parse('2024-06-26T10:00:00.000'),
            description: 'Test Description',
            location: 'Online Meeting',
            color: const Color(0xFFE74C3C),
            url: 'https:test-event.digvijay.tech',
            phone: '+447831358032',
            email: 'test-eventmodel.greentoad@digvijay.tech',
            isAllDay: true,
          );

          // converts to map
          final map = event.toMap();

          // converts back to model
          final newEvent = EventModel.fromMap(map);

          // expecting test results
          expect(newEvent.id, event.id);
          expect(newEvent.title, event.title);
          expect(newEvent.startTime, event.startTime);
          expect(newEvent.endTime, event.endTime);
          expect(newEvent.description, event.description);
          expect(newEvent.location, event.location);
          expect(newEvent.color, event.color);
          expect(newEvent.url, event.url);
          expect(newEvent.phone, event.phone);
          expect(newEvent.email, event.email);
          expect(newEvent.isAllDay, event.isAllDay);
        },
      );
    },
  );
}
