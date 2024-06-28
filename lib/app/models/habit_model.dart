class HabitModel {
  bool isCompleted;
  String habit;
  HabitModel({required this.isCompleted, required this.habit});

  void setAsCompleted() {
    isCompleted = true;
  }

  void setAsUncompleted() {
    isCompleted = false;
  }
}
