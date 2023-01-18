import 'package:flutter/material.dart';

class SasaScreen extends StatefulWidget {

  @override
  State<SasaScreen> createState() => _SasaScreenState();
}

class _SasaScreenState extends State<SasaScreen> {
  final List<Tab> tabs= [
    Tab(
      child: Text(
        'tab1',
        style: TextStyle(color: Colors.white,),
      ),

    ),
    Tab(
      child: Text(
        'tab2',
        style: TextStyle(color: Colors.white,),
      ),

    ),
    Tab(
      child: Text(
        'tab3',
        style: TextStyle(color: Colors.white,),
      ),

    ),
  ];

  final List<Widget> myWidget= [
    Text('tab1111111111111111111'),
    Text('tab2222222222222222222'),
    Text('tab3333333333333333333'),
  ];

  Color bgColor = Colors.green;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Column(
              children: [],
            ),
            bottom: TabBar(
              onTap: (int value){
                if(value == 0)
                  {
                    setState((){
                      bgColor = Colors.redAccent;

                    });
                  }
                else if(value == 1)
                {
                  setState((){
                    bgColor = Colors.lightBlueAccent;

                  });
                }
                else{
                  setState((){
                    bgColor = Colors.teal   ;

                  });
                }
              },
              tabs:tabs,
            ),
            backgroundColor: bgColor,
            title: Text('boudy',style: TextStyle(color: Colors.white,),),
            centerTitle: true,

          ),
          body: TabBarView(
            children: myWidget.map((Widget widget){
              return widget;
            }).toList(),
          ),

        )
    );
  }
}
