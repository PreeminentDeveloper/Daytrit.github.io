// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/validation_view_model.dart';
import 'package:daytrit/home/view/status/video_status_upload.dart';
import 'package:daytrit/home/view_models/status_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/vendor/widgets/extensions.dart';
import 'package:flutter/material.dart';

import 'package:daytrit/utils/constants.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatefulWidget {
  final File file;
  const StatusScreen({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final TextEditingController captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final statusModel = Provider.of<StatusViewModel>(context);
    final validationViewModel = Provider.of<ValidationViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(children: [
            Stack(
              children: [
                Column(
                  children: [
                    getFileExtension(widget.file.path) == '.mp4'
                        ? VideoStatusUpload(video: widget.file)
                        : SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Image.file(
                              widget.file,
                              fit: BoxFit.contain,
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
                            controller: captionController,
                            decoration: InputDecoration(
                                hintText: 'Add a caption...',
                                fillColor: AppColours.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                contentPadding: EdgeInsets.only(left: 70)),

                            // onChanged: (dynamic value) =>
                            //  validationViewModel.setCaption(value),
                          ),
                        ),
                        addHorizontalSpace(8),
                        InkWell(
                          onTap: () {
                            print('showvideo ${widget.file}');
                            getFileExtension(widget.file.path) == '.mp4'
                                ? validationViewModel.submitPostVideo(context,
                                    widget.file, captionController.text)
                                : validationViewModel.submitPostImage(context,
                                    widget.file, captionController.text);

                            openBottomNavBar(context);
                          },
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
      ),
    );
  }
}
