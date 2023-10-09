import 'package:tea/models/location.dart';

class InitialInfo {
  late int age;
  late String sex;
  late Location location;

  InitialInfo() {
    age = 18;
    sex = '';
    location = Location();
  }
}
