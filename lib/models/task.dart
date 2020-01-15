import 'tasks.dart';

class Task{
  final String name;
  bool checked=false;
  Tasks sp;

  Task(this.name,this.sp);

  void toggle(){
    checked=!checked;
    sp.notifyListeners();
  }
}