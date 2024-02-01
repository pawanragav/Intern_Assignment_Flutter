import 'package:flutter/material.dart';
import 'package:intern_assignment/models/offer_model.dart';
import 'package:intern_assignment/screens/task_provider.dart';
import 'package:provider/provider.dart';

class TaskDetails extends StatefulWidget {
  final OfferModel om;
  const TaskDetails({
    super.key,
    required this.om,
  });

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool yesButtonClicked1 = false;
  bool yesButtonClicked2 = false;
  bool yesButtonClicked3 = false;
  bool yesButtonClicked4 = false;
  final String completed = "Completed all the above 3 steps?";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yesButtonClicked4 ? widget.om.earned! : '0.00';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 28,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Task Details',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: 600,
        height: 900,
        color: Colors.black,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 400,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.amber,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            width: 120,
                            height: 110,
                            child: Image.network(widget.om.brand!.logo!),
                          ),
                        ),
                        SizedBox(width: 3),
                        Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: buildRichTextTitle(widget.om.title!,
                                      maxWords: 5),
                                ),
                                buildRichText(widget.om.shortDesc!,
                                    maxWords: 6),
                                Row(
                                  children: [
                                    Text(
                                      'Status:',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      widget.om.status!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(endIndent: 20, indent: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Steps (1/4)',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(width: 240),
                Text(
                  yesButtonClicked4 ? widget.om.payoutAmt!.toString() : "0.00",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Container(
              width: 400,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.amber,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 480,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Step 1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: const Text(
                                          "Are you sure you installed the application?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked1 = false;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked1 = true;
                                            });
                                            Navigator.of(context).pop();
                                            // Yes button clicked, do something if needed
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Install the Application",
                                style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                            child: Container(), // Added Expanded widget here
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                // Do something when IconButton is clicked
                              },
                              icon: Icon(
                                yesButtonClicked1 ? Icons.check : Icons.close,
                                color: yesButtonClicked1
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 480,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Step 2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: const Text(
                                          "Are you sure you completed Step 2?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked2 = false;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked2 = true;
                                            });
                                            Navigator.of(context).pop();
                                            // Yes button clicked, do something if needed
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                widget.om.ctaLong!,
                                style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                            child: Container(), // Added Expanded widget here
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                // Do something when IconButton is clicked
                              },
                              icon: Icon(
                                yesButtonClicked2 ? Icons.check : Icons.close,
                                color: yesButtonClicked2
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 480,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Step 3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: const Text(
                                          "Are you sure you completed Step 3?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked3 = false;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked3 = true;
                                            });
                                            Navigator.of(context).pop();
                                            // Yes button clicked, do something if needed
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Refer ${widget.om.brand!.title!} to friend",
                                style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                            child: Container(), // Added Expanded widget here
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                // Do something when IconButton is clicked
                              },
                              icon: Icon(
                                yesButtonClicked3 ? Icons.check : Icons.close,
                                color: yesButtonClicked3
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 480,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Step 4",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: const Text(
                                          "Are you sure you completed Step 4?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked4 = false;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              yesButtonClicked4 = true;
                                            });
                                            Navigator.of(context).pop();
                                            // Yes button clicked, do something if needed
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                completed,
                                style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                            child: Container(), // Added Expanded widget here
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                // Do something when IconButton is clicked
                              },
                              icon: Icon(
                                yesButtonClicked4 ? Icons.check : Icons.close,
                                color: yesButtonClicked4
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("assets/images/lighting_icon.png"),
                  //  color: Colors.red,
                  size: 24,
                  color: Colors.orange,
                ),
                Text(
                  "23,567 users has already participated",
                  style: TextStyle(color: Colors.orange),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    String newAmount = yesButtonClicked4
                        ? widget.om.payoutAmt!.toString()
                        : "0.00";

                    Provider.of<YourDataProvider>(context, listen: false)
                        .updateAmount(newAmount);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Get ₹${yesButtonClicked4 ? widget.om.payoutAmt!.toString() : "0.00"}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildRichText(String text, {required int maxWords}) {
  List<String> words = text.split(' ');
  List<String> lines = [];

  for (int i = 0; i < words.length; i += maxWords) {
    int end = (i + maxWords < words.length) ? i + maxWords : words.length;
    lines.add(words.sublist(i, end).join(' '));
  }

  return RichText(
    text: TextSpan(
      children: lines.map((line) {
        return TextSpan(
          text: '$line\n',
          style: TextStyle(
            fontSize: 13.2,
            color: Colors.white,
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildRichTextTitle(String text, {required int maxWords}) {
  List<String> words = text.split(' ');
  List<String> lines = [];

  for (int i = 0; i < words.length; i += maxWords) {
    int end = (i + maxWords < words.length) ? i + maxWords : words.length;
    lines.add(words.sublist(i, end).join(' '));
  }

  return RichText(
    text: TextSpan(
      children: lines.map((line) {
        return TextSpan(
          text: '$line\n',
          style: TextStyle(
            fontSize: 15.2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      }).toList(),
    ),
  );
}
