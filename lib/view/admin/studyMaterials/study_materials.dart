// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:core_dashboard/bloc/bloc/instructor_bloc.dart';
import 'package:core_dashboard/bloc/classes_bloc.dart';
import 'package:core_dashboard/bloc/studyMaterials/study_materials_bloc.dart';
import 'package:core_dashboard/main.dart';
import 'package:core_dashboard/provider/course_provider.dart';
import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class StudyMaterialsScreen extends StatefulWidget {
  const StudyMaterialsScreen({super.key});

  @override
  State<StudyMaterialsScreen> createState() => _StudyMaterialsScreenState();
}

class _StudyMaterialsScreenState extends State<StudyMaterialsScreen> {
  bool isCreateStudyMaterial = false;

  // Pick a file from the browser
  // Future<void> pickFile({
  //   required List<String> allowedExtensions,
  //   required Function(Uint8List bytes, String fileName) onFilePicked,
  // }) async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: allowedExtensions,
  //   );

  //   if (result != null && result.files.single.bytes != null) {
  //     onFilePicked(result.files.single.bytes!, result.files.single.name);
  //   }
  // }

  @override
  void initState() {
    getUserInfo();
    context.read<StudyMaterialsBloc>().add(FetchStudyMaterialsEvent());
    super.initState();
  }

