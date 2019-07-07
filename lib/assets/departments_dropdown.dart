import 'package:flutter/material.dart';


class Departments extends StatefulWidget
{
  final List<String> deps;
  final String defdep;
  Function chooseSelected;
  Departments(this.deps,this.defdep,this.chooseSelected);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DepState(this.deps,this.defdep,this.chooseSelected);
  }
}
class DepState extends State<Departments>
{
  
  List<String> deps=[];
  String defdep='';
  Function chooseSelected;
  DepState(this.deps,this.defdep,this.chooseSelected);

/*
@override
initState() {
  super.initState();
  // Add listeners to this class
  defdep=this.defdep;
   
}


@override
void didUpdateWidget(Widget Depstate) {
  if (Depstate)
    initState();
}*/



  @override
  Widget build(BuildContext context) {

    return DropdownButton<String>(
      items: deps.map((String dropDownItem){
       
             return DropdownMenuItem<String>(
               value:dropDownItem ,
               child: Text(dropDownItem),
               //: false

             );
      }).toList(),
      onChanged: (String newSelected)
      {
            defdep=newSelected;
            chooseSelected(newSelected);

      },
    value: defdep,
     isDense: true
    
    ,);
  }
}