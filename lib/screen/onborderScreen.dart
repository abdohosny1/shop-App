import 'package:flutter/material.dart';
import 'package:shop_app/network/cash_Helper.dart';
import 'package:shop_app/screen/login_screen.dart';
import 'package:shop_app/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBorderingScreen extends StatefulWidget {

  @override
  _OnBorderingScreenState createState() => _OnBorderingScreenState();
}

class _OnBorderingScreenState extends State<OnBorderingScreen> {
  var borderConteler=PageController();

  List<BorderingModel> list=
  [
    BorderingModel(
        image: 'assets/images/onboar.jpg',
        title: 'on Bord  1 Title',
        body: 'on Bord 1 Body'),
    BorderingModel(
        image: 'assets/images/onboar_1.jpg',
        title: 'on Bord  2 Title',
        body: 'on Bord 2 Body'),
    BorderingModel(
        image: 'assets/images/onboar_2.jpg',
        title: 'on Bord  3 Title',
        body: 'on Bord 3 Body'),
  ];

  bool isLast=false;
  
  void submit(){
    CashHelper.saveData(key: 'OnBoredering', value: true).then((value) {
      if(value){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (e)=>LoginScreen()),(r)=>false);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
              submit();
          }, child: Text('SKIP'))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==list.length-1){
                    setState(() {
                      isLast=true;
                    });

                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                controller: borderConteler,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index) =>bulidBorderingItem(list[index]),
                itemCount: list.length,
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [

                SmoothPageIndicator(
                  count: list.length,
                  controller: borderConteler,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defultColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0
                  ),

               ),


                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                     submit();
                    }else{
                      borderConteler.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }

                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget bulidBorderingItem(BorderingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image:AssetImage('${model.image}') ,
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(height: 30,),
      Text('${model.title}',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      SizedBox(height: 15,),
      Text('${model.body}',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      SizedBox(height: 15,),


    ],);
}
class BorderingModel{
  final String image;
  final String title;
  final String body;

  BorderingModel({required this.image,required this.title,required this.body});

}