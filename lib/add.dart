/* import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winncar/main.dart';
import 'package:winncar/model.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'crudModel.dart';

enum DialogState {
  LOADING,
  COMPLETED,
  DISMISSED,
}


class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();
  DialogState _dialogState = DialogState.DISMISSED;


  final _key = GlobalKey<ScaffoldState>();
  String name ;
  String mz ;
  String villa;
  String _date = '${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}';
  
  String _time = ' no hay data';

  @override
  Widget build(BuildContext context) {
    
    final recordsProvider = Provider.of<CrudModel>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Center(child: Text('Add')),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nombre del visitante',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese un nombre del visitante';
                      }
                    },
                      onSaved: (value) => name = value
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mz',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese Mz';
                      }
                    },
                      onSaved: (value) => mz = value
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Villa',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese Villa';
                      }
                    },
                      onSaved: (value) => villa = value
                  ),
                  RaisedButton(
                    shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                    elevation: 4.0,
                    onPressed: (){
                          DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.es);
                    },
                    child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Cambiar",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              
                  ),
                  RaisedButton(
                    splashColor: Colors.red,
                    onPressed:() async{
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();

                        var result = await recordsProvider.addRecord(Record(name: name,mz: int.parse(mz), villa: int.parse(villa), date: _date));
                        if( result == false){
                          setState(()=> _dialogState = DialogState.LOADING);
                          Future.delayed(Duration(seconds: 1)).then((_){
                            setState(()=> _dialogState = DialogState.COMPLETED);
                            Timer(Duration(seconds: 2), () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage())));
                          });
                        }else{
                          setState(()=> _dialogState = DialogState.LOADING);
                          Future.delayed(Duration(seconds: 1)).then((_){
                            setState(()=> _dialogState = DialogState.COMPLETED);
                            Timer(Duration(seconds: 2), () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage())));
                          });
                        }
                          
                        
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          MyDialog(
              state: _dialogState,
            )
        ],
      ),
    );
  }

}



class MyDialog extends StatelessWidget {
  final DialogState state;
  MyDialog({this.state});

  @override
  Widget build(BuildContext context) {
    return state == DialogState.DISMISSED
        ? Container()
        : Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.red,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            content: Container(
              width: 250.0,
              height: 100.0,
              child: state == DialogState.LOADING
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Guardando Visitante...",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Color(0xFF5B6978),
                          ),
                        ),
                      )
                    ],
                  )
                  : Center(
                      child: Text('Visitante guardado con exito'),
                    ),
            ),
          ),
        );
  }
} */