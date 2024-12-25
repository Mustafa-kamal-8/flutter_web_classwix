// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:core_dashboard/provider/workshop_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkshopScreenTeacher extends StatefulWidget {
  const WorkshopScreenTeacher({super.key});

  @override
  State<WorkshopScreenTeacher> createState() => _WorkshopScreenTeacherState();
}

class _WorkshopScreenTeacherState extends State<WorkshopScreenTeacher> {
  bool _isWorkShop = false;

  @override
  void initState() {
    Provider.of<WorkshopProvider>(context, listen: false).getWorkshop();
    getUserInfo();
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
    final provider = Provider.of<WorkshopProvider>(context);

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
                  "Workshop",
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
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: " / ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 14,
                                  color: AppColors.textGrey,
                                ),
                      ),
                      TextSpan(
                        text: "Workshop  ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
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
        gapH16,
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              gapH(18),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text(
                    "Show",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 80,
                    height: 50,
                    child: DropdownMenu(
                      hintText: "10",
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: "1",
                          label: "10",
                        ),
                        DropdownMenuEntry(
                          value: "2",
                          label: "15",
                        ),
                      ],
                      expandedInsets: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "Entries",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  CustomBtn(onPresses: () {}, title: 'Filter'),
                  const Spacer(),
                  CustomBtn(
                    title: "Workshop",
                    onPresses: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return const CreateWorkshop();
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              gapH20,
              const Divider(),
              gapH(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    gapW(20),
                    const Expanded(
                        child: Text("ID", textAlign: TextAlign.start)),
                    const Expanded(
                        child: Text("TITLE", textAlign: TextAlign.center)),
                    const Expanded(
                        child:
                            Text("DESCRIPTION", textAlign: TextAlign.center)),
                    const Expanded(
                        child: Text("LINK", textAlign: TextAlign.center)),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 100.0),
                        child: Text("CREATED AT", textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 30),
              Consumer<WorkshopProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading || provider.workshopResponse == null) {
                    return const CircularProgressIndicator();
                  }
                  if (provider.workshopResponse.isEmpty) {
                    return const NoDataWidget();
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 20),
                    itemCount: provider.workshopResponse.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          gapW(20),
                          Expanded(
                            child: Text(
                                provider.workshopResponse[index].id.toString(),
                                textAlign: TextAlign.start),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                  provider.workshopResponse[index].title,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                provider.workshopResponse[index].description,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    provider.workshopResponse[index].link));
                              },
                              child: Text(
                                provider.workshopResponse[index].link,
                                style: const TextStyle(color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                formatDate(provider
                                    .workshopResponse[index].createdAt
                                    .toString()),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              gapH(220),
            ],
          ),
        ),
        gapH20,
        BottomTextDesign(),
        gapH20,
      ],
    );
  }
}

class CreateWorkshop extends StatefulWidget {
  const CreateWorkshop({
    super.key,
  });

  @override
  State<CreateWorkshop> createState() => _CreateWorkshopState();
}

class _CreateWorkshopState extends State<CreateWorkshop> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.56,
        child: const Text("Create Workshop"),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                hintText: "Enter the title",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Enter the description",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _linkController,
              decoration: const InputDecoration(
                labelText: "Link",
                hintText: "Enter the link (URL)",
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _descriptionController.text.isNotEmpty &&
                _linkController.text.isNotEmpty) {
              Provider.of<WorkshopProvider>(context, listen: false)
                  .createWorkshop(
                _titleController.text,
                _descriptionController.text,
                _linkController.text,
                context,
              )
                  .then((val) {
                Navigator.of(context).pop();
                Provider.of<WorkshopProvider>(context, listen: false)
                    .getWorkshop();
              });
            }
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
