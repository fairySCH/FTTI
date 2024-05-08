import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:ossproj_comfyride/explain_FTTI.dart';

class Choice_Style extends StatefulWidget {
  const Choice_Style({super.key});

  @override
  State<Choice_Style> createState() => _Choice_Style();



}

class _Choice_Style extends State<Choice_Style> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<String> list_ = <String>[];
  List<bool> bool_Grid = [];
  bool isLoading = false; // 로딩 상태 추적
  var count2=false;
  var count1 = 0;

  @override
  void initState() {

    Future.delayed(const Duration(milliseconds: 10), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return GiffyDialog.image(
            Image.network(
              "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif15.gif",
              height: 400,
              fit: BoxFit.cover,
            ),
            title: const Text(
              '나만의 FTTI 찾기',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text(
              '마음에 드는 옷을 선택하면\n나의 FTTI를 알 수 있습니다!',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('시작',textAlign: TextAlign.center,),
              ),
            ],
          );
        },
      );

    });

    print('2');
    _loadData();
    super.initState();


  }



  Future<void> _loadData() async {
    if (isLoading) return; // 이미 로딩 중이면 중복 실행 방지
    setState(() => isLoading = true);
    var querySnapshot = await db.collection("data_real").get();
    List<String> newList = [];

    for (var doc in querySnapshot.docs) {
      newList.add(doc['img']);
      bool_Grid.add(false);
    }
    setState(() {
      list_ = newList;
      isLoading = false;
    });
  }

  // @override
  Widget build(BuildContext context) {



    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('취향에 맞는 옷을 선택해주세요 ' + count1.toString() + '/10개'),
            ),
            body: Stack(
              children: [
                Container(child: grid_generator()),

                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child:  count2 ?  SizedBox(width: 100, height: 100, child:CircularProgressIndicator()) : Container(),)
                )


              ],
            ),


            ));
  }

  Widget grid_generator() {
    if (list_.isEmpty) {
      // list_가 비어 있는지 확인
      return Center(child: CircularProgressIndicator()); // 로딩 인디케이터 표시
    }
    return MasonryGridView.builder(
      gridDelegate:
          SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: list_.length, // itemCount를 list_의 길이로 설정
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // 탭되었을 때 실행할 코드를 여기에 추가합니다.
              setState(() {
                count1++;

                if(count1 == 10){
                  setState(() {
                    count2=true;
                  });

                  Future.delayed(const Duration(milliseconds: 3000), () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return GiffyDialog.image(
                          Image.network(
                            "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif16.gif",
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          title: Text('나만의 FTTI 생성이\n완료 됐습니다.', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('보러가기',textAlign: TextAlign.center,),
                            ),
                          ],
                        );
                        },
                    );
                  });

                Future.delayed(const Duration(milliseconds: 3500), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => explain_FTTI()));
                });



                }
                print(bool_Grid[index]);
                bool_Grid[index] = !bool_Grid[index];
                print(bool_Grid[index]);
              });
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: bool_Grid[index] ? 0.3 : 1,
                      child: Image.network(list_[index]),
                    ),
                    bool_Grid[index]
                        ? Container(
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.check,
                              color: Colors.blue,
                              size: 90,
                            ))
                        : Container(),
                  ],
                )));
      },
    );
  }


}
