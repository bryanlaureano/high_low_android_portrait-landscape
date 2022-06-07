import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

int restricted = 0;
int random = 0;
int previous = 0;
int score = 0;
int guessed_card1 = 53;
int guessed_card2 = 53;
int guessed_card3 = 53;
int guessed_card4 = 53;
int guessed_card5 = 53;
int future_value = 0;
int previous_value = 0;

void main() {
  runApp(const MaterialApp(
    home: ResponsiveWidget(),
  ));
}

class ResponsiveWidget extends StatefulWidget {
  const ResponsiveWidget({Key? key}) : super(key: key);

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Layoutbuilder(
            landscape: Menu_Landscape(), portrait: Menu_Portrait()));
  }
}

class ResponsiveWidget_Game extends StatelessWidget {
  const ResponsiveWidget_Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Layoutbuilder(
            landscape: Game_Landscape(), portrait: Game_Portrait()));
  }
}

class ResponsiveWidget_Gameover extends StatefulWidget {
  const ResponsiveWidget_Gameover({Key? key}) : super(key: key);

  @override
  State<ResponsiveWidget_Gameover> createState() =>
      _ResponsiveWidget2_HomeState();
}

class _ResponsiveWidget2_HomeState extends State<ResponsiveWidget_Gameover> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Layoutbuilder(
            landscape: Gameover_Landscape(), portrait: Gameover_Portrait()));
  }
}

class ResponsiveWidget_Instruction extends StatefulWidget {
  const ResponsiveWidget_Instruction({Key? key}) : super(key: key);

  @override
  State<ResponsiveWidget_Instruction> createState() =>
      _ResponsiveWidget3_HomeState();
}

class _ResponsiveWidget3_HomeState extends State<ResponsiveWidget_Instruction> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Layoutbuilder(
            landscape: Instruction_Landscape(),
            portrait: Instruction_Portrait()));
  }
}

class Layoutbuilder extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  const Layoutbuilder(
      {super.key, required this.landscape, required this.portrait});
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.portrait) {
        return portrait;
      } else {
        return landscape;
      }
    }));
  }
}

class Game_Landscape extends StatefulWidget {
  const Game_Landscape({Key? key}) : super(key: key);

  @override
  State<Game_Landscape> createState() => _HomeState();
}

class _HomeState extends State<Game_Landscape> {
  callback(selector) async {
    await Future.delayed(const Duration(seconds: 2), () {
      previous = random;
      guessed_card1 = previous;
      setState(() {
        random = selector;
        restricted++;
      });
    });
  }

  callback1(previousval) async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        guessed_card2 = previousval;
      });
    });
  }

  callback2() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card3 = guessed_card2;
      });
    });
  }

  callback3() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card4 = guessed_card3;
      });
    });
  }

  callback4(previousval) {
    Future.delayed(const Duration(seconds: 0), () async {
      guessed_card5 = previousval;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/konoha.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 320,
                bottom: 260,
                child: Image.asset(
                  'assets/$guessed_card5.png',
                  width: 120,
                  height: 110,
                ),
              ),
              Positioned(
                left: 240,
                bottom: 260,
                child: Image.asset(
                  'assets/$guessed_card4.png',
                  width: 120,
                  height: 110,
                ),
              ),
              Positioned(
                left: 160,
                bottom: 260,
                child: Image.asset(
                  'assets/$guessed_card3.png',
                  width: 120,
                  height: 110,
                ),
              ),
              Positioned(
                left: 80,
                bottom: 260,
                child: Image.asset(
                  'assets/$guessed_card2.png',
                  width: 120,
                  height: 110,
                ),
              ),
              Positioned(
                left: -5,
                bottom: 260,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 120,
                  height: 110,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 190,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 150,
                  height: 280,
                ),
              ),
              Positioned(
                bottom: 240,
                left: 500,
                child: TextButton(
                  child: Text(
                    'HIGH',
                    style: TextStyle(
                        color: Colors.red, fontFamily: 'naruto', fontSize: 40),
                  ),
                  onPressed: () {
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);

                    if (previous_value <= future_value && restricted != 0) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 80,
                left: 500,
                child: TextButton(
                  child: Text(
                    'LOW',
                    style: TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontFamily: 'naruto',
                        fontSize: 40),
                  ),
                  onPressed: () {
                    int guess = 0;
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);
                    if (previous_value > future_value) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                  bottom: 160,
                  left: 500,
                  child: getpicture(
                    callback: callback,
                  )),
              Positioned(
                  bottom: 10,
                  left: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Score: $score',
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 48, 187),
                          fontFamily: 'naruto',
                          fontSize: 30),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class getpicture extends StatelessWidget {
  int selector = 0;

  final Function callback;
  getpicture({
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        selector = Random().nextInt(52);

        callback(selector);
      },
      child: Text(
        'REVEAL',
        style: TextStyle(
            color: Color.fromARGB(255, 224, 114, 11),
            fontFamily: 'naruto',
            fontSize: 40),
      ),
    );
  }
}

