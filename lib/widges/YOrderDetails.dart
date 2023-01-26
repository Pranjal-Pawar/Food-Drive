import 'package:flutter/material.dart';
class YOrderDetails extends StatelessWidget {
  const YOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:double.infinity,
            height:100 ,
            color: Colors.cyan,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Donar ABCD",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.cyan[50],
                            fontWeight:FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      SizedBox(
                        width:150,
                      ),
                      IconButton(
                        onPressed:(){},
                        icon:Icon(
                          Icons.call_sharp,
                          size: 35,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Individual",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.cyan[50],
                            fontWeight:FontWeight.normal,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      SizedBox(
                        width:210,
                      ),
                      IconButton(
                        onPressed:(){},
                        icon:Icon(
                          Icons.message_sharp,
                          size: 35,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Non-Vegeterian",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Range:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Serves nearly 4",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Food Description:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Biryani",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Flatno,Road,Station,City,State-Pincode",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time until the order expires:",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            "01:26:34",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child:TextButton(
                    onPressed: () {},
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cancel_sharp,
                          color: Colors.white,
                          size: 38,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child:TextButton(
                    onPressed: () {},
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 38,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'RECEIVED',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
