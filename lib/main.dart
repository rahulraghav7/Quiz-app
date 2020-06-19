
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( splashColor: Colors.transparent,
      brightness: Brightness.dark,
      backgroundColor: Color(0xff252C4A),

          // is not restarted.
          ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  bool buttonState = false;

 List answerbank=['1947','narendar modi','ram nath kovind','1991','tiger'];
 int correctanswer=0;
 List<dynamic> optionbank=[
  ['1655','1989','1978','1947'],
  ['narendar modi','ram nath kovind','rahul raghav','donald trump'],
  ['rahul raghav','sachin tendulkar','ram nath kovind','rajnath singh'],
  ['1980','1986','1991','2008'],
  ['lion','camel','tiger','dog']];
List<dynamic> question=['india got its independence in which year','who is the prime minister of india'
,'who is the president of india ', 'which year is marked as the start of globalisation in india',
'what is india\'s national animal'
];
int qtracker=0;
 var alertStyle = AlertStyle(
      animationType: AnimationType.fromBottom,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      backgroundColor:Color(0xff252C4A) ,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.green,
      ),
    );
void showresult()
{
  Alert(
      context: context,
      style: alertStyle,
      
      title: "Quiz Complete",
      desc: "your score is $correctanswer/5",
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            setState((){
              qtracker=0;
              correctanswer=0;
              _counter=1;

            }),
            Navigator.pop(context),},
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
}
  @override
  Widget build(BuildContext context) {
    
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff252C4A),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Color(0xff40486A)),
                borderRadius: BorderRadius.all(Radius.circular(
                        15) //                 <--- border radius here
                    ),
              ),
              child: Center(
                  child: Text(
                'Questions $_counter/5',
                style: TextStyle(fontSize: 20),
              )),
            ),
            Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Center(
                    child: Text(
                  question[qtracker],
                  style: TextStyle(fontSize: 25),
                ))),
                Padding(padding: EdgeInsets.all(15)),
            GestureDetector(
              child: Options(options:optionbank[qtracker][0]),
              onTap: () => {
                if(answerbank[qtracker]==optionbank[qtracker][0])
                  {
                    correctanswer++,
                    print(correctanswer)
                  },
                
                
                  if(qtracker<4){
                    setState((){
                  qtracker++;
                  _counter++;
                 
                  }),
                  }
                  else{
                   showresult()
                  }
                  
                 

                
              }),
              
            GestureDetector(
              onTap: () => {if(answerbank[qtracker]==optionbank[qtracker][1])
                  {
                    correctanswer++,
                    print(correctanswer)
                  },
                
                
                  if(qtracker<4){
                    setState((){
                  qtracker++;
                  _counter++;
                  
                  }),
                  }
                  else{
                   showresult()
                  }
                 
                 },
              child: Options(options:optionbank[qtracker][1])),
            GestureDetector(
              onTap: () => {
                 if(answerbank[qtracker]==optionbank[qtracker][2])
                  {
                    correctanswer++,
                    print(correctanswer)
                  },
                
                  if(qtracker<4){
                    setState((){
                  qtracker++;
                  _counter++;
                 
                  }),
                  } else{
                   showresult()
                  }
                  
                 
                  },
              child: Options(options:optionbank[qtracker][2])),
            GestureDetector(
              onTap: () => {
                if(answerbank[qtracker]==optionbank[qtracker][3])
                  {
                    correctanswer++,
                    print(correctanswer)
                  },
                
                
                  if(qtracker<4){
                    setState((){
                  qtracker++;
                  _counter++;
                  
                  }),
                  }
                  
                  
                  else{
                   showresult()
                  }},
                  
              child: Options(options:optionbank[qtracker][3])),
            Padding(padding: EdgeInsets.all(15)),
            Center(child: 
            SizedBox( height: 50,
            width: 130,
                          child: RaisedButton(onPressed: (){
                            setState(() {
                              qtracker=0;
                              _counter=1;
                              correctanswer=0;
                            });
                          },
              color: Colors.blue,
              
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
              child: Text('Restart',style: TextStyle(fontSize: 20),),
              
              ),
            )
            ,)
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class Options extends StatelessWidget {

Options({@required this.options});
dynamic options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.only(top:5,bottom:5),
         // shape: new RoundedRectangleBorder(
           //   borderRadius: new BorderRadius.circular(10.0)),
          
          //highlightedBorderColor: Colors.lightBlue,
          //disabledBorderColor: Color(0xff22486B),
          //splashColor: null,
          
          //borderSide: BorderSide(width: 4,color: Color(0xff214566)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
    border: Border.all(color: Color(0xff214A6C),width: 5,style: BorderStyle.solid),
    
    
  ),
          
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$options',
                style: TextStyle(fontSize: 25),
              ),
            ],
          )),
    );
  }
}
