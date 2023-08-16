import 'package:tea/models/answer.dart';
import 'package:tea/models/initial_info.dart';

class Record {
  final InitialInfo initialInfo;
  final List<Answer> answers;

  Record(this.initialInfo, this.answers);
}
