import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trainapp/utilities/apptheme.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
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
          "ID 682482190",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: AppTheme.btnP,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.near_me,
                color: AppTheme.btnP,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ticketWidget(context),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Train Itenerary",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.btnP),
              ),
              const SizedBox(
                height: 20,
              ),
              trainInfoWidget(context),
              const SizedBox(
                height: 30,
              ),
              bottomWidget()
            ],
          ),
        ),
      ),
    );
  }

  Container bottomWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.warning,
                color: AppTheme.primary,
              ),
              title: Text(
                "Requirements to Board",
                style: TextStyle(
                    color: AppTheme.btnP,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.expand_more,
                    color: AppTheme.btnP,
                  ),
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }

  Container trainInfoWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Train Journey",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.btnP),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "20:20",
                            style: TextStyle(
                                color: AppTheme.btnP,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Thu, 1 Apr",
                            style: TextStyle(
                                color: AppTheme.secondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "kamalapur",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppTheme.btnP,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Arrival",
                          style: TextStyle(
                              color: AppTheme.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "5h 30m",
                  style: TextStyle(
                      color: AppTheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "20:20",
                            style: TextStyle(
                                color: AppTheme.btnP,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Thu, 1 Apr",
                            style: TextStyle(
                                color: AppTheme.secondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chittagong",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppTheme.btnP,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Destination",
                          style: TextStyle(
                              color: AppTheme.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Positioned.fill(
              right: 20,
              bottom: 20,
              top: 60,
              child: Column(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.primary),
                        color: Colors.white),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "----------",
                      style: TextStyle(color: AppTheme.btnS),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppTheme.primary),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container ticketWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.ancent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(
                              color: AppTheme.btnP,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Ajoy Debnath",
                          style: TextStyle(
                              color: AppTheme.btnP,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Seat Place",
                          style: TextStyle(
                              color: AppTheme.btnP,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Executive/7A",
                          style: TextStyle(
                              color: AppTheme.btnP,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Booking Code DH2719A8",
                      style: TextStyle(
                          color: AppTheme.btnP,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    Image.asset(
                      "images/barcode.jpg",
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 30,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppTheme.ancent),
                ),
                Expanded(
                  child: Text(
                    "------------------------------------------------",
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(color: AppTheme.secondary),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppTheme.ancent),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
