class DoubleStorage {
  double a;

  DoubleStorage._privateConstructor(){
    a = 0;
  }

  static final instance=DoubleStorage._privateConstructor();

}

class StringStorage {
  String newCategoryName;

  StringStorage._privateConstructor(){
    newCategoryName = '';
  }

  static final instance=StringStorage._privateConstructor();

}
