// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:developer';
import 'dart:typed_data';

import 'package:core_dashboard/provider/course_provider.dart';
import 'package:core_dashboard/provider/groups_provider.dart';
import 'package:core_dashboard/provider/video_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  String? selectedGroupsId;

  bool _isUploadVideo = false;

  @override
  void initState() {
    context.read<GroupsProvider>().getGroupsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isUploadVideo
        ? UploadVideo(
            isUploadVideo: _isUploadVideo,
          )
        : Column(
            children: [
              gapH(20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Videos",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Dashboard",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 16,
                                    color: AppColors.primary,
                                  ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: " / ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color: AppColors.textGrey,
                                  ),
                            ),
                            TextSpan(
                              text: "Videos ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 16,
                                    color: AppColors.textGrey,
                                  ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              gapH(20),
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      gapH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Videos",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                          ),
                          const Spacer(),
                          CustomBtn(
                            title: "Video",
                            onPresses: () {
                              setState(() {
                                _isUploadVideo = true;
                              });
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                            isIcon: true,
                          ),
                        ],
                      ),
                      const Divider(),
                      gapH4,
                      title(context, "Choose a group to view the videos."),
                      gapH8,
                      Consumer<GroupsProvider>(
                        builder: (context, provider, _) {
                          return DropdownButtonFormField<String>(
                            borderRadius: BorderRadius.circular(15),
                            padding: EdgeInsets.zero,
                            value: selectedGroupsId,
                            items: provider.groupsModel?.groups.map((groups) {
                              return DropdownMenuItem<String>(
                                value: groups.id.toString(),
                                child: Text(groups.name),
                              );
                            }).toList(),
                            onChanged: (val) {
                              selectedGroupsId = val;
                              context
                                  .read<VideosUploadProvider>()
                                  .getVideos(selectedGroupsId);
                              log(selectedGroupsId.toString());
                            },
                            hint: const Text("Select a group"),
                            decoration: const InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              // hintText: "Select a group id",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 16,
                              ),
                            ),
                          );
                        },
                      ),
                      gapH16,
                      if (selectedGroupsId.toString().isNotEmpty)
                        const Row(
                          children: [
                            Expanded(child: Text("ID")),
                            Expanded(child: Text("TITLE")),
                            Expanded(child: Text("VIDEO")),
                            Expanded(child: Text("COURSE ID")),
                            Expanded(child: Text("GROUP ID")),
                          ],
                        ),
                      const Divider(),
                      gapH8,
                      if (selectedGroupsId.toString().isNotEmpty)
                        Expanded(child: Consumer<VideosUploadProvider>(
                          builder: (context, value, _) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final video = value.videoModel?[index];
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Text(video?.id.toString() ?? ""),
                                    ),
                                    Expanded(child: Text(video?.title ?? "")),
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          launchUrl(
                                            Uri.parse(
                                                video?.videoPath.toString() ??
                                                    ""),
                                          );
                                        });
                                      },
                                      child: Text(
                                        video?.videoPath ?? "",
                                        style: const TextStyle(
                                            color: AppColors.primary),
                                      ),
                                    )),
                                    Expanded(
                                      child: Text(
                                        video?.courseId.toString() ?? "",
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                            video?.groupId.toString() ?? "")),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: value.videoModel?.length ?? 0,
                            );
                          },
                        ))
                    ],
                  ),
                ),
              ),
              gapH8,
              BottomTextDesign(),
              gapH20,
            ],
          );
  }
}

class UploadVideo extends StatefulWidget {
  bool isUploadVideo;
  UploadVideo({super.key, required this.isUploadVideo});

  @override
  // ignore: library_private_types_in_public_api
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _playlimitController = TextEditingController();
  TextEditingController _videoLinkController = TextEditingController();
  String? selectedGroupsId;
  String? selectedCourseId;

  // Pick PDF
  // html.File? selectedVideoFile; // To hold the selected video file
  // Uint8List? _videoBytes; // To hold the byte data of the video
  // String? videoUrl; // URL to preview the selected video

