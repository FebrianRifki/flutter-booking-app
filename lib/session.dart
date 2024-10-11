class Session {
  final int id;
  final String name;
  final String startTime;
  final String endTime;
  final String description;

  Session({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.description,
  });

  // Factory method to create a Session instance from JSON
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['session_id'],
      name: json['name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      description: json['description'],
    );
  }

  // Method to convert a Session instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'session_id': id,
      'name': name,
      'start_time': startTime,
      'end_time': endTime,
      'description': description,
    };
  }
}