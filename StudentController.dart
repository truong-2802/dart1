import 'Student.dart';
import 'StudentService.dart';
import 'dart:io';
import 'dart:convert';

class StudentController {
  StudentService studentService = StudentService();

  void run() {
    while (true) {
      try {
        menu();
      } catch (e) {
        if (e is FormatException) {
          print('Data entry format error!');
        } else if (e is IOException) {
          print('Data input and output error!');
        }
        print('Error details: $e');
      }

      print('Do you want to continue (y/n) ? :');
      String yn = stdin.readLineSync().toString();

      if (yn.toLowerCase() != 'y') {
        thoat();
      }
    }
  }

  void menu() {
    print("+------------------------------------------------------------------+");
    print("|1.add | 2.view | 3.update | 4.delete | 5.arrange | 6.search | 0.exit |");
    print("+-------------------------------------------------------------------+");
    print('\n\n Select menu[1-6] : ');
    
    int menu = int.parse(stdin.readLineSync().toString());

    switch (menu) {
      case 1:
        add();
        break;
      case 2:
        view();
        break;
      case 3:
        update();
        break;
      case 4:
        delete();
        break;
      case 5:
        arrange();
        break;
      case 6:
        search();
        break;
      case 0:
        thoat();
        break;
      default:
        print("\n Please select a valid menu!");
        break;
    }
  }

  void add() {
    Student st = Student(0); 

    print("\n Name :");
    st.name = stdin.readLineSync().toString();

    print('\n BirthYear :');
    st.birthYear = int.parse(stdin.readLineSync().toString());

    print('\n Ielts : ');
    st.ielts = double.parse(stdin.readLineSync().toString());

    print('\n BloodType : ');
    st.bloodType = stdin.readLineSync().toString();

    print('\n Gender (1=Male, 0=Female) :');
    st.gender = stdin.readLineSync().toString() == '0' ? false : true;

    print('\n EntryDate (YYYY-MM-DD) : ');
    st.entryDate = DateTime.parse(stdin.readLineSync().toString());

    studentService.add(st);
    studentService.table();
    print('Done adding new!');
  }

  void view() {
    List<Student> students = studentService.view();

    if (students.isEmpty) {
      print("No students available.");
    } else {
      studentService.table(); 
    }
  }

  void update() {
    print('\n Enter the line number to edit: ');
    int i = int.parse(stdin.readLineSync().toString());

    if (i < 1 || i > studentService.view().length) {
      print("Invalid line number.");
      return;
    }

    Student st = Student(0); 

    print("\n Name :");
    st.name = stdin.readLineSync().toString();

    print('\n BirthYear :');
    st.birthYear = int.parse(stdin.readLineSync().toString());

    print('\n Ielts : ');
    st.ielts = double.parse(stdin.readLineSync().toString());

    print('\n BloodType : ');
    st.bloodType = stdin.readLineSync().toString();

    print('\n Gender (1=Male, 0=Female) :');
    st.gender = stdin.readLineSync().toString() == '0' ? false : true;

    print('\n EntryDate (YYYY-MM-DD) : ');
    st.entryDate = DateTime.parse(stdin.readLineSync().toString());

    studentService.update(i, st);
    studentService.table();
    print('The update is done.');
  }

  void delete() {
    print('\n Enter the line number to delete: ');
    int i = int.parse(stdin.readLineSync().toString());

    if (i < 1 || i > studentService.view().length) {
      print("Invalid line number.");
      return;
    }

    studentService.delete(i);
    print('Student deleted successfully.');
    studentService.table();
  }

  void arrange() {
    studentService.arrange();
    print('Students arranged successfully.');
    studentService.table();
  }

  void search() {
    studentService.search();
  }

  void thoat() {
    print("Exiting program...");
    exit(0);
  }
}
