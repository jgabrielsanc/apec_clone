import 'package:apec_clone/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 125,
          child: Image(
            image: NetworkImage('https://virtual.unapec.edu.do/res/img/login365/logo.png'),
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.settings)
          )
        ],
      ),
      drawer: MenuWidget(),
      body: Stack(
        children: <Widget>[
          _background(),
          _options(context)
        ],
      ),
    );
  }

  _background() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(242, 242, 242, 1),
    );
  }

  _options(BuildContext context){

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _summary(context),
          _advise(context),
          _button()
        ],
      ),
    );
  }

  _summary(BuildContext context) {

    final text = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).primaryColor, 
          fontSize: 18,
          
        ),
        children: <TextSpan> [
          TextSpan(text: 'Gabriel',style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ', estas viendo tu informacion del periodo ',),
          TextSpan(text: 'Enero - Abril 2019 ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: 'de la carrera '),
          TextSpan(text: 'INGENIERIA DE SOFTWARE', style: TextStyle(fontWeight: FontWeight.bold)),

        ]
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _academic(context, "IA", '3.49'),
              _progress(context),
              _academic(context, "IC", '3.54'),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: text,
          )
        ],
      ),
    );
  }

  _academic(BuildContext context, String title, String number) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Color.fromRGBO(190, 147, 60, 1),
                width: 2,
              ),
          ),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: Center(child: Text(title, style: TextStyle(color: Colors.white,fontSize: 25),)),
          ),
        ),
        SizedBox(height: 5,),
        Text(number, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18,fontWeight: FontWeight.bold),)
      ],
    );
  }

  _progress(BuildContext context) {
    return CircularPercentIndicator(
      radius: 150.0,
      lineWidth: 8.0,
      percent: 0.8,
      center: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("212", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Text("Creditos", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),),
            Text("Cursados", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),),
          ],
        ),
      ),
      progressColor:  Color.fromRGBO(190, 147, 60, 1),
      animation: true,
      backgroundColor: Color.fromRGBO(120, 120, 120, 1),
    );
  }

  _advise(BuildContext context) {
    final textAviso = RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black, 
          fontSize: 18,
          
        ),
        children: <TextSpan> [
          TextSpan(text: 'Dia libre, ',style: TextStyle(color: Color.fromRGBO(194, 151, 54, 1))),
          TextSpan(text: 'hoy no tienes clases',),
        ]
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 13,right: 13,left: 13),
      height: MediaQuery.of(context).size.height * 0.13,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            height: 200,
            width: 50,
            color: Color.fromRGBO(194, 151, 54, 1),
            child: Icon(
              Icons.school,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(child: textAviso),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 10, bottom: 5),
              child: Icon(Icons.arrow_forward, size: 30,color: Color.fromRGBO(194, 151, 54, 1),))
          )

        ],
      ),
    );
  }

  Widget _button() {
    
    return Table(
      children: [
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: 11),
              child: _crearBotones(Colors.black, Icons.check_circle_outline, "Condicion")
            ),
            Container(
              padding: EdgeInsets.only(right: 11),
              child: _crearBotones(Colors.black, Icons.calendar_today, "Incidencias")
            ),
          ]
        ),
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: 11),
              child: _crearBotones(Colors.black, Icons.book, "Materias Cursadas")
            ),
            Container(
              padding: EdgeInsets.only(right: 11),
              child: _crearBotones(Colors.black, Icons.attach_money, "Pagos Pendientes")
            ),
          ]
        ),
      ],
    );
  }

  Widget _crearBotones(Color color, IconData icon, String texto) {

    return Container(
      height: 130.0,
      margin: EdgeInsets.only(top: 6,right: 3,left: 3),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0,),
          Icon(icon, color: Color.fromRGBO(24, 68, 116, 1), size: 50.0,),
          Text(texto, style: TextStyle(color: color),),
          SizedBox(height: 5.0,)
        ],
      ),
    );
  }
}