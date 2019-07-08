import 'package:firebase_database/firebase_database.dart';
class Announce{

  static const KEY = "key";
  static const DATE = "date";
  static const TITLE = "title";
  static const BODY = "body";

  int date;
  String key;
  String title;
  String body;

  Announce(this.date, this.title, this.body);

  Announce.fromSnapshot(DataSnapshot snap):
        this.key = snap.key,
        this.body = snap.value[BODY],
        this.date = snap.value[DATE],
        this.title = snap.value[TITLE];

  toJson(){
    return {BODY: body, TITLE: title, DATE: date, KEY: key};
  }
}


class Mark{

  static const KEY = "key";
  static const COURSE_CODE = "course_code";
  static const MODULE_NAME = "module_name";
  static const DESCRIPTION = "description";
  static const MARKS = "marks";
  static const TEST_DATE = "test_date";

  String key;
  String course_code;
  String module_name;
  String description;
  String marks;
  String test_date;

  Mark(this.course_code, this.module_name, this.description, this.marks, this.test_date);

//  String get key  => _key;
//  String get date  => _date;
//  String get title  => _title;
//  String get body  => _body;


  Mark.fromSnapshot(DataSnapshot snap):
        this.key = snap.key,
        this.course_code = snap.value[COURSE_CODE],
        this.module_name = snap.value[MODULE_NAME],
        this.description = snap.value[DESCRIPTION],
        this.marks = snap.value[MARKS],
        this.test_date = snap.value[TEST_DATE];

  toJson(){
    return {COURSE_CODE: course_code, MODULE_NAME: module_name, DESCRIPTION: description,  KEY: key,MARKS:marks, TEST_DATE:test_date};
  }

}