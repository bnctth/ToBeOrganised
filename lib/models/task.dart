import 'tasks.dart';

class Task {
  final String name;
  bool checked;
  Tasks sp;


  Task(this.name,this.sp,{this.checked=false});


  void toggle() {
    checked = !checked;
    sp.notifyListeners();
  }
}
