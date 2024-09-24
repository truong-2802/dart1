import 'Student.dart';
import 'StudentRepository.dart';
import 'package:sprintf/sprintf.dart';
import 'dart:io';

class StudentService extends StudentRepository{
  List<Student> list = List<Student>.empty(growable: true);

  @override
  void add(Student st) {
    
    if (st.khl()) return;
    list.add(st);
  }

  @override
  void column() {
    print("\n");
    print("+-----------------------------------------------------------------+");
    print("| Id | Name          | BirthYear | Ielts | BloodType | Gender | EntryDate|");
    print("+-----------------------------------------------------------------+");
  }

  @override
  void row(int i, Student st) {
    
    print(sprintf(
        '| %3d | %-15s | %4d | %6.1f | %5s | %-6s | %-10s |',
        [i, st.name, st.birthYear, st.ielts, st.bloodType, st.gender ? "Male" : "Female", st.entryDate?.toIso8601String() ?? "N/A"]));

    print("+-------------------------------------------------------------------------+");
  }

 

  @override
  void delete(int i) {
    if (i > 0 && i <= list.length) {
      list.removeAt(i - 1);
    } else {
      print("Invalid index for deletion.");
    }
  }

  @override
  void update(int i, Student st) {
    if (i > 0 && i <= list.length) {
      list[i - 1] = st;
    } else {
      print("Invalid index for update.");
    }
  }

  @override
  void table() {
    column();
    int i = 1;
    list.forEach((st) {
      row(i, st);
      i++;
    });
  }

  @override
  void arrange() {
    list.sort((st1, st2) => st1.name.compareTo(st2.name));
  }

  @override
  void search() {
    
    print("Enter keywords to search by name: ");
    String? keyword = stdin.readLineSync()?.toLowerCase();

    
    List<Student> filteredList = list.where((st) {
      return keyword == null || st.name.toLowerCase().contains(keyword);
    }).toList();

   
    if (filteredList.isEmpty) {
      print("No student were found matching the entered name keyword.");
    } else {
      column(); 
      int i = 1;
      filteredList.forEach((st) {
        row(i, st); 
        i++;
      });
    }
  }
   @override
  List<Student> view() {
    
    return list;
  }
}
