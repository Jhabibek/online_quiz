import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:online_quiz/pages/home.dart";
import "package:online_quiz/service/database.dart";

class Question extends StatefulWidget {
  String category;
  Question({super.key, required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool show = false;
  getontheload() async {
    quizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Stream? quizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    return StreamBuilder(
      stream: quizStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? PageView.builder(
                controller: controller,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 15, left: 10, right: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              ds['question'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ds['correctanswer'] ==
                                                  ds['option1']
                                              ? Colors.green
                                              : Colors.red),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option1'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option1'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ds['correctanswer'] ==
                                                  ds['option2']
                                              ? Colors.green
                                              : Colors.red),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option2'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option2'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ds['correctanswer'] ==
                                                  ds['option3']
                                              ? Colors.green
                                              : Colors.red),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option3'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option3'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              show = true;
                              setState(() {});
                            },
                            child: show
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ds['correctanswer'] ==
                                                  ds['option4']
                                              ? Colors.green
                                              : Colors.red),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option4'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ds['option4'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = false;
                                  });
                                  controller.nextPage(
                                      duration: Duration(seconds: 15),
                                      curve: Curves.easeIn);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(60)),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(
                    widget.category,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: allQuiz()),
          ],
        ),
      ),
    );
  }
}
