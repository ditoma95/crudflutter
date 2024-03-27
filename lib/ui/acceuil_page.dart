import 'package:crud/screens/controle_page.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
        Expanded(
          flex: 3,
          child: Container(
            child: AvatarGlow(
              glowColor: Colors.blue,
              child: const Material(
                elevation: 8,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 139, 13, 13),
                  child: Icon(Icons.person, size: 130, color: Colors.white,),
                  radius: 80,
                )
              ),
            ),
            
          ),
        ),
        Expanded(
          child: Container(
            child: Text("GESTION DES STAGIAIRES"),
          ),
        ),
        Expanded(
          child: Container(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 139, 13, 13),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
              ),
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ControlePage()));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: Text("Liste des stagiaires", style: TextStyle(fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),)),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                      )

                    ),
                      
                  ),
                ),
              )
            ),
          ),
        )
      ]),
    );
  }
}
