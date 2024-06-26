// Unit Test for Events View Model
// Purpose:

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:greentoad_app/models/event_model.dart';
import 'package:greentoad_app/view_models/events_viewmodel.dart';
import 'package:uuid/uuid.dart';

import '../repositories/mock.mocks.dart';

void main() {
  group(
    'EventViewModel',
    () {
      late MockEventsRepository mockEventsRepository;
      late EventsViewModel eventsViewModel;

      setUp(() {
        mockEventsRepository = MockEventsRepository();
        eventsViewModel = EventsViewModel(mockEventsRepository);
      });

      test(
        'should fetch events',
        () async {
          final events = [
            EventModel(
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
            )
          ];

          when(mockEventsRepository.getAllEvents())
              .thenAnswer((_) async => events);

          await eventsViewModel.fetchEvents();

          expect(eventsViewModel.events, events);

          verify(mockEventsRepository.getAllEvents()).called(1);
        },
      );
    },
  );
}
