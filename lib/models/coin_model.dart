// List<DataCoin> _dataFormApi = [];
//   var loading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getDataCoin();
//   }

//   Future<Null> getDataCoin() async {
//     setState(() {
//       loading = true;
//     });
//     var url = Uri.https("api.nomics.com", "/v1/currencies/ticker", {
//       "key": "f8c223b1b91c4a2e317b01f9d8a27418",
//       "ids": "",
//       "interval": "1d,30d",
//       "convert": "EUR",
//       "per-page": "100",
//       "page": "1"
//     });
//     var response = await http.get(url);
//     // _dataFormApi = dataCoinFromJson(response.body);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       // print(data);
//       setState(() {
//         for (Map i in data) {
//           _dataFormApi.add(DataCoin.fromJson(i));
//         }
//         loading = false;
//       });
//     }
//     // print(_dataFormApi[1].name);
//   }

//   Widget build(BuildContext context) {
//     // print('build');
//     // List<Widget> data = [];
//     return Scaffold(
//       body: Container(
//           child: loading
//               ? Center(
//                   child: Container(
//                     child: CircularProgressIndicator(),
//                   ),
//                 )
//               : SingleChildScrollView(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           padding: EdgeInsets.only(top: 5),
//                           child: ListView.builder(
//                             itemCount: _dataFormApi.length,
//                             shrinkWrap: true,
//                             physics: ClampingScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return Container(
//                                   // margin: EdgeInsets.only(bottom: 16),
//                                   child: Column(
//                                 children: <Widget>[
//                                   // Container(
//                                   //   child: SvgPicture.network(_dataFormApi[index].logoUrl,cacheColorFilter: null,headers: null,),
//                                   // ),
//                                   // Text(_dataFormApi[index].name),
//                                   Padding(
//                                     padding: const EdgeInsets.all(5),
//                                     child: SizedBox(
//                                       // height: MediaQuery.of(context).size.height -
//                                       //     730,
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             // color: Colors.purple,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Colors.purple[50],
//                                               ),
//                                             ]),
//                                         child: ListTile(
//                                           leading: CircleAvatar(),
//                                           contentPadding: EdgeInsets.all(10),
//                                           title: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               // Image(image: ),
//                                               Text(
//                                                 _dataFormApi[index].name,
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 24,
//                                                     fontWeight:
//                                                         FontWeight.w500),
//                                               ),
//                                               Text(
//                                                 _dataFormApi[index].price,
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 20,
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                           trailing: Column(
//                                             children: <Widget>[
//                                               Container(
//                                                 width: 70,
//                                                 height: 30,
//                                                 child: Text(
//                                                   _dataFormApi[index]
//                                                       .the1D
//                                                       .priceChangePct,
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       color: getColor(
//                                                           _dataFormApi[index]
//                                                               .the1D
//                                                               .priceChangePct)),
//                                                 ),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5)),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ));
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )),
//     );
//   }
// }

// getColor(String priceChangePct) {
//   if (priceChangePct.contains("-"))
//     return Colors.red;
//   else
//     return Colors.green;
// }
