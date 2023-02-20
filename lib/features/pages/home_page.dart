import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_workout/features/data/workout_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createNewWorkout() {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Create new workout"),
              content: TextField(),
              actions: [],
            ));
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
                    title: Text(
                      value.getWorkoutList()[index].name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
