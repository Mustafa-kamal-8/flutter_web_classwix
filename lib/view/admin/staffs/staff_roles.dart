import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class StaffRolesScreen extends StatefulWidget {
  const StaffRolesScreen({super.key});

  @override
  State<StaffRolesScreen> createState() => _StaffRolesScreenState();
}

class _StaffRolesScreenState extends State<StaffRolesScreen> {
  bool isRead = false;
  bool isCreate = false;
  bool isUpdate = false;
  bool isDelete = false;

  bool _isCreateRole = false;

  @override
  Widget build(BuildContext context) {
    return _isCreateRole == false
        ? Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Roles",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                      ),
                      Text(
                        "",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Roles",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            child: Container(
                              // width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 46, 82, 244),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                  vertical: 8,
                                ),
                                child: TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      _isCreateRole = true;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Add Roles",
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
                      ],
                    ),
                    const Divider(),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ID"),
                          Text("NAME"),
                          Text("PERMISSIONS"),
                          Text("STATUS"),
                          Text("ACTION"),
                          SizedBox(),
                        ],
                      ),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: DottedLine(
                          dashColor: Color.fromARGB(255, 213, 213, 213),
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text((index + 1).toString()),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12),
                              const Text("Super admin "),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(25, 76, 175, 152),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  child: Text(
                                    "243",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                                255, 3, 237, 96)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.14),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(25, 76, 175, 152),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    "active",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 3, 237, 96),
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.more_horiz,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              gapH20,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                    child: Text(
                      bottomText,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                    ),
                  ),
                ),
              ),
              gapH20,
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create Roles",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                      ),
                      Text(
                        "",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Column(
                    children: [
                      Row(
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
                                            fontSize: 16, color: Colors.black),
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
                                width: MediaQuery.of(context).size.width * 0.35,
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
                                    "Status",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 16, color: Colors.black),
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
                                width: MediaQuery.of(context).size.width * 0.35,
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
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: 500,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: 1,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
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
                                                    fontWeight: FontWeight.w600,
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
                                                    fontWeight: FontWeight.w600,
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
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    value: isRead,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isRead = value ?? false;
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    value: isRead,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isRead = value ?? false;
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    value: isRead,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isRead = value ?? false;
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                      Row(
                                        children: [
                                          const SizedBox(width: 50),
                                          Text(
                                            "account",
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                    "Income List",
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                    "Expense List",
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                    "Transaction List",
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
                                            "featured course",
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                      const Divider(),
                                      Row(
                                        children: [
                                          const SizedBox(width: 50),
                                          const Text(""),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.143),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                                          BorderRadius.circular(
                                                              10),
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      gapH16,
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
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
                                    _isCreateRole = false;
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
                      gapH8,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BottomTextDesign(),
              gapH16,
            ],
          );
  }

  DottedLine _dottedLine() {
    return const DottedLine(
      dashColor: Color.fromARGB(255, 213, 213, 213),
    );
  }
}
