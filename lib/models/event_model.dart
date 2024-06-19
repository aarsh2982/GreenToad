// Event Model
import 'package:flutter/material.dart';

class EventModel {
  final String id; // primary key
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String? description;
  final String? location;
  final Color? color;
  final String? url;
  final String? phone;
  final String? email;
  final bool isAllDay;

  EventModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    this.description,
    this.location,
    this.color,
    this.url,
    this.phone,
    this.email,
    this.isAllDay = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'location': location,
      'color': color?.value,
      'url': url,
      'phone': phone,
      'email': email,
      'isAllDay': isAllDay ? 1 : 0,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      startTime: DateTime.parse(map['startTime']),
      endTime: DateTime.parse(map['endTime']),
      location: map['location'],
      color: map['color'] != null ? Color(map['color']) : null,
      url: map['url'],
      phone: map['phone'],
      email: map['email'],
      isAllDay: map['isAllDay'] == 1,
    );
  }
}
