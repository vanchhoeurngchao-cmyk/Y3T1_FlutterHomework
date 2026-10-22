import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");

    expect(lms.students.first.name, 'ronan');

    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });

  test('adds and removes a course', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    expect(lms.courses.first.name, 'Dart');

    lms.removeCourse(courseId: 'C1');
    expect(lms.courses.length, 0);
  });

  test('rejects a duplicate course Id', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    expect(() => lms.addCourse(courseId: 'C1', courseName: 'dart'), throwsException);
  });

  test('rejects the removal of nonexistent course', () {
    final lms = LmsSystem();

    expect(() => lms.removeCourse(courseId: 'C2'), throwsException);
  });

  test('reject the removal of course with studentId', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.courses.first.studentIds.add('S1');

    expect(() => lms.removeCourse(courseId: 'C1'), throwsException);

    expect(lms.courses.length, 1);
  });

  test('reject the enrollment of student into a course twice', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'C1'), throwsException);
  });

  test('enrolls a student and verifies it is recorded', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    final course = lms.courses.first;

    expect(course.studentIds.contains('S1'), isTrue);
    expect(course.studentIds.length, 1);
  });

  test('rejects enrollment if the student does not exist', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'C1'), throwsException);
  });

  test('rejects enrollment if the course does not exist', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');

    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'C1'), throwsException);
  });

  test('rejects duplicate enrollment', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'C1'), throwsException);
  });

  test('remove an existing enrollment', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');

    expect(lms.courses.first.studentIds.isEmpty, isTrue);
  });

  test('rejects removal of a nonexistent enrollment', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');

    expect(() => lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1'), throwsException);
  });

  test('verifies student and course still exist after enrollment is removed', (){
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');

    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
    expect(lms.courses.first.studentIds.isEmpty, isTrue);
  });

  test('removes a student who is enrolled in multiple courses', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.addCourse(courseId: 'C2', courseName: 'Flutter');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.enrollStudent(studentId: 'S1', courseId: 'C2');

    lms.removeStudent(studentId: 'S1');

    expect(lms.students.isEmpty, isTrue);
    expect(lms.courses[0].studentIds.isEmpty, isTrue);
    expect(lms.courses[1].studentIds.isEmpty, isTrue);
  });

  test('adds a valid result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(studentId: 'S1', courseId: 'C1', score: 70);

    expect(lms.results.length, 1);
    expect(lms.results.first.score, 70);
    expect(lms.results.first.id, 'R1');
  });

  test('rejects a result for a nonexistent student', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Dart');

    expect(() => lms.addResult(studentId: 'S1', courseId: 'C1', score: 70), throwsException);
  });

  test('rejects a result for a nonexistent course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');

    expect(() => lms.addResult(studentId: 'S1', courseId: 'C1', score: 70), throwsException);
  });

  test('rejects a result for a student who is not enrolled', (){
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');

    expect(() => lms.addResult(studentId: 'S1', courseId: 'C1', score: 70), throwsException);
  });

  test('rejects an invalid score', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(() => lms.addResult(studentId: 'S1', courseId: 'C1', score: 105), throwsException);

    expect(() => lms.addResult(studentId: 'S1', courseId: 'C1', score: -5), throwsException);
  });

  test('rejects a duplicate result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(studentId: 'S1', courseId: 'C1', score: 70);

    expect(() => lms.addResult(studentId: 'S1', courseId: 'C1', score: 80), throwsException);
  });

  test('removes an existing result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.addResult(studentId: 'S1', courseId: 'C1', score: 70);

    lms.removeResult(resultId: 'R1');
    
    expect(lms.results.isEmpty, isTrue);
  });

  test('rejects removal of a nonexistent result', () {
    final lms = LmsSystem();
    
    expect(() => lms.removeResult(resultId: 'R2'), throwsException);
  });

  test('verifies student and course remain unchanged after result removal', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Vanchhoeurng');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.addResult(studentId: 'S1', courseId: 'C1', score: 70);

    lms.removeResult(resultId: 'R1');

    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
  });
}