class Gameover_Landscape extends StatefulWidget {
  const Gameover_Landscape({Key? key}) : super(key: key);

  @override
  State<Gameover_Landscape> createState() => _menuState();
}

class _menuState extends State<Gameover_Landscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/gameover_bg.jpg'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: 350,
                bottom: 230,
                child: Text(
                  'GAMEOVER',
                  style: TextStyle(fontFamily: 'naruto', fontSize: 60),
                )),
            Positioned(
                left: 390,
                bottom: 140,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget_Game()));
                  },
                  child: Text(
                    'Try Again?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 111, 6),
                        fontFamily: 'naruto',
                        fontSize: 40),
                  ),
                )),
            Positioned(
                left: 440,
                bottom: 80,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget()));
                  },
                  child: Text('Exit',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'naruto',
                          fontSize: 40)),
                ))
          ],
        ),
      ),
    );
  }
}

class Menu_Landscape extends StatefulWidget {
  const Menu_Landscape({Key? key}) : super(key: key);

  @override
  State<Menu_Landscape> createState() => _MenuState();
}

class _MenuState extends State<Menu_Landscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/menu_bg_landscape.jpg'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: 30,
                bottom: 60,
                child: Image.asset(
                  'assets/naruto_logo.png',
                  width: 400,
                  height: 400,
                )),
            Positioned(
              left: 150,
              bottom: 120,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResponsiveWidget_Game()));
                },
                child: Text('Start',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'naruto',
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            Positioned(
              left: 80,
              bottom: 70,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResponsiveWidget_Instruction()));
                },
                child: Text('Instructions',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'naruto',
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Menu_Portrait extends StatefulWidget {
  const Menu_Portrait({Key? key}) : super(key: key);

  @override
  State<Menu_Portrait> createState() => _Menu2State();
}

class _Menu2State extends State<Menu_Portrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/menu_bg.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: 20,
                bottom: 160,
                child: Image.asset(
                  'assets/naruto_logo.png',
                  width: 400,
                  height: 500,
                )),
            Positioned(
              left: 120,
              bottom: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResponsiveWidget_Game()));
                },
                child: Text('Start',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'naruto',
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            Positioned(
              left: 50,
              bottom: 100,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResponsiveWidget_Instruction()));
                },
                child: Text('Instructions',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'naruto',
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Game_Portrait extends StatefulWidget {
  const Game_Portrait({Key? key}) : super(key: key);

  @override
  State<Game_Portrait> createState() => _Home1State();
}

class _Home1State extends State<Game_Portrait> {
  callback(selector) async {
    await Future.delayed(const Duration(seconds: 2), () {
      previous = random;
      guessed_card1 = previous;
      setState(() {
        random = selector;
        restricted++;
      });
    });
  }

  callback1(previousval) async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        guessed_card2 = previousval;
      });
    });
  }

  callback2() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card3 = guessed_card2;
      });
    });
  }

  callback3() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card4 = guessed_card3;
      });
    });
  }

  callback4(previousval) {
    Future.delayed(const Duration(seconds: 0), () async {
      guessed_card5 = previousval;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/konoha.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 320,
                bottom: 480,
                child: Image.asset(
                  'assets/$guessed_card5.png',
                  width: 100,
                  height: 115,
                ),
              ),
              Positioned(
                left: 236,
                bottom: 480,
                child: Image.asset(
                  'assets/$guessed_card4.png',
                  width: 100,
                  height: 115,
                ),
              ),
              Positioned(
                left: 154,
                bottom: 480,
                child: Image.asset(
                  'assets/$guessed_card3.png',
                  width: 100,
                  height: 115,
                ),
              ),
              Positioned(
                left: 72,
                bottom: 480,
                child: Image.asset(
                  'assets/$guessed_card2.png',
                  width: 100,
                  height: 115,
                ),
              ),
              Positioned(
                left: -8,
                bottom: 480,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 100,
                  height: 115,
                ),
              ),
              Positioned(
                bottom: 120,
                left: 110,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 200,
                  height: 300,
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                child: TextButton(
                  child: Text(
                    'HIGH',
                    style: TextStyle(
                        color: Colors.red, fontFamily: 'naruto', fontSize: 40),
                  ),
                  onPressed: () {
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);

                    if (previous_value <= future_value && restricted != 0) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 30,
                left: 300,
                child: TextButton(
                  child: Text(
                    'LOW',
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 22, 22),
                        fontFamily: 'naruto',
                        fontSize: 40),
                  ),
                  onPressed: () {
                    int guess = 0;
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);
                    if (previous_value > future_value) {
                      score++;

                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResponsiveWidget_Gameover()));
                    }
                  },
                ),
              ),
              Positioned(
                  bottom: 30,
                  left: 130,
                  child: getpicture(
                    callback: callback,
                  )),
              Positioned(
                  bottom: 600,
                  left: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Score: $score',
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 48, 187),
                          fontFamily: 'naruto',
                          fontSize: 20),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Gameover_Portrait extends StatefulWidget {
  const Gameover_Portrait({Key? key}) : super(key: key);

  @override
  State<Gameover_Portrait> createState() => _menu2State();
}

