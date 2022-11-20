import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trainapp/screens/booking.dart';
import 'package:trainapp/utilities/apptheme.dart';
import 'package:trainapp/utilities/stationdata.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(context),
                const SizedBox(
                  height: 30,
                ),
                searchTrain(context),
                const SizedBox(
                  height: 20,
                ),
                progressWidget(),
                const SizedBox(
                  height: 25,
                ),
                bannerWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack bannerWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/corona.png"))),
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
        const Positioned(
            bottom: 15,
            child: Text(
              "Learn more",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ))
      ],
    );
  }

  Row progressWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: AppTheme.btnS, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Icon(
                Icons.calendar_today,
                size: 24,
                color: AppTheme.secondary,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Booking()));
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: AppTheme.btnP,
                        fontSize: 17,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row header(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: const Text(
            "Where do you want to go?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            maxLines: 2,
          ),
        ),
        const Spacer(),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            "images/avatar.jpg",
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
        )
      ],
    );
  }

  Stack searchTrain(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.secondary),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return Station.stationNames.where((String option) {
                        return option
                            .toLowerCase()
                            .trim()
                            .startsWith(textEditingValue.text.toLowerCase());
                      });
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextField(
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                        decoration: const InputDecoration(
                            hintText: "From Station",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18),
                            contentPadding: EdgeInsets.only(left: 0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      );
                    },
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<String> onSelected,
                        Iterable<String> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          children: [
                            Material(
                              elevation: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                color: AppTheme.bg,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final String option =
                                        options.elementAt(index);
                                    return ListTile(
                                      title: Text(option,
                                          style:
                                              TextStyle(color: AppTheme.btnP)),
                                      onTap: () => onSelected(option),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "-------------------------------------",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: AppTheme.btnS),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                Text(
                  "To",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.secondary),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Autocomplete(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return Station.stationNames.where((String option) {
                      return option
                          .toLowerCase()
                          .trim()
                          .startsWith(textEditingValue.text.toLowerCase());
                    });
                  }, fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                          hintText: "To Station",
                          contentPadding: EdgeInsets.only(left: 0),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    );
                  }, optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<String> onSelected,
                          Iterable<String> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        children: [
                          Material(
                            elevation: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              color: AppTheme.bg,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option =
                                      options.elementAt(index);
                                  return ListTile(
                                    title: Text(option,
                                        style: TextStyle(color: AppTheme.btnP)),
                                    onTap: () => onSelected(option),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.btnP,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.import_export_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
