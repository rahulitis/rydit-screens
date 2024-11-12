

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrren4/pie_screen.dart';

import 'add_members.dart';
import 'main.dart';



class FormfeildPage extends StatefulWidget {
  const FormfeildPage({super.key});

  @override
  State<FormfeildPage> createState() => _FormfeildPageState();
}

class _FormfeildPageState extends State<FormfeildPage> {
  int SelectedOption = 0;
  TextEditingController _datepicker = TextEditingController();
  TextEditingController _Timepicker = TextEditingController();
  var DatesPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,


      body:
      Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 20.0),
        child: ListView(
          children: [
            ElevatedButton(

              onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context){
                  return MyHomePage(title: '',);
                }));





              },
              style: ElevatedButton.styleFrom( backgroundColor: Colors.black),
              child: Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 40),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children:[
                    Icon(Icons.arrow_back, color: Colors.white,),
                    SizedBox(width:10 ,),
                    Text("New Ride", style: TextStyle(color: Colors.white, fontSize: 20,),),




                  ],
                ),
              ),
            ),


            TextField(
                style: TextStyle(color: Colors.white),
                decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white54)

                    ),focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepOrange
                    )
                ),

                    hintText: "Sc to Vspk",
                    labelText: "Ride Title"
                )
            ),

            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.white54),borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                        title: Text("You",style: TextStyle(color: Colors.white),) ,
                        leading: Radio<int>(
                            value: 1,
                            groupValue: SelectedOption,
                            onChanged: (int? value){
                              setState(() {
                                SelectedOption = value?? 0;
                              });
                            }),

                        trailing: Container(
                          width: 115,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return AddMember();
                                    }));
                                  },
                                  child: Icon(Icons.add_circle_outline,color: Color(0xffEB1D23),)),

                              Expanded(child: Text("Add members",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w900,color: Color(0xffEB1D23)),))
                            ],
                          ),
                        )

                    ),
                  ),
                )
              ],
            ),
            // const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(bottom: 32,top: 32),
              child: Container(decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(8)),
                child: ListTile(

                  title: Text("Advanced Ride Settings",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white54),),
                  subtitle: Text("only invited groups and riders",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.white)),
                  trailing: Icon(Icons.add_circle_outline),

                ),
              ),
            ),

            Container(
              //   height: 375,
              // width: 360,

              decoration: BoxDecoration(gradient: LinearGradient(colors: [
                Color(0xff53535300),Color(0xff5B5B5B80)
              ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
              ),
                  borderRadius: BorderRadius.circular(8)
              ),child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Container(
                    // height: 275,
                    // width: 340,
                    decoration: BoxDecoration(
                        color: Color(0xED000000),
                        borderRadius: BorderRadius.circular(8)
                    ),

                    child: ListView(
                      shrinkWrap: true,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 340,
                            height: 50,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.white54
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange
                                      )
                                  ),
                                  labelText:"Search location",
                                  hintText: "Search location",
                                  suffixIcon: Icon(Icons.search,color: Color(0xffEB1D23))

                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10,left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      // width: 165,
                                      TextField(controller: _datepicker,
                                          style: TextStyle(color: Colors.white),

                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.white54
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.deepOrange
                                                )
                                            ),
                                            labelText:"Date",
                                            hintText: "DD/MM/YYYY",
                                            suffixIcon: InkWell(
                                                onTap: ()async {
                                                  DateTime? pickedDate =await showDatePicker(
                                                      context: context,
                                                      initialDate: DatesPicked,
                                                      firstDate: DateTime(1900),
                                                      lastDate: DatesPicked);

                                                  if(pickedDate!=null){
                                                    setState(() {
                                                      DatesPicked = pickedDate;
                                                      _datepicker.text = DateFormat("dd-MM-yyyy").format(DatesPicked);
                                                    });
                                                  }



                                                },
                                                child: Icon(Icons.date_range,color: Color(0xffEB1D23))),)),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    // width: 165,s
                                    height: 50,
                                    child: TextField(  controller: _Timepicker,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.white54
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.deepOrange
                                                )
                                            ),
                                            labelText:"time",
                                            hintText: "Start time",
                                            suffixIcon: InkWell(
                                                onTap: ()async{
                                                  TimeOfDay? pickedTime =await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay.now());


                                                  if(pickedTime!=null){
                                                    setState(() {
                                                      var ShowTime = pickedTime;
                                                      _Timepicker.text = ShowTime.format(context);
                                                    });

                                                  }

                                                },
                                                child: Icon(Icons.access_time_outlined,color: Color(0xffEB1D23))
                                            ))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Container(
                            width: 280,
                            height: 50,

                            child: TextField(style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.white54
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange
                                      )
                                  ),
                                  labelText:"Stop Location",
                                  hintText: "Search Location",
                                  suffixIcon: Icon(Icons.search,color: Color(0xffEB1D23))

                              ),
                            ),
                          ),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 340,
                            height: 50,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.white54
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange
                                      )
                                  ),
                                  labelText:"End Location",
                                  hintText: "Search Location",
                                  suffixIcon: Icon(Icons.search,color: Color(0xffEB1D23))

                              ),
                            ),
                          ),
                        ),

                      ],

                    ),
                  ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff5b5b5b),Color(
                        0xff333131)]),

                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent), child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: Colors.white,),
                        Text("Add day",style: TextStyle(color: Colors.white),)

                      ],
                    )),
                  ),
                )

              ],
              // color: Colors.amber   ,
              // (0xffffff)
            )
              ,)
            ,
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 16,right: 16,bottom:10 ),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PieScreen();
                }));
              },style: ElevatedButton.styleFrom(backgroundColor:Color(0xffEB1D23)),child: Text("Next",style: TextStyle(color: Colors.white),)),
            )

          ],
        ),
      ),



      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
