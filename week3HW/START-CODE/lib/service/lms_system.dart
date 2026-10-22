// ignore_for_file: unused_element

import '../model/student.dart';
import '../model/course.dart';
import '../model/course_result.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> results = [];

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);

    for (Course c in courses) {
      if (c.studentIds.contains(studentId)) {
        c.studentIds.remove(studentId);
      }
    }

    results.removeWhere((r) => r.studentId == studentId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null;
  }

  void addCourse({required String courseId, required String courseName}) {
    Course? isExist = _findCourseOrNull(courseId);
    if (isExist != null) {
      throw Exception("The course is already exist.");
    }
    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    Course? targetCourse = _findCourseOrNull(courseId);
    if (targetCourse == null) {
      throw Exception("The course doesn't exist.");
    }
    if (targetCourse.studentIds.isNotEmpty) {
      throw Exception(
        "This course can't be delete due to contain enrolled students.",
      );
    }

    courses.remove(targetCourse);
  }

  void enrollStudent({required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);
    if (student == null || course == null) {
      throw Exception("Student or Course doesn't exist.");
    }

    for (var i in course.studentIds) {
      if (studentId == i) {
        throw Exception("This student already exist in this course");
      }
    }

    course.studentIds.add(studentId);
  }

  void discardStudentFromCourse(
      {required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);

    if (student == null || course == null) {
      throw Exception("Student or Course doesn't exist.");
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception("This student doesn't exist in this course");
    }

    course.studentIds.remove(studentId);
  }

  // score must be int from 0-100
  // no mulitple results in the same student in the same course.
  void addResult(
      {required String studentId,
      required String courseId,
      required int score}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);

    if (student == null || course == null) {
      throw Exception("Student or Course doesn't exist.");
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception("This student doesn't exist in this course");
    }

    if (score < 0 || score > 100) {
      throw Exception("Invalid score.");
    }

    if (results
        .any((r) => r.studentId == studentId && r.courseId == courseId)) {
      throw Exception("This student already has a result for this course.");
    }

    String genId = 'R${results.length + 1}';

    results.add(CourseResult(
        id: genId, studentId: studentId, courseId: courseId, score: score));
  }

  void removeResult({required String resultId}) {
    CourseResult? targetResult;
    for (var i in results) {
      if (i.id == resultId) {
        targetResult = i;
        break;
      }
    }

    if (targetResult == null) {
      throw Exception("Result not found.");
    }

    results.remove(targetResult);
  }
}
