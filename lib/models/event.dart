enum EventType { impact, suddenStop, signalLoss }

class AccidentEvent {
  final String id;
  final EventType type;
  final DateTime dateTime;
  final String location;

  const AccidentEvent({
    required this.id,
    required this.type,
    required this.dateTime,
    required this.location,
  });

  String get typeLabel {
    switch (type) {
      case EventType.impact:
        return 'IMPACT';
      case EventType.suddenStop:
        return 'SUDDEN STOP';
      case EventType.signalLoss:
        return 'SIGNAL LOSS';
    }
  }

  String get formattedDate {
    const months = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    final h = dateTime.hour.toString().padLeft(2, '0');
    final m = dateTime.minute.toString().padLeft(2, '0');
    return '${dateTime.day} ${months[dateTime.month - 1]} • $h:$m';
  }
}

// Sample data
final List<AccidentEvent> sampleEvents = [
  AccidentEvent(
    id: 'SQL_7782',
    type: EventType.impact,
    dateTime: DateTime(2024, 10, 24, 14, 20),
    location: '30.0444° N, 31.2357° E',
  ),
  AccidentEvent(
    id: 'SQL_7761',
    type: EventType.suddenStop,
    dateTime: DateTime(2024, 10, 24, 12, 15),
    location: '30.0562° N, 31.2289° E',
  ),
  AccidentEvent(
    id: 'SQL_7749',
    type: EventType.signalLoss,
    dateTime: DateTime(2024, 10, 23, 23, 45),
    location: '30.0330° N, 31.2196° E',
  ),
];
