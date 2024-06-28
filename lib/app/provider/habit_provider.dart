import 'package:flutter/foundation.dart';

import '../models/habit_model.dart';

class HabitProvider with ChangeNotifier {
  final List<HabitModel> _habits = [];
  List<HabitModel> get habits => _habits;

  void setNewHabit({required HabitModel habit}) {
    _habits.add(habit);
    notifyListeners();
  }

  void setAsCompleted({required int index}) {
    HabitModel habit = _habits[index];
    habit.setAsCompleted();
    _habits.removeAt(index);
    _habits.add(habit);
    notifyListeners();
  }

  void setAsUnCompleted({required int index}) {
    HabitModel habit = _habits[index];
    habit.setAsUncompleted();
    _habits.removeAt(index);
    _habits.add(habit);
    notifyListeners();
  }
}
