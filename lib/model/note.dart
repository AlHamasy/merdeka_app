const String tableNotes = "notes";

class NoteFields {
  static const String id = "id";
  static const String title = "title";
  static const String category = "category";
  static const String priority = "priority";
  static const String days = "days";
  static const String isCompleted = "isCompleted";
  static const String time = "time";
}

class Note {
  final int? id;
  final String title;
  final String category;
  final String priority;
  final String days;
  final bool isCompleted;
  final DateTime createdTime;

  Note({
    this.id,
    required this.title,
    required this.category,
    required this.priority,
    required this.days,
    required this.isCompleted,
    required this.createdTime,
  });

  static Note fromMap(Map<String, Object?> map) {
    return Note(
        id: map[NoteFields.id] as int?,
        title: map[NoteFields.title] as String,
        category: map[NoteFields.category] as String,
        priority: map[NoteFields.priority] as String,
        days: map[NoteFields.days] as String,
        isCompleted: map[NoteFields.isCompleted] == 1,
        createdTime: DateTime.parse(map[NoteFields.time] as String)
    );
  }

  Map<String, Object?> toMap() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.category: category,
    NoteFields.priority: priority,
    NoteFields.days: days,
    NoteFields.isCompleted: isCompleted ? 1 : 0,
    NoteFields.time : createdTime.toIso8601String()
  };

}
