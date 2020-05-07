import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/view_model/login_model.dart';
import 'ui/helpers/constants.dart';
import 'ui/route.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
        ChangeNotifierProvider(builder: (context) => LoginViewModel(),)
     ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
                primarySwatch: customPrimaryColor,
                fontFamily: 'Poppins',
                textTheme: TextTheme(
                  title: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )
        ),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
} 

/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winncar/add.dart';
import 'package:winncar/crudModel.dart';
import 'package:winncar/details.dart';
import 'package:winncar/model.dart';




void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(builder: (_) => CrudModel()),
       //Provider<CrudModel>(builder: (_) => CrudModel(),)
       
     
      ],
      child: MaterialApp(
        title: 'Prueba a Base',
        home: MyHomePage(),

      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Record records;
  Record recordsDetails; 


  final dummySnapshot = [
 {"name": "Filip", "votes": 15},
 {"name": "Abraham", "votes": 14},
 {"name": "Richard", "votes": 11},
 {"name": "Ike", "votes": 10},
 {"name": "Justin", "votes": 1},
];

var stream;

CrudModel crudModel = new CrudModel();

  
 
@override
  void initState() {
    
    
    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
  /*         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Add()),
  ); */
        }
      ),
      appBar: AppBar(
          title: Text('Pruebas a Base'),
      ),
      body: _red()
       
    );
  }

 Widget _red() {
    final recordsProvider = Provider.of<CrudModel>(context);

    return StreamBuilder(
      stream: recordsProvider.getData(),
      //initialData: recordsProvider.fetchProductsAsStream(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData) return CircularProgressIndicator();

        int length = snapshot.data.documents.length;


        return ListView.builder(
          itemCount: length,
          itemBuilder: (BuildContext ct,int i, ){
            final DocumentSnapshot doc = snapshot.data.documents[i];
            return Text('${doc['name']}');
          }
        );
      },
    );


  


    
        
  }




  Widget _construirList(List<DocumentSnapshot> data){

    return ListView(
      children: data.map((data) => _listIt(data)).toList(),
    );

  }



  




  Widget _listIt (DocumentSnapshot data){



    final record = Record.fromSnapshot(data);


    return Padding(
     key: ValueKey(record.name),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text(record.name),
         trailing: Text(record.mz.toString()),
         onTap: () => print(record),
       ),
     ),
   );
  }




  
}


class Record {
 final String name;
 final int mz;
 final DocumentReference reference;

 Record.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['name'] != null),
       assert(map['mz'] != null),
       name = map['name'],
       mz = map['mz'];

 Record.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);OO

 @override
 String toString() => "Record<$name:$mz>";
} 

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winncar/classExample.dart';
import 'scree_new.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
            StreamProvider<FirebaseUser>.value(
              value:FirebaseAuth.instance.onAuthStateChanged,
            )
          ],
          child: MaterialApp(
          // theme: ThemeData(brightness: Brightness.dark),
          home: Home(),
        ),
    );
 
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  final db = ProvedorUsers();

  @override
  Widget build(BuildContext context) {

    var user = Provider.of<FirebaseUser>(context);
    bool loggedIn = user != null;

    return Scaffold(
      body: loggedIn ? 
      Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => HomePage()),
                 )
      : Column(
        children: <Widget>[
          Center(
            child:  RaisedButton(
              child: Text('Login'),
              onPressed: FirebaseAuth.instance.signInAnonymously,
             ),
          ),
        ],
      )
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final provider = new ProvedorUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: _listStream(),
    );
  }

  Widget _listStream() {
    return StreamBuilder(
      stream: provider.getUser(),
      builder: (context, AsyncSnapshot<List<User>> snap){
    
       
        if(!snap.hasData){
          return Center(child: CircularProgressIndicator());
        }

        List<User> users = snap.data;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, int i ){
            final user = users[i];
            return ListTile(
              title: Text(user.name),
              onTap: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => DetailsUser(name: 'detalles', user: user,)),
                 );
              },
            );
          }
        );
      }
    );
  }
}
*/




