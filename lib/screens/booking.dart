import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trainapp/screens/ticket.dart';
import 'package:trainapp/utilities/apptheme.dart';
import 'package:trainapp/widgets/seatWidget.dart';
import 'package:trainapp/widgets/statusWidget.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<String> status = [
    "Available",
    "Available",
    "Unavailable",
    "Available",
    "Available",
    "Available",
    "Available",
    "Available",
    "Available",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Available",
    "Available",
    "Available",
    "Available",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Unavailable",
    "Available"
  ];
  late int seatRow;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seatRow = status.length ~/ 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.bg,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppTheme.btnP,
            )),
        title: Text(
          "Select Seat",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: AppTheme.btnP,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  StatusWidget(type: "Available"),
                  StatusWidget(type: "Selected"),
                  StatusWidget(type: "Unavailable")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "A",
                                style: TextStyle(
                                    fontSize: 20, color: AppTheme.secondary),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                "B",
                                style: TextStyle(
                                    fontSize: 20, color: AppTheme.secondary),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              Text(
                                "C",
                                style: TextStyle(
                                    fontSize: 20, color: AppTheme.secondary),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                "D",
                                style: TextStyle(
                                    fontSize: 20, color: AppTheme.secondary),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: seatRow,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SeatWidget(type: status[index + 0]),
                                      SeatWidget(type: status[index + 1]),
                                      Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            color: AppTheme.secondary),
                                      ),
                                      SeatWidget(type: status[index + 2]),
                                      SeatWidget(type: status[index + 3]),
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.expand_less,
                              color: AppTheme.secondary,
                            )),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.ancent,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 15),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Executive",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.expand_more,
                              color: AppTheme.secondary,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Seat",
                        style:
                            TextStyle(color: AppTheme.secondary, fontSize: 16),
                      ),
                      Text(
                        "Executive / 7A",
                        style: TextStyle(
                            color: AppTheme.btnP,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Fare",
                        style:
                            TextStyle(color: AppTheme.secondary, fontSize: 16),
                      ),
                      Text(
                        "42\$",
                        style: TextStyle(
                            color: AppTheme.btnP,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Ticket();
                      }));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text(
                        "Continue",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
