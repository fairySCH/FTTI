import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ossproj_comfyride/provider/ImageProviderNotifier.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Cart extends StatefulWidget {
  final String uid;
  final String FTTI_eng;
  final String FTTI_full_eng;
  final double bestF;
  final double bestO;
  final double bestC;

  Cart({
    required this.uid,
    required this.FTTI_eng,
    required this.FTTI_full_eng,
    required this.bestF,
    required this.bestO,
    required this.bestC,
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> list_ = [];
  var list_cart = [];
  bool isLoading = false; // 로딩 상태 추적
  bool initialLoading = true; // 첫 로딩 상태 추적
  bool _isLoadingMore = false; // 추가 데이터 로딩 상태 추적
  DocumentSnapshot? _lastDocument; // 마지막으로 로드된 문서
  final ScrollController _scrollController = ScrollController();
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _loadData(initial: true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !_isLoadingMore) {
        _loadData();
      }
    });

    print('UID: ${widget.uid}');
    print('FTTI_eng: ${widget.FTTI_eng}');
    print('FTTI_full_eng: ${widget.FTTI_full_eng}');
    print('bestF: ${widget.bestF}');
    print('bestO: ${widget.bestO}');
    print('bestC: ${widget.bestC}');
  }

  Future<void> _loadData({bool initial = false}) async {
    if (isLoading || _isLoadingMore) return; // 이미 로딩 중이면 중복 실행 방지

    if (initial) {
      setState(() => isLoading = true);
    } else {
      setState(() => _isLoadingMore = true);
    }

    QuerySnapshot querySnapshot;
    if (_lastDocument == null) {
      querySnapshot = await db.collection('cart_data').limit(30).get();
    } else {
      querySnapshot = await db
          .collection('cart_data')
          .where('uid', isEqualTo: widget.uid)
          .get();
    }


    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      print('@@@@@@@@@ : ${doc.id}');
        list_.add({
          'img': data['img'],
          'link': data['link'],
        });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // 우측의 액션 버튼들
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart,color: Colors.transparent,)),
        ],
        leading:
        IconButton(onPressed: () {

          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)), // 왼쪽 메뉴버튼
        automaticallyImplyLeading: false, // 뒤로가기 버튼 숨기기
        title: Center(
            child:
            Padding(
              padding: EdgeInsets.only(left: 0),
              child:   Text(
                'FTTI',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )

        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 10),
              Text(
                "찜 LIST",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child:gridGenerator(context),
              ),
              // if (_isLoadingMore)
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: CircularProgressIndicator(),
              //   ),
            ],
          ),
        ],
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent &&
        !_isLoadingMore) {
      _loadData();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Widget gridGenerator(BuildContext context) {
    return MasonryGridView.builder(
      controller: _scrollController,
      gridDelegate:
      SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: list_.length, // 로딩 중이면 추가 아이템 표시
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      itemBuilder: (context, index) {
        return
          Stack(
              children :[
                GestureDetector(
                  onTap: () async {
                    String shoppingMallUrl = list_[index]['link'];
                    await launchUrl(Uri.parse(shoppingMallUrl));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: list_[index]['img'],
                      placeholder: (context, url) => Container(
                        color: Colors.grey[300],
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ]
          );

      },
    );
  }
}
