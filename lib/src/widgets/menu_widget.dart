import 'package:apec_clone/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _crearDrawerHeader(context),
          Divider(color: Colors.grey,),
          _crearMenuHeader("PRINCIPAL"),
          Divider(color: Colors.grey,),
          _creaOpciones(context, "Inicio", "", Icons.home),
          Divider(color: Colors.grey,),
          _crearMenuHeader("ACADEMICO"),
          Divider(color: Colors.grey,),
          _creaOpciones(context, "Horario", "", Icons.access_time),
          _creaOpciones(context, "Notas", "", Icons.check_circle_outline),
          _creaOpciones(context, "Mi Proyeccion", "", Icons.timeline),
          _creaOpciones(context, "Calcular Indice", "", Icons.format_list_numbered),
          _creaOpciones(context, "Calendario", "", Icons.calendar_today),
          _creaOpciones(context, "Actitud Profesional", "", Icons.person),
          _creaOpciones(context, "Incidencias", "", Icons.perm_contact_calendar),
          Divider(color: Colors.grey,),
          _crearMenuHeader("SERVICIOS"),
          Divider(color: Colors.grey,),
          _creaOpciones(context, "Solicitar", "", Icons.add),
          _creaOpciones(context, "Solicitados", "", Icons.timelapse),
          Divider(color: Colors.grey,),
        ],
      ),
    );
  }

  _crearDrawerHeader(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            child: Image(
              image: NetworkImage('https://electralink.com/wp-content/uploads/2015/12/leadership-profile.png'),
            )
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('ESTUDIANTE UNAPEC', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              Text('20191902', style: TextStyle(color: Colors.white, fontSize: 13),)
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor
      ),
    );
  }

  _crearMenuHeader(String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(name, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
      height: 30,
      decoration: BoxDecoration(
        color: Color.fromRGBO(238, 241, 246, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(242, 243, 245, 1),
            // blurRadius: 1.0, // has the effect of softening the shadow
            spreadRadius: 8.0,
            offset: Offset(-10,0)
          )
        ]
      ),
    );
  }

  _creaOpciones(BuildContext context, String menuName, String routeName, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Color.fromRGBO(90, 90, 90, 1), size: 35,),
      title: Text(menuName, style: TextStyle(color: Colors.grey,fontSize: 16),),
      onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
    );
  }
}