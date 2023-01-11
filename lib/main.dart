import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
    count++;
    });
    print(count);
  }

  bool get isEmpty => count ==0;
  bool get isFull => count ==20;

  @override
  Widget build(BuildContext context) {
    print ('Build');
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.jpg'),//NetworkImage(.....)
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //Alinhamento do eixo principal (.center=no centro);
            children: [
              Text(
                isFull ? 'Lotado' : 'Pode entrar!',
                style: TextStyle(
                  fontSize: 26,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w700,
                  //Grossura do texto;
                  letterSpacing: 4,
                  //Espaçamento das letras
                  backgroundColor: Colors.grey,
                ),
              ),
              // const SizedBox(width:32),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                        //padding: const EdgeInsets.all(32), //.only(left:32, top:30, right:20, bottom:10), .fromLTRB(20, 30, 40, 50),
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        // fundo de click
                        shape: RoundedRectangleBorder(
                          //side: BorderSide(color: Colors.green, width: 5,)
                          borderRadius: BorderRadius.circular(24),
                        )),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                        backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

