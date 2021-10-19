import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_registration/screens/sign_up_screen.dart';
import 'package:login_registration/screens/login_screen.dart';
import '../values/custom_colors.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecundaryColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "       Lista de usuários\n      em tempo real ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StreamBuilder(
                stream:
                    firestore.collection("alunos").orderBy("name").snapshots(),
                builder: (context, dadoretornado) {
                  switch (dadoretornado.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container(
                        child: Text("Aguarde."),
                      );
                    default:
                      QuerySnapshot<Map<String, dynamic>> dados = dadoretornado
                          .data as QuerySnapshot<Map<String, dynamic>>;
                      List<Widget> listaAlunos = [];
                      dados.docs.forEach(
                        (element) {
                          Map<String, dynamic> infoAluno = element.data();

                          listaAlunos.add(
                            ListTile(
                                leading: Icon(Icons.person),
                                title: new Center(
                                  child: new Text(infoAluno["name"],
                                      style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                )),
                          );

                          listaAlunos.add(
                            ListTile(
                                leading: Icon(Icons.mail_outline_rounded),
                                title: new Center(
                                  child: new Text(
                                    infoAluno["email"],
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          );
                        },
                      );
                      return (dadoretornado.hasData)
                          ? Column(children: listaAlunos)
                          : Text("AINDA NÃO TEM NENHUM ALUNO CADASTRADO");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
