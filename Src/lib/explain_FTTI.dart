import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:ossproj_comfyride/Style_Recommendation.dart';

class explain_FTTI extends StatefulWidget {
  const explain_FTTI({super.key});

  @override
  State<explain_FTTI> createState() => _explain_FTTIState();
}

class _explain_FTTIState extends State<explain_FTTI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 260),
            child: FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StyleRecommendation())),
              label: Text('내 FTTI에 맞는 옷 추천받기'),
              icon: Icon(Icons.add_chart_outlined),
            ),
          ),
          appBar: AppBar(
            title: Text(
              "O5C4F1\n편한게 좋은 프로페셔널 직장인",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(child: Image.asset('assets/ex.jpeg')),
              Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          children: [
                            Text(
                                "편안한 소재와 핏을 중시하는 캐주얼 프로페셔널 스타일은 일하는 동안 편안함을 유지하면서도 전문적인 느낌을 연출하는 것을 목표로 합니다. 주로 소프트한 텍스처의 재질과 적절한 핏을 가진 의류를 선택하여 편안함과 스타일을 동시에 살립니다. \n 슬랙스나 팬츠와 함께 셔츠, 블라우스 등을 매치하여 근무 활동에 적합한 옷차림을 완성합니다.\n\n신발 선택 또한 편안함을 고려하는 요소 중 하나입니다. 보통은 로퍼나 플랫 슈즈를 선호합니다 ")
                          ],
                        ))),
              ),
            ],
          ),
        ));
  }
}