  // Function to pick a video file
  // Function to pick a video file and validate format
  // Future<void> _pickVideo() async {
  //   try {
  //     // Open the file picker to select video files
  //     final result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['mp4', 'mov', 'avi'], // Only accept video files
  //     );

  //     if (result != null && result.files.isNotEmpty) {
  //       final file = result.files.single;
  //       final fileName = file.name;
  //       final fileExtension = file.extension ?? "";

  //       // Validate file format
  //       if (!['mp4', 'mov', 'avi'].contains(fileExtension.toLowerCase())) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text(
  //                 "Invalid file type. Please select a video file (mp4, mov, avi)."),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //         return;
  //       }

  //       // Convert to html.File for Flutter web compatibility
  //       selectedVideoFile = html.File([file.bytes!], fileName);
  //       _videoBytes = file.bytes;

  //       // Create video preview URL
  //       final blob = html.Blob([_videoBytes!]);
  //       videoUrl = html.Url.createObjectUrlFromBlob(blob);

  //       log("Picked video file: ${selectedVideoFile?.name}");
  //       setState(() {}); // Refresh the UI
  //     } else {
  //       log('No file selected');
  //     }
  //   } catch (e) {
  //     log('Error picking video: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Error picking video: $e"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

  @override
  void initState() {
    // context.read<ClassesBloc>().add(FetchClassesEvent());
    context.read<GroupsProvider>().getGroupsData();
    context.read<CourseProvider>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upload Videos",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Dashboard",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 16,
                                color: AppColors.primary,
                              ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: " / ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                        ),
                        TextSpan(
                          text: "Videos ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 16,
                                color: AppColors.primary,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                widget.isUploadVideo = false;
                              });
                            },
                        ),
                        TextSpan(
                          text: " / ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 14,
                                color: AppColors.textGrey,
                              ),
                        ),
                        TextSpan(
                          text: "Upload Videos ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 16,
                                color: AppColors.textGrey,
                              ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            // height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  title(context, "Title"),
                  gapH(5),
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      return value == null || value.isEmpty
                          ? "Title is required"
                          : null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Enter video title",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    maxLines: 1,
                  ),
                  gapH(20),
                  title(context, "Groups"),
                  gapH(5),
                  Consumer<GroupsProvider>(
                    builder: (context, provider, _) {
                      return DropdownButtonFormField<String>(
                        borderRadius: BorderRadius.circular(15),
                        padding: EdgeInsets.zero,
                        value: selectedGroupsId,
                        items: provider.groupsModel?.groups.map((groups) {
                          return DropdownMenuItem<String>(
                            value: groups.id.toString(),
                            child: Text("${groups.name}- ${groups.id}"),
                          );
                        }).toList(),
                        onChanged: (val) {
                          selectedGroupsId = val;
                          log(selectedGroupsId.toString());
                        },
                        hint: const Text("Select a group"),
                        decoration: const InputDecoration(
                          disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),

                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          // hintText: "Select a group id",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 16,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  title(context, "Course"),
                  gapH(5),
                  Consumer<CourseProvider>(
                    builder: (context, provider, _) {
                      return DropdownButtonFormField<String>(
                        borderRadius: BorderRadius.circular(15),
                        padding: EdgeInsets.zero,
                        value: selectedCourseId,
                        items: provider.courseResponse?.courses.map((courses) {
                          return DropdownMenuItem<String>(
                            value: courses.id.toString(),
                            child: Text("${courses.title}"),
                          );
                        }).toList(),
                        onChanged: (val) {
                          selectedCourseId = val;
                          log(selectedCourseId.toString());
                        },
                        hint: const Text("Select a course"),
                        decoration: const InputDecoration(
                          disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),

                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          // hintText: "Select a group id",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 16,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // title(context, "Video"),
                  // gapH(5),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: DottedBorder(
                  //     dashPattern: const [4],
                  //     color: Colors.grey,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(2),
                  //           child: ElevatedButton(
                  //             style: const ButtonStyle(
                  //               backgroundColor:
                  //                   WidgetStatePropertyAll(Colors.grey),
                  //             ),
                  //             onPressed: () => _pickVideo(),
                  //             child: const Text('Pick video'),
                  //           ),
                  //         ),
                  //         Text(
                  //           selectedVideoFile?.name == null
                  //               ? ""
                  //               : "Selected video: ${selectedVideoFile?.name}       ",
                  //           style: const TextStyle(color: AppColors.primary),
                  //         ),
                  //       ],
                  //     ),
                  //   ),

                  //   // if (videoUrl != null)
                  //   //   Column(
                  //   //     children: [
                  //   //       const Text('Video Preview:'),
                  //   //       const SizedBox(height: 10),
                  //   //       // SizedBox(
                  //   //       //   height: 300,
                  //   //       //   child: HtmlElementView(
                  //   //       //     viewType: videoUrl!,
                  //   //       //     onPlatformViewCreated: (_) {
                  //   //       //       final videoElement = html.VideoElement()
                  //   //       //         ..src = videoUrl ?? ""
                  //   //       //         ..controls = true
                  //   //       //         ..autoplay = false;
                  //   //       //       html.document.getElementById(videoUrl!)?.replaceWith(
                  //   //       //             videoElement,
                  //   //       //           );
                  //   //       //     },
                  //   //       //   ),
                  //   //       // ),
                  //   //     ],
                  // ),
                  // const SizedBox(height: 20),
                  title(context, "Video Link"),
                  gapH(5),
                  TextFormField(
                    controller: _videoLinkController,
                    validator: (value) {
                      return value == null || value.isEmpty
                          ? "video link id is required"
                          : null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Video Link",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  title(context, "Play limits"),
                  gapH(5),
                  TextFormField(
                    controller: _playlimitController,
                    validator: (value) {
                      return value == null || value.isEmpty
                          ? "Play limits id is required"
                          : null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Play limits",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomBtn(
                      title: context.read<VideosUploadProvider>().isLoading
                          ? "Uploading...."
                          : "Upload",
                      onPresses: () {
                        setState(() {
                          // Validate the group ID
                          if (selectedGroupsId == null ||
                              selectedGroupsId!.isEmpty) {
                            log("Group ID is not selected",
                                name: "Upload Error");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please select a group ID")),
                            );
                            return;
                          }

                          // Validate the title
                          if (_titleController.text.isEmpty) {
                            log("Title is empty", name: "Upload Error");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please enter a title")),
                            );
                            return;
                          }

                          // Validate the play limit
                          int? playLimit;
                          try {
                            if (_playlimitController.text.isNotEmpty) {
                              playLimit = int.parse(_playlimitController.text);
                            }
                          } catch (e) {
                            log("Play Limit is invalid", name: "Upload Error");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Play limit must be a valid number")),
                            );
                            return;
                          }

                          // Validate the video file
                          // if (selectedVideoFile == null) {
                          //   log("Video file is not selected",
                          //       name: "Upload Error");
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text("Please select a video file")),
                          //   );
                          //   return;
                          // }

                          // If all validations pass, proceed to upload
                          context
                              .read<VideosUploadProvider>()
                              .uploadVideo(
                                context,
                                groupId: selectedGroupsId!,
                                title: _titleController.text,
                                // videoFile: selectedVideoFile,
                                playLimit:
                                    int.tryParse(_playlimitController.text),
                                courseId: int.tryParse(selectedCourseId ?? "")!,
                                videoLink: _videoLinkController.text,
                              )
                              .then(
                            (value) {
                              setState(() {
                                widget.isUploadVideo = false;
                              });
                            },
                          );

                          log("Button Pressed");
                          log(_titleController.text, name: "Title");
                          log(selectedGroupsId.toString(),
                              name: "Selected Group ID");
                          // log(selectedVideoFile!.name.toString(),
                          //     name: "Video File");
                          log(_playlimitController.text.toString(),
                              name: "Play Limit");
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          gapH16,
          BottomTextDesign(),
          gapH16,
        ],
      ),
    );
  }
}

Row title(BuildContext context, String title) {
  return Row(
    children: [
      Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontSize: 16, color: Colors.black),
      ),
      const SizedBox(width: 3),
      Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Text(
          "*",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.red,
              ),
        ),
      ),
    ],
  );
}
