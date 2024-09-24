class Student {
  int _id; 
  String _name = '';
  int _birthYear = 0; 
  double _ielts = 0.0; 
  String _bloodType = ''; 
  bool _gender = true; 
  DateTime? _entryDate; 
  
  Student(this._id) {
    this._name = 'Student';
    this._birthYear = 2006;
    this._ielts = 0.0;
    this._bloodType = 'A';
    this._gender = true; 
    this._entryDate = null; 
  }

  bool khl() {
    var hkl = false;

    if (this._name.length < 2) {
      hkl = true;
      print('Name must be at least 2 characters long.');
    }
    if (this._name.length > 32) {
      hkl = true;
      print('Name must be less than 33 characters.');
    }
    if (this._birthYear < 1900 || this._birthYear > DateTime.now().year) {
      hkl = true;
      print('Birth year must be valid.');
    }
    if (this._ielts <= 0 || this._ielts >= 10) {
      hkl = true;
      print('IELTS score must be greater than 0 and less than 10.');
    }
    if (!['A', 'B', 'O'].contains(this._bloodType)) {
      hkl = true;
      print("Blood type must be 'A', 'B', or 'O'.");
    }
    return hkl;
  }

 
  int get id {
    return this._id;
  }

  String get name {
    return this._name;
  }

  void set name(String value) {
    this._name = value;
  }

  int get birthYear {
    return this._birthYear;
  }

  void set birthYear(int value) {
    this._birthYear = value;
  }

  double get ielts {
    return this._ielts;
  }

  void set ielts(double value) {
    this._ielts = value;
  }

  String get bloodType {
    return this._bloodType;
  }

  void set bloodType(String value) {
    this._bloodType = value;
  }

  bool get gender {
    return this._gender;
  }

  void set gender(bool value) {
    this._gender = value;
  }

  DateTime? get entryDate {
    return this._entryDate;
  }

  void set entryDate(DateTime? value) {
    this._entryDate = value;
  }
}