class _menu2State extends State<Gameover_Portrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/gameover_bg_portrait.jpg'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                left: 60,
                bottom: 330,
                child: Text(
                  'GAMEOVER',
                  style: TextStyle(fontFamily: 'naruto', fontSize: 60),
                )),
            Positioned(
                left: 100,
                bottom: 230,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget_Game()));
                  },
                  child: Text(
                    'Try Again?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 111, 6),
                        fontFamily: 'naruto',
                        fontSize: 40),
                  ),
                )),
            Positioned(
                left: 150,
                bottom: 160,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveWidget()));
                  },
                  child: Text('Exit',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'naruto',
                          fontSize: 40)),
                ))
          ],
        ),
      ),
    );
  }
}

class Instruction_Portrait extends StatefulWidget {
  const Instruction_Portrait({Key? key}) : super(key: key);

  @override
  State<Instruction_Portrait> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction_Portrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu_bg.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                  left: 10,
                  bottom: 400,
                  child: Text('first, click the reveal',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
              Positioned(
                  left: 10,
                  bottom: 370,
                  child: Text('then choose between HIGH or LOW and',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
              Positioned(
                  left: 10,
                  bottom: 340,
                  child: Text('repeat the process ',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
            ],
          )),
    );
  }
}

class Instruction_Landscape extends StatefulWidget {
  const Instruction_Landscape({Key? key}) : super(key: key);

  @override
  State<Instruction_Landscape> createState() => _Instruction2State();
}

class _Instruction2State extends State<Instruction_Landscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu_bg_landscape.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                  left: 30,
                  bottom: 200,
                  child: Text(
                      'first, click the reveal then choose between HIGH or LOW and',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
              Positioned(
                  left: 30,
                  bottom: 170,
                  child: Text('repeat the process ',
                      style: TextStyle(
                          fontFamily: 'naruto',
                          color: Colors.white,
                          fontSize: 20))),
            ],
          )),
    );
  }
}
