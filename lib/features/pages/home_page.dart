import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_workout/features/data/workout_data.dart';
import 'package:provider/provider.dart';

import 'workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final newWorkoutSaveController = TextEditingController();

  void createNewWorkout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Create new workout"),
              content: TextField(
                controller: newWorkoutSaveController,
              ),
              actions: [
                // save button
                MaterialButton(
                  onPressed: save,
                  child: const Text('Save'),
                ),

                // cancel button

                MaterialButton(
                  onPressed: cancel,
                  child: const Text('Cancel'),
                )
              ],
            ));
  }

  // go to workout page
  void workoutPage(String workoutName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutPage(workoutName: workoutName),
        ));
  }

  // save workout
  void save() {
    // get workout name from controller
    String newWorkoutSave = newWorkoutSaveController.text;
    //add workout
    Provider.of<WorkoutPlan>(context, listen: false).addWorkout(newWorkoutSave);

    // pop of dialog
    Navigator.pop(context);
    clear();
  }

  // cancel workout
  void cancel() {
    // pop of dioalog
    Navigator.pop(context);
    clear();
  }

  // clear dialog
  void clear() {
    newWorkoutSaveController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: const Text('Your training'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewWorkout,
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/gym-2.jpg',
            ),
            opacity: 50,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              color: const Color.fromARGB(160, 55, 116, 57),
              child: Center(
                child: Text(
                  'Add or Sellect your own plan for today',
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(color: Colors.white),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Consumer<WorkoutPlan>(
              builder: (context, value, child) => SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.getWorkoutList().length,
                  itemBuilder: (context, index) => ListTile(
                    title: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.white54,
                      child: Text(
                        value.getWorkoutList()[index].name,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: Container(
                      color: Colors.white54,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () =>
                            workoutPage(value.getWorkoutList()[index].name),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
