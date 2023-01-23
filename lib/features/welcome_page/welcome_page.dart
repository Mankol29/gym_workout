import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_workout/features/welcome_page/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/gym.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your notebook for gym',
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'e-',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        letterSpacing: 2,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[400],
                      ),
                    ),
                  ),
                ),
                Text(
                  'Gym',
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      letterSpacing: 2,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 400,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Are you",
                      style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        fontSize: 34,
                      ),
                    ),
                    Text(
                      " ready?",
                      style: GoogleFonts.bebasNeue(
                        textStyle: TextStyle(
                          letterSpacing: 1,
                          color: Colors.green[400],
                          fontWeight: FontWeight.bold,
                        ),
                        fontSize: 34,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "To make your",
                      style: GoogleFonts.bebasNeue(
                        textStyle: TextStyle(
                          letterSpacing: 1,
                          color: Colors.green[400],
                          fontWeight: FontWeight.bold,
                        ),
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      " gym life easier?",
                      style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ],
            ),
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                ),
                child: const Text(
                  'START NOW',
                  style: TextStyle(),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