  getUserInfo() async {
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    log(userData['token'], name: "Token");
    log(userData['id'], name: "UserId");
    log(userData['name'], name: "name");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH16,
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
                  "Study Materials",
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
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: " / ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: isCreateStudyMaterial
                                      ? AppColors.primary
                                      : AppColors.textGrey,
                                ),
                      ),
                      TextSpan(
                        text: "Study Materials",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: isCreateStudyMaterial
                                      ? AppColors.primary
                                      : AppColors.textGrey,
                                ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isCreateStudyMaterial = false;
                              log(isCreateStudyMaterial.toString());
                            });
                          },
                      ),
                      if (isCreateStudyMaterial)
                        TextSpan(
                          text: " / ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.textGrey,
                              ),
                        ),
                      if (isCreateStudyMaterial)
                        TextSpan(
                          text: "Create Study Materials ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.textGrey,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                // isCreateStudyMaterial = true;
                                // log(isCreateStudyMaterial.toString());
                              });
                            },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        gapH16,
        isCreateStudyMaterial == true
            ? const UploadScreen()
            : Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      gapH(AppDefaults.padding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Study Materials",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                          ),
                          CustomBtn(
                            title: "Study Materials",
                            onPresses: () {
                              setState(() {
                                isCreateStudyMaterial = true;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            isIcon: true,
                          ),
                        ],
                      ),
                      gapH(20),
                      const Divider(),
                      gapH(AppDefaults.padding),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text("ID", textAlign: TextAlign.start)),
                          Expanded(
                              child: Text("COURSE ID",
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child:
                                  Text("PHOTO", textAlign: TextAlign.center)),
                          Expanded(
                              child: Text("PDF", textAlign: TextAlign.center)),
                          Expanded(
                              child:
                                  Text("AUDIO", textAlign: TextAlign.center)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 8),
                      BlocConsumer<StudyMaterialsBloc, StudyMaterialsState>(
                        listener: (context, state) {
                          if (state is StudyMaterialsLoadingState) {
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(const SnackBar(content: Text('Loading...')));
                          }
                          if (state is StudyMaterialsFetchFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Something went wrong: ${state.error}')));
                          }
                        },
                        builder: (context, state) {
                          if (state is StudyMaterialsLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (state is StudyMaterialsFetchSucess) {
                            return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(height: 30),
                              shrinkWrap: true,
                              itemCount: state.studyMaterialsModel.length,
                              itemBuilder: (context, index) {
                                final material =
                                    state.studyMaterialsModel[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Text(material.id.toString(),
                                            textAlign: TextAlign.start)),
                                    Expanded(
                                        child: Text(
                                            material.courseId.toString(),
                                            textAlign: TextAlign.center)),
                                    Expanded(
                                      child: Image.network(
                                        material.photo,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return InkWell(
                                            onTap: () {
                                              launchPdf(material.photo);
                                            },
                                            child: Text(
                                              material.photo,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.primary),
                                            ),
                                          );
                                        },
                                      ),
                                      // Text(material.photo.toString(),
                                      //     textAlign: TextAlign.center)
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          launchPdf(material.pdf.toString());
                                        },
                                        child: material.pdf != null
                                            ? const Icon(
                                                Icons.picture_as_pdf,
                                                color: Colors.blue,
                                              )
                                            : const Text("--",
                                                textAlign: TextAlign.center),
                                      ),
                                    ),
                                    Expanded(
                                      child: material.audio != null
                                          ? Text(
                                              material.audio.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: AppColors.primary,
                                              ),
                                            )
                                          : const Text("--"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          return const Center(child: Text("No data available"));
                        },
                      ),
                      gapH(150),
                    ],
                  ),
                ),
              ),
        gapH20,
        BottomTextDesign(),
        gapH20,
      ],
    );
  }

  void launchPdf(String pdfUrl) async {
    final Uri url = Uri.parse(pdfUrl);
    await launchUrl(url);
    log(url.toString());
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

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // final _courseIdController = TextEditingController();
  String? selectedCourseId;

  final _formKey = GlobalKey<FormState>();

  Uint8List? _webImage;
  String? _imageUrl;
  html.File? webImageFile;
  File? mobileImageFile;

  // Function to pick an image for web
  Future<void> _pickImageWeb() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        // Read image as bytes for web
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes; // Set bytes
          _imageUrl = image.path; // Set image URL (path)
          webImageFile = html.File([bytes], image.name); // Create html.File
        });
        log("Web Image URL: $_imageUrl");
        log("Web Image File: ${webImageFile!.name}");
      } else {
        // For mobile, create a File instance
        mobileImageFile = File(image.path);
        setState(() {
          _imageUrl = image.path; // Set image URL
        });
        log("Mobile Image URL: $_imageUrl");
        log("Mobile Image File: $mobileImageFile");
      }
    }
  }

  // Pick PDF
  html.File? selectedPdfFile;
  Uint8List? _pdfBytes; // To hold the byte data of the PDF

  // Function to pick a PDF file
  Future<void> _pickPdf() async {
    try {
      // Open the file picker
      final result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.single;

        // In Flutter Web, we need to use html.File instead of dart:io File
        selectedPdfFile =
            html.File([file.bytes!], file.name); // Create an html.File object
        _pdfBytes = file.bytes; // Storing file's byte data

        log("Picked PDF file: ${selectedPdfFile?.name}");
        setState(() {});
      } else {
        log('No file selected');
      }
    } catch (e) {
      log('Error picking PDF: $e');
    }
  }

  // Pick Audio (Mobile/Web)
  html.File? _audioFile;
  Uint8List? _audioBytes;
  String? _audioName;

  // Function to pick an audio file
  Future<void> _pickAudio() async {
    try {
      final input = html.FileUploadInputElement()
        ..accept = '.mp3'
        ..multiple = false;
      input.click();

      input.onChange.listen((e) {
        final files = input.files;
        if (files!.isEmpty) {
          log("No file selected.");
          return;
        }

        final file = files[0];

        _audioFile = file;
        _audioName = file.name;

        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((e) {
          _audioBytes = reader.result as Uint8List;

          log('Picked audio (Web): $_audioName');
        });
        setState(() {});
      });
    } catch (e) {
      log("Error picking audio: $e");
    }
  }

  @override
  void initState() {
    context.read<ClassesBloc>().add(FetchClassesEvent());
    context.read<CourseProvider>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              title(context, "Course Id"),
              gapH(5),
              Consumer<CourseProvider>(
                builder: (context, provider, _) {
                  // if (provider.isLoading) {
                  //   return const Text("Loading..");
                  // }

                  // if (provider.courseResponse?.courses.isEmpty ?? true) {
                  //   return const Text("No classes available");
                  // }

                  // Define a variable to hold the selected value

                  return DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(15),
                    padding: EdgeInsets.zero,
                    value: selectedCourseId,
                    items: provider.courseResponse?.courses.map((course) {
                      return DropdownMenuItem<String>(
                        value: course.id.toString(),
                        child: Text("${course.title}-${course.id}"),
                      );
                    }).toList(),
                    onChanged: (val) {
                      selectedCourseId = val;
                      log(selectedCourseId.toString());
                    },
                    hint: const Text("Select a course"),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      // hintText: "Select a course id",
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
              title(context, "Image"),
              gapH(5),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: InkWell(
                  onTap: () {
                    _pickImageWeb();
                  },
                  child: DottedBorder(
                    dashPattern: const [4],
                    color: Colors.grey,
                    child: Center(
                      child: _webImage != null
                          ? Image.memory(
                              _webImage!,
                              fit: BoxFit.fill,
                            )
                          : Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.grey[400],
                              size: 50,
                            ),
                    ),
                  ),
                ),
              ),
              gapH(20),
              title(context, "PDF"),
              gapH(5),
              SizedBox(
                width: double.infinity,
                child: DottedBorder(
                  dashPattern: const [4],
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.grey),
                          ),
                          onPressed: () => _pickPdf(),
                          child: const Text('Pick PDF'),
                        ),
                      ),
                      Text(
                        selectedPdfFile?.name == null
                            ? ""
                            : "Selected PDF: ${selectedPdfFile?.name}       ",
                        style: const TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              title(context, "Audio"),
              gapH(5),
              SizedBox(
                width: double.infinity,
                child: DottedBorder(
                  dashPattern: const [4],
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.grey),
                          ),
                          onPressed: () => _pickAudio(),
                          child: const Text('Pick Audio'),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          _audioName == null
                              ? ""
                              : "Selected Audio: $_audioName       ",
                          style: const TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedCourseId!.isNotEmpty &&
                              webImageFile != null &&
                              selectedPdfFile != null &&
                              _audioFile != null ||
                          _formKey.currentState!.validate()) {
                        Provider.of<UploadProvider>(context, listen: false)
                            .uploadData(
                          context,
                          courseId: selectedCourseId ?? "",
                          photo: webImageFile,
                          pdf: selectedPdfFile,
                          audio: _audioFile,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("All fields are required"),
                          ),
                        );
                      }
                    });
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<http.MultipartFile> getFileFromHtml(
      html.File file, String fieldName) async {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file);

    await reader.onLoad.first;

    final bytes = reader.result as Uint8List;
    return http.MultipartFile.fromBytes(
      fieldName,
      bytes,
      filename: file.name,
      contentType: MediaType('application', 'octet-stream'),
    );
  }

  Future<void> uploadData(
    BuildContext context, {
    required String courseId,
    required html.File? photo,
    required html.File? pdf,
    required html.File? audio,
  }) async {
    _isLoading = true; // Set loading to true before upload
    notifyListeners(); // final uri = Uri.parse("${BASE_URL}materials");
    final uri = Uri.parse("https://api.classwix.com/api/materials");
    final request = http.MultipartRequest('POST', uri);

    try {
      request.fields['course_id'] = courseId;

      if (photo != null) {
        final photoFile = await getFileFromHtml(photo, 'photo');
        request.files.add(photoFile);
      }

      if (pdf != null) {
        final pdfFile = await getFileFromHtml(pdf, 'pdf');
        request.files.add(pdfFile);
      }

      if (audio != null) {
        final audioFile = await getFileFromHtml(audio, 'audio');
        request.files.add(audioFile);
      }

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      log('Raw Response: ${responseData.body}');

      // Check if response contains JSON
      if (response.headers['content-type']?.contains('application/json') ??
          false) {
        try {
          final decodedData = json.decode(responseData.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            log('Uploaded successfully! ${response.reasonPhrase}');
            log('Response: $decodedData');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Uploaded successfully!"),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            log('Failed to upload: ${response.statusCode}');
            log('Error: $decodedData');
            _isLoading = false;
            notifyListeners();
          }
        } catch (e) {
          log('Error parsing JSON: $e');
          log('Response: ${responseData.body}');
          _isLoading = false;
          notifyListeners();
        }
      }
    } catch (e) {
      log('Error during upload: $e');
      if (e is ClientException) {
        log('ClientException details: ${e.message}');
      } else if (e is SocketException) {
        log('SocketException: Check network connectivity.');
      }
      _isLoading = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
