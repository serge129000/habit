import 'package:flutter/material.dart';
import 'package:habit_tracking/app/models/habit_model.dart';
import 'package:habit_tracking/app/provider/habit_provider.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  String typedHabit = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Consumer<HabitProvider>(
                    builder: (context, value, widgets) {
                  return AlertDialog(
                    title: Text(
                      "Ajouter une nouvelle habitude",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(),
                        onChanged: (value) {
                          setState(() {
                            typedHabit = value;
                          });
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Annuler",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 13, color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {
                            value.setNewHabit(
                                habit: HabitModel(
                                    isCompleted: false, habit: typedHabit));
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Ajouter",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 13, color: Colors.lightBlue),
                          ))
                    ],
                  );
                });
              }).then((e) {
            setState(() {});
          });
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Suivi d'Habitude",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Consumer<HabitProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.habits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    value.habits[index].habit,
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        value.habits[index].isCompleted
                            ? "Completer"
                            : "Pas completer",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 13,
                            color: value.habits[index].isCompleted
                                ? Colors.lightBlue
                                : Colors.red),
                      ),
                      Checkbox(
                          value: value.habits[index].isCompleted,
                          onChanged: (v) {
                            if (v!) {
                              value.setAsCompleted(index: index);
                            } else {
                              value.setAsUnCompleted(index: index);
                            }
                          })
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
