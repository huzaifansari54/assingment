import '../../src/auth/UI/controller/auth_state.dart';

extension $Bool on bool {
  bool and(bool condition) => this && condition;
  bool or(bool condition) => this || condition;
  bool get toogle => !this;
  bool get isNot => !this;
}

const _vart = <String>[
  "8:00am - 10:00am",
  "10:00am - 1:00pm",
  "1:00pm - 4:00pm",
  "4:00pm - 7:00pm",
  "7:00pm - 10:00pm"
];
Map<Week, List<String>> _map = {
  Week.Mon: _vart,
  Week.Tue: _vart,
  Week.Wed: _vart,
  Week.Thu: _vart,
  Week.Fri: _vart,
  Week.Sat: _vart,
  Week.Sun: _vart
};

extension $MAP on Map<WeeksState, List<ValueState>> {
  Map<WeeksState, List<ValueState>> get hoursWeek => _map.map((k, v) {
        return MapEntry(
            WeeksState(week: k, selected: false, completed: false),
            v
                .map((e) => ValueState(week: k, value: e, selected: false))
                .toList());
      });
  Map<Week, List<String>> fromMap() {
    return map((k, v) {
      return MapEntry(k.week, v.map((e) => e.value).toList());
    });
  }
}
