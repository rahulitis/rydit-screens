import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'main.dart';

void main(){
runApp(AddMember());
}

class AddMember extends StatefulWidget {
  @override
  State<AddMember> createState() {
   return _AddMemberState();

  }
}
class _AddMemberState extends State<AddMember>{
  int selectedToggleIndex = 0;
  List images = ['assets/images/1.png','assets/images/2.png','assets/images/3.png','assets/images/4.png','assets/images/5.png','assets/images/6.png','assets/images/7.png','assets/images/8.png','assets/images/9.png',];
  List names = ['ram', "mahesh","tony","mike","ashrith","dhruva","teja","shrik","leonard"];
  List groupImages = ['assets/groupimages/7146.png','assets/groupimages/7146-1.png','assets/groupimages/7146-2.png','assets/groupimages/7146-3.png','assets/groupimages/7146-4.png','assets/groupimages/7146-5.png','assets/groupimages/7146-6.png','assets/groupimages/7146-7.png','assets/groupimages/7146-8.png','assets/groupimages/7146-9.png'];
  List groupNames = ["Clan Riders","Speed Freaks","Blazing Riders","Dragon Riders","Drag Racers","Indian Riders","Flash dragers","Bomb Bikers","ley Bikers","indie Bikers",];
  List subtitleText = ["4 Members","5 Members","10 Members","15 Members","20 Members","14 Members","24 Members","9 Members","10 Members","17 Members",];




  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.black,
     body:
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(bottom: 20.0),
               child: Row(children: [
                 InkWell( onTap: (){
                   Navigator.pop(context, MaterialPageRoute(builder: (context){
                     return MyApp();
                   }));
                 },
                     child: Icon(Icons.arrow_back,color: Colors.white,)),
                 Padding(
                   padding: const EdgeInsets.only(left: 8.0),
                   child: Text("Add Participants",style: TextStyle(color: Colors.white,fontSize: 24,fontFamily: 'popins'),),
                 )
               ]),
             ),
             Padding(
               padding: const EdgeInsets.only(bottom: 20.0),
               child: TextField(style: TextStyle(color: Colors.white),
                 decoration: InputDecoration(

                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.search)
                       ,hintText: "Search"
                 ),


               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,

               children: [

                 ToggleSwitch(cornerRadius: 25,
          radiusStyle: true,
          initialLabelIndex: selectedToggleIndex,
          minWidth: 190,

          minHeight: 30,
          activeBgColor: [Color(0xffEB1D23)],
          activeFgColor: Colors.white,
          inactiveBgColor: Color(0xff5750501F),
          inactiveFgColor: Colors.white,
          totalSwitches: 2,
          labels: ['All','Groups'],
          onToggle: (index){
            setState(() {
              selectedToggleIndex = index!;
            });;
          },
        ),
         

       ],

         ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.only(top: 20.0),
                 child: selectedToggleIndex == 0 ?


                 ListView.builder(itemCount: images.length,
                     itemBuilder: (BuildContext context,int index){
                   return Padding(
                     padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                     child: ListTile(
                       leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),


                       title: Padding(
                         padding: const EdgeInsets.only(left: 0),
                         child: Text(names[index],style: TextStyle(color: Colors.white),),
                       ),
                     ),
                   );
                 })


                     // ELSE STATEMENT ELSE STATEMENT
                     :


                 ListView.builder(itemCount: groupImages.length,
                     itemBuilder: (BuildContext context,int index){
                       return Padding(
                         padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                         child: ListTile(
                           leading:  CircleAvatar(backgroundImage: AssetImage(groupImages[index]),),


                           title: Padding(
                             padding: const EdgeInsets.only(left: 15.0),
                             child: Text(groupNames[index],style: TextStyle(color: Colors.white),),
                           ),
                           subtitle: Text(subtitleText[index]),
                         ),
                       );
                     }),
               ),
             )
  ]
         )
           
           

    ));
  }



}

