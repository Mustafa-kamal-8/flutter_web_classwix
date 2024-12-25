import 'dart:developer';

import 'package:core_dashboard/provider/users_provider.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserStaff extends StatefulWidget {
  const UserStaff({super.key});

  @override
  State<UserStaff> createState() => _UserStaffState();
}

class _UserStaffState extends State<UserStaff> {
  // ignore: prefer_final_fields
  TextEditingController _imageController = TextEditingController();

  bool _isCreateUSer = false;

  bool isRead = false;
  bool isCreate = false;
  bool isUpdate = false;
  bool isDelete = false;

  Uint8List? _webImage;

  // Method for picking an image from web
  Future<void> _pickImageWeb() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        // For web, use image as bytes
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes;
          _imageController.text =
              image.name; // Show the file name in the TextField
        });
      }
    }
  }

  @override
  void initState() {
    context.read<UserProvider>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH20,
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
                  _isCreateUSer == false ? "Users" : "Create User",
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
                      ),
                      TextSpan(
                        text: " / ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.textGrey,
                                ),
                      ),
                      TextSpan(
                        text: "Users   ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color:
                                      //  _isAddCertificateTemplate
                                      // ? AppColors.primary
                                      // :
                                      AppColors.textGrey,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        gapH16,
        _isCreateUSer == false
            ? Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 20.0, top: 20),
                      //       child: Text(
                      //         "Users",
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .headlineLarge!
                      //             .copyWith(
                      //               fontWeight: FontWeight.w600,
                      //               fontSize: 18,
                      //               color: Colors.black,
                      //             ),
                      //       ),
                      //     ),
                      //     // InkWell(
                      //     //   onTap: () {
                      //     //     setState(() {
                      //     //       _isCreateUSer = true;
                      //     //     });
                      //     //   },
                      //     //   child: Padding(
                      //     //     padding: const EdgeInsets.symmetric(
                      //     //         vertical: 10.0, horizontal: 20),
                      //     //     child: Container(
                      //     //       // width: 100,
                      //     //       decoration: BoxDecoration(
                      //     //         borderRadius: BorderRadius.circular(5),
                      //     //         color: const Color.fromARGB(255, 46, 82, 244),
                      //     //       ),
                      //     //       child: Padding(
                      //     //         padding: const EdgeInsets.symmetric(
                      //     //           horizontal: 0,
                      //     //           vertical: 8,
                      //     //         ),
                      //     //         child: TextButton.icon(
                      //     //           onPressed: () {
                      //     //             setState(() {
                      //     //               _isCreateUSer = true;
                      //     //             });
                      //     //           },
                      //     //           icon: const Icon(
                      //     //             Icons.add,
                      //     //             size: 20,
                      //     //             color: Colors.white,
                      //     //           ),
                      //     //           label: Text(
                      //     //             "Add Users",
                      //     //             style: Theme.of(context)
                      //     //                 .textTheme
                      //     //                 .headlineLarge!
                      //     //                 .copyWith(
                      //     //                   // fontWeight: FontWeight.w600,
                      //     //                   fontSize: 14,
                      //     //                   color: Colors.white,
                      //     //                 ),
                      //     //           ),
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      // const Divider(),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 0, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Text("ID")),
                            Expanded(
                                child:
                                    Text("NAME", textAlign: TextAlign.start)),
                            Expanded(
                                child:
                                    Text("EMAIL", textAlign: TextAlign.center)),
                            Expanded(
                                child:
                                    Text("PHONE", textAlign: TextAlign.center)),
                            Expanded(
                                child: Text("STATUS",
                                    textAlign: TextAlign.center)),
                            Expanded(
                                child: Text("ACTION",
                                    textAlign: TextAlign.center)),
                          ],
                        ),
                      ),
                      gapH16,
                      const Divider(),
                      SizedBox(
                        height: 400,
                        child: Consumer<UserProvider>(
                          builder: (context, userProvider, _) {
                            return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(height: 20),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 0, top: 16),
                              itemCount:
                                  userProvider.userModel?.users.length ?? 0,
                              itemBuilder: (context, index) {
                                final users =
                                    userProvider.userModel?.users[index];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        users?.id.toString() ?? "",
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        users?.name ?? '',
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        users?.email ?? "",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        users?.phone ?? "",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "active",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.green,
                                            ),
                                      ),
                                      //  Container(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 10, vertical: 3),
                                      //   decoration: BoxDecoration(
                                      //     color: Colors.green.withOpacity(0.4),
                                      //     borderRadius: const BorderRadius.all(
                                      //         Radius.circular(10)),
                                      //   ),
                                      //   child: Text(
                                      //     "active",
                                      //     textAlign: TextAlign.center,
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .bodyMedium!
                                      //         .copyWith(
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.w500,
                                      //           color: const Color.fromARGB(
                                      //               255, 2, 132, 6),
                                      //         ),
                                      //   ),
                                      // ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          final userId = users?.id;
                                          log(userId.toString(),
                                              name: "User id");
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text("Delete User"),
                                              content: Text(
                                                "Are you sure you want to delete this user: ${users?.name ?? ''}",
                                              ),
                                              actions: [
                                                IconButton(
                                                  onPressed: () {
                                                    if (userId != null) {
                                                      userProvider
                                                          .deleteUsers(
                                                              userId, context)
                                                          .then((val) {
                                                        userProvider.getUsers();
                                                      });
                                                    }

                                                    setState(() {});
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade500,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.more_horiz,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                // height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                gapH20,
                                Row(
                                  children: [
                                    Text(
                                      "Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(width: 3),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Enter Name",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                gapH8,
                                Row(
                                  children: [
                                    Text(
                                      "Email",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(width: 3),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Enter Your Email",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  "we'll never share your email with anyone else",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 13,
                                        color: Colors.black54,
                                      ),
                                ),
                                gapH16,
                                Row(
                                  children: [
                                    Text(
                                      "Password",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(width: 3),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Enter Your Password",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                gapH8,
                                Text(
                                  "Image",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                    _pickImageWeb();
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: TextField(
                                      controller:
                                          _imageController, // Use controller for the TextField
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hintText: _webImage != null
                                            ? _webImage.toString()
                                            : "No file chosen",
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: SizedBox(
                                            height: 40,
                                            width: 100,
                                            child: ElevatedButton(
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.grey),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _pickImageWeb();
                                                });
                                              },
                                              child: const Text("Browse"),
                                            ),
                                          ),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black26),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black26),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                gapH8,
                                Row(
                                  children: [
                                    Text(
                                      "Status",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(width: 3),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 50,
                                  child: const DropdownMenu(
                                    hintText: "Active",
                                    dropdownMenuEntries: [
                                      DropdownMenuEntry(
                                          value: "1", label: "Active"),
                                      DropdownMenuEntry(
                                          value: "2", label: "Inactive"),
                                    ],
                                    expandedInsets: EdgeInsets.zero,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: 500,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Roles",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                              ),
                                              const SizedBox(width: 3),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "Select Roles",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1", label: "ADMIN"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "MANAGER"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "ORGANIZATION"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "Module Module \nLinks",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                            Text(
                                              "Permissions",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        gapH8,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: DottedLine(
                                            dashColor:
                                                Colors.grey.withOpacity(0.3),
                                          ),
                                        ),
                                        gapH8,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "Users",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isRead,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isRead =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isCreate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isCreate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "roles",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.097),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isRead,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isRead =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isCreate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isCreate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "language",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.082),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 2),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isRead,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isRead =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 2),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 2),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isCreate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isCreate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 2),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Update Terms",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "ai support",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.082),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "Ai Support",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Ai Support Find",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course category",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.049),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Popular Course Category \nList",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Popular Course Category \nAdded",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Popular Course Category \nDeleted",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.093),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course assignment",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0361),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Assignment List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Assignment Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Assignment Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Assignment Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Assignment Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Assignment Submission List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Assignment Submission View",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course noticeboard",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.029),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Noticeboard List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Noticeboard Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Noticeboard Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Noticeboard Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Noticeboard Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course curriculum",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Course Curriculum",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Curriculum Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Curruculum Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Curruculum Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Curruculum Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course lession",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.054),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Course Lession",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Lession Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Lession Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Lession Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Lession Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course quiz",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.068),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Course Quiz",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Quiz Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Quiz Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Quiz Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Quiz Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Quiz Submission List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Quiz Submission View",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "course question",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.048),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Course Question",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Question Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Question Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Question Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Course Question Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "enroll",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Enroll Invoice",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "certificate",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.078),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "View",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Download",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "certificate template",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.034),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "instructor",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.083),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Request List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor View",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Approve",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Suspend",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Suspend List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Re Activate",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Login",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Add Instite",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Store Instite",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Update Instite",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Delete Instite",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Add Experience",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Store Experience",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Update Experience",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Delete Experience",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Add Skill",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Store Skill",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "student",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.095),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Suspend",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Re Activate",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Login",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Add Institute",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Store Institute",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Update Institute",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Delete Institute",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Add Experience",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Store Experience",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Update Experience",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Delete Experiwncw",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Add Skill",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Student Store Skill",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            const Text("review"),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.109),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Review View",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "payouts",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Instructor Payout List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Payout Request\n List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Unpaid Payout\n List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Rejected Payout\n List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Payout Details",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Payout Details",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor PAyout Request\n Approve",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Payout Requested\n Reject",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Instructor Make Payout",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        // Row(
                                        //   children: [
                                        //     const SizedBox(width: 50),
                                        //     Text(
                                        //       "account",
                                        //       style: Theme.of(context)
                                        //           .textTheme
                                        //           .headlineLarge!
                                        //           .copyWith(
                                        //               fontSize: 16,
                                        //               // fontWeight: FontWeight.w600,
                                        //               color: Colors.black),
                                        //     ),
                                        //     SizedBox(
                                        //         width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width *
                                        //             0.1),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.start,
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isUpdate,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isUpdate =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 0),
                                        //             Text(
                                        //               "Read",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Create",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Store",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Update",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Delete",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Income List",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Expense List",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Transaction List",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                        // const Divider(),
                                        // Row(
                                        //   children: [
                                        //     const SizedBox(width: 50),
                                        //     Text(
                                        //       "featured course",
                                        //       style: Theme.of(context)
                                        //           .textTheme
                                        //           .headlineLarge!
                                        //           .copyWith(
                                        //               fontSize: 16,
                                        //               // fontWeight: FontWeight.w600,
                                        //               color: Colors.black),
                                        //     ),
                                        //     SizedBox(
                                        //         width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width *
                                        //             0.065),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.start,
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isUpdate,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isUpdate =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 0),
                                        //             Text(
                                        //               "Read",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Create",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Store",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Update",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Delete",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                        // const Divider(),
                                        // Row(
                                        //   children: [
                                        //     const SizedBox(width: 50),
                                        //     Text(
                                        //       "discount course",
                                        //       style: Theme.of(context)
                                        //           .textTheme
                                        //           .headlineLarge!
                                        //           .copyWith(
                                        //               fontSize: 16,
                                        //               // fontWeight: FontWeight.w600,
                                        //               color: Colors.black),
                                        //     ),
                                        //     SizedBox(
                                        //         width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width *
                                        //             0.065),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.start,
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isUpdate,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isUpdate =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 0),
                                        //             Text(
                                        //               "Read",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Create",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Store",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Update",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Delete",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                        // const Divider(),
                                        // Row(
                                        //   children: [
                                        //     const SizedBox(width: 50),
                                        //     Text(
                                        //       "image gallery",
                                        //       style: Theme.of(context)
                                        //           .textTheme
                                        //           .headlineLarge!
                                        //           .copyWith(
                                        //               fontSize: 16,
                                        //               // fontWeight: FontWeight.w600,
                                        //               color: Colors.black),
                                        //     ),
                                        //     SizedBox(
                                        //         width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width *
                                        //             0.08),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.start,
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isUpdate,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isUpdate =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 0),
                                        //             Text(
                                        //               "Read",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const SizedBox(width: 5),
                                        //             Checkbox(
                                        //               side: const BorderSide(
                                        //                   color: Colors.grey),
                                        //               shape:
                                        //                   RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               value: isDelete,
                                        //               onChanged: (bool? value) {
                                        //                 setState(() {
                                        //                   isDelete =
                                        //                       value ?? false;
                                        //                 });
                                        //               },
                                        //             ),
                                        //             const SizedBox(width: 3),
                                        //             Text(
                                        //               "Create",
                                        //               style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .headlineLarge!
                                        //                   .copyWith(
                                        //                       fontSize: 16,
                                        //                       // fontWeight: FontWeight.w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                        // _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "reports",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.105),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Report Student \nEngagement",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Student \nEngagement Export",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Instructor \nEngagement",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Instructor \nEngagement Export",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Purchase \nHistory",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Purchase \nHistory Export",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Course \nCompletion",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Course \nCompletion Export",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Student \nPerformance",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Student \nPerformance Export",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Admin \nTransaction",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Admin \nTransaction Export",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "testimonial",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.09),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "home section settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "footer menu",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.085),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "home section settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "general settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.065),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "storage settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.065),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "email settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.077),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "seo settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.085),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "social login settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "blog category",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "blog",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.128),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "slider",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.125),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "page",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.128),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "brand",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.13),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "contact",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.122),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "addon",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.13),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "forum category",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.083),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "forum",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.13),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Forum Status Manage",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Forum Status Manage",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "two fa",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.129),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "event category",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.085),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "event",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.131),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Requested Event List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Approved Event List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Rejected Event List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Event Approve",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Event Reject",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Purchase Booking",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Event Booking",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Report Event Booking \nExport",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        _dottedLine(),
                                        Row(
                                          children: [
                                            const SizedBox(width: 50),
                                            Text(
                                              "organization",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isUpdate,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isUpdate =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 0),
                                                    Text(
                                                      "Read",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Create",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Store",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Suspend",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Re Activate",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Request List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Suspend List",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Approve",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Update",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Delete",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 5),
                                                    Checkbox(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      value: isDelete,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isDelete =
                                                              value ?? false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      "Organization Login",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              // fontWeight: FontWeight.w600,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          // width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 46, 82, 244),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  _isCreateUSer = false;
                                });
                              },
                              label: Text(
                                "Sumbit",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      // fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
        gapH16,
        BottomTextDesign()
      ],
    );
  }
}

List<Map<String, dynamic>> _users = [
  {
    "name": "admin",
    "email": "admin@onest.com",
    "phone": "01811000001",
    "status": "active",
  },
];
DottedLine _dottedLine() {
  return const DottedLine(
    dashColor: Color.fromARGB(255, 213, 213, 213),
  );
}
