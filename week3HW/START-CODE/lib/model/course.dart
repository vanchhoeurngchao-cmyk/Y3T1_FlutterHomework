import '../model/assignment.dart';

class Course {
  final String id;
  final String name;
  final List<String> studentIds = [];
  final List<Assignment> assigments = [];

  Course({required this.id, required this.name});
}
