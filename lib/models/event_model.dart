// Event Model
import 'package:flutter/material.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final Color color;
  final bool isAllDay;
  final String url;
  final String phone;
  final String email;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.color,
    required this.isAllDay,
    required this.url,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'location': location,
      'color': color,
      'isAllDay': isAllDay ? 1 : 0,
      'url': url,
      'phone': phone,
      'email': email,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      location: map['location'],
      color: map['color'],
      isAllDay: map['isAllDay'],
      url: map['url'],
      phone: map['phone'],
      email: map['email'],
    );
  }
}
