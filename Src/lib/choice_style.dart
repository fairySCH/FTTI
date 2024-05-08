import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';

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
  var count1 = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
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
            body: Container(child: grid_generator()),
            floatingActionButton: FloatingActionButton.large(onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FirstScreen()), //FirseScreen -> 설명 페이지로 변경 필요
                );
              });
            })));
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
                            child: Icon(
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
