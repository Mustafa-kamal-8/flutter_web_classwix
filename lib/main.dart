import 'package:core_dashboard/bloc/bloc/instructor_bloc.dart';
import 'package:core_dashboard/bloc/classes_bloc.dart';
import 'package:core_dashboard/bloc/studyMaterials/study_materials_bloc.dart';
import 'package:core_dashboard/provider/video_provider.dart';
import 'package:core_dashboard/view/admin/home/home_courses_provider.dart';
import 'package:core_dashboard/view/admin/studyMaterials/study_materials.dart';
import 'package:core_dashboard/view/admin/videos/videos.dart';
import 'package:core_dashboard/provider/certificate_provider.dart';
import 'package:core_dashboard/provider/course_provider.dart';
import 'package:core_dashboard/provider/create_categories_provider.dart';
import 'package:core_dashboard/provider/create_course_provider.dart';
import 'package:core_dashboard/provider/forgot_pass_provider.dart';
import 'package:core_dashboard/provider/groups_provider.dart';
import 'package:core_dashboard/provider/sign_in_provider.dart';
import 'package:core_dashboard/provider/trails_provider.dart';
import 'package:core_dashboard/provider/users_provider.dart';
import 'package:core_dashboard/provider/workshop_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'shared/navigation/routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => CreateCategoriesProvider()),
        ChangeNotifierProvider(create: (context) => CreateCourseProvider()),
        ChangeNotifierProvider(create: (context) => WorkshopProvider()),
        ChangeNotifierProvider(create: (context) => CertificateProvider()),
        ChangeNotifierProvider(create: (context) => HomeCoursesProvider()),
        ChangeNotifierProvider(create: (context) => UploadProvider()),
        ChangeNotifierProvider(create: (context) => VideosUploadProvider()),
        ChangeNotifierProvider(create: (context) => GroupsProvider()),
        ChangeNotifierProvider(create: (context) => TrailsProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPassProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ClassesBloc()),
          BlocProvider(create: (context) => InstructorBloc()),
          BlocProvider(create: (context) => StudyMaterialsBloc()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(context),
          routerConfig: routerConfig,
        ),
      ),
    );
  }
}
