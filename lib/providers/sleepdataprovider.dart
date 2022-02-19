import 'package:flutter/cupertino.dart';
import 'package:zzzleep/models/sleepinput.dart';

class SleepDataProvider with ChangeNotifier {
  List<SleepData> _sleepDataList = [];

  List<SleepData> get getSleepDataList => _sleepDataList;

  bool _prikaziNulu = false;

  bool get getPrikaziNulu => _prikaziNulu;

  TextEditingController _notesController = TextEditingController();

  TextEditingController get getNotesController => _notesController;

  bool _secondScreen = false;

  bool get getSecondScreen => _secondScreen;

  List _initialSleepDataList = [];

  List get getInitialList => [];

  List wholeList = [];

  int _i = 0;

  int get getIndex => _i;

  bool _hasFocus = false;

  bool get getFocus => _hasFocus;

  set setWholeList(List<SleepData>? sleepData) {
    wholeList.add(sleepData);
  }

  List get getWholeList => wholeList;

  void setSleepDataList({@required List<SleepData>? sleepData}) {
    _sleepDataList = sleepData!;
    notifyListeners();
  }

  void increaseSleepDataList({@required SleepData? sleepData}) {
    _sleepDataList.add(sleepData!);
    notifyListeners();
  }

  void setFallenAsleep({@required int? i, @required String? fallenAsleep}) {
    _sleepDataList[i!].fallenAsleep = fallenAsleep!;
    notifyListeners();
  }

  void setWokenUp({@required int? i, @required String? wokenUp}) {
    _sleepDataList[i!].wokenUp = wokenUp!;
    notifyListeners();
  }

  void calculateHoursMinutes(
      {@required int? i, @required int? hours, @required int? minutes}) {
    _sleepDataList[i!].hours = hours!;
    _sleepDataList[i].minutes = minutes!;
    notifyListeners();
  }

  void prikaziNulu({@required bool? prikaziNulu}) {
    _prikaziNulu = prikaziNulu!;
    notifyListeners();
  }

  void setNotes({@required String? notes}) {
    _sleepDataList[0].notes = notes!;
    _notesController.value = _notesController.value.copyWith(text: notes);
    notifyListeners();
  }

  void secondScreen(bool secondScreen) {
    _secondScreen = secondScreen;
    notifyListeners();
  }

  void setWholeListToEmpty() {
    wholeList.clear();
    notifyListeners();
  }

  // void setWholeList(List<SleepData> sleepData) {
  //   wholeList.add(sleepData);
  //   notifyListeners();
  // }

  void dontUpdateSleepData() {
    SleepData sleepData = SleepData(date: _sleepDataList[0].date);
    _sleepDataList = [sleepData];
    notifyListeners();
  }

  void itemIndex(int i) {
    _i = i;
    notifyListeners();
  }

  void hasFocus(bool hasFocus) {
    _hasFocus = hasFocus;
    notifyListeners();
  }
}
