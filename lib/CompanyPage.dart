import 'package:flutter/material.dart';
import 'models/job.dart';
import 'utils/db.dart';
import 'package:flutter/services.dart';



class MyCompany extends StatefulWidget {
  @override
  _MyCompanyState createState() => new _MyCompanyState();
}

class _MyCompanyState extends State<MyCompany>{

  final TextEditingController txt1 = new TextEditingController();
  final TextEditingController txt2 = new TextEditingController();
  final TextEditingController txt3 = new TextEditingController();
  final TextEditingController txt4 = new TextEditingController();
  final TextEditingController txt5 = new TextEditingController();
  final TextEditingController txt6 = new TextEditingController();
  final TextEditingController txt7 = new TextEditingController();

  //DatabaseHelper databaseHelper= new DatabaseHelper();


  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();


  void _handleSubmitted(String txt1,String txt2,String txt3,String txt4,String txt5,String txt6,String txt7) async {

    //int year= int.parse(txt5);
    //int salary= int.parse(txt3);
     print("let's add some data to the db");
     DbHelper k=DbHelper();
     Job job = Job(txt1,txt2,txt3,txt4,int.parse(txt5),txt6,txt7);
     int savedItemId = await k.addJob(job);
     //k.fetchJobs();
    


  }
  void here_we_ago_again() //meme Function
  {

   showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Job Added"),
          content: new Text("Job has been posted successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
);
     txt1.text='';
     txt2.text='';
     txt3.text='';
     txt4.text='';
     txt5.text='';
     txt6.text='';
     txt7.text='';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Company"),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    controller: txt1,
                    decoration: const InputDecoration(
                      hintText: 'enter title',
                      labelText: 'Job Title',
                    ),
                  ),
                  new TextFormField(
                    controller: txt2,
                    decoration: const InputDecoration(
                      hintText: 'enter Type',
                      labelText: 'Type',
                    ),
                    //keyboardType: TextInputType.datetime,


                  ),
                  new TextFormField(
                    controller: txt3,
                    decoration: const InputDecoration(
                      hintText: 'enter location',
                      labelText: 'Location',
                    ),
                    //keyboardType: TextInputType.datetime,

                  ),
                  new TextFormField(
                    controller: txt4,
                    decoration: const InputDecoration(

                      hintText: 'enter Department',
                      labelText: 'Department',
                    ),
                  ),
                    new TextFormField(
                    controller: txt5,
                    decoration: const InputDecoration(

                      hintText: 'enter number of years',
                      labelText: 'Experiance',
                    ),
                  ),

                  new TextFormField(
                    controller: txt6,
                    decoration: const InputDecoration(

                      hintText: 'enter URL',
                      labelText: 'Apply URL',
                    ),
                  ),


                  new TextFormField(
                    controller: txt7,
                    decoration: const InputDecoration(
                      hintText: 'enter description',
                      labelText: 'Job Descreption',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),


                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          _handleSubmitted(txt1.text,txt2.text,txt3.text,txt4.text,txt5.text,txt6.text,txt7.text);
                         here_we_ago_again();
                     },
                      )
                  ),

                ],
              )
          )
      ),
    );
  }
}