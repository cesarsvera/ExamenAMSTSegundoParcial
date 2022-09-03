import 'package:flutter/material.dart';

class Nav extends StatefulWidget{
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav>{
  int _currentIndex =1;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacheck'),
      ),
      body: _llamarPagina(_currentIndex),
      bottomNavigationBar: _crearNavigationBar(),
    );
  }

  Widget _crearNavigationBar(){
    return BottomNavigationBar(
        unselectedItemColor: Color.fromARGB(168, 97, 93, 4),
        iconSize: 30.0,
        unselectedIconTheme: IconThemeData(size: 25.0),
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Data'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Chart')
        ]);
  }

  Widget _llamarPagina(int paginaActual){
    switch(paginaActual){
      default:
        return Text("Proximamente");
    }
  }
}