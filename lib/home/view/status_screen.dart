// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:flutter/material.dart';

import 'package:daytrit/utils/constants.dart';

class StatusScreen extends StatefulWidget {
  final File image;
  const StatusScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Image.file(
                      widget.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 40,
                  child: Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColours.black9006c,
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColours.white,
                          )))),
              Positioned(
                bottom: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Add a caption...',
                              fillColor: AppColours.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(color: Colors.white)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(color: Colors.white)),
                              contentPadding: EdgeInsets.only(left: 70)),
                        ),
                      ),
                      addHorizontalSpace(8),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColours.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
