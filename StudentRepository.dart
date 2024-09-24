import 'Student.dart';

abstract class StudentRepository {
  void add(Student st);
  void update(int n, Student st);
  void delete(int n);
  void arrange(); // sắp xếp theo từ a-z

  void search();

  void column();
  void row(int i, Student st);
  void table();
  List<Student> view();
}
