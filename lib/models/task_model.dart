import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TaskModel extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.title,
    this.isDeleted,
    this.isDone,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  @override
  List<Object?> get props => [
        title,
        isDeleted,
        isDone,
      ];

  TaskModel copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }
}
