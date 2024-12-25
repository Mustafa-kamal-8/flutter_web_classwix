import 'package:core_dashboard/view/admin/authentication/forgot_password_screen.dart';
import 'package:core_dashboard/view/admin/authentication/sign_up.dart';
import 'package:core_dashboard/view/admin/authentication/verify_forgot_pass_phone_otp.dart';
import 'package:core_dashboard/view/admin/course_webview.dart';
import 'package:core_dashboard/view/admin/home/become_instructor.dart';
import 'package:core_dashboard/view/admin/home/blogs.dart';
import 'package:core_dashboard/view/admin/home/home.dart';
import 'package:core_dashboard/view/admin/home/home_courses.dart';
import 'package:core_dashboard/view/admin/staffs/staff_roles.dart';
import 'package:core_dashboard/view/teacher/auth/sign_in.dart';
import 'package:core_dashboard/view/teacher/pages/entrypoint.dart';
import 'package:go_router/go_router.dart';

import '../../view/admin/authentication/register_page.dart';
import '../../view/admin/authentication/sign_in_page.dart';
import '../../view/admin/entry_point.dart';

final routerConfig = GoRouter(
  initialLocation: '/home',
  redirect: (context, state) {
    return '/home';
  },
  routes: [
    GoRoute(
      path: '/teacherDashboard',
      builder: (context, state) => const TeacherEntryPoint(),
    ),
    GoRoute(
      path: '/instructor',
      builder: (context, state) => const BecomeInstructorScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/signin_teacher',
      builder: (context, state) => const SignInPageTeacher(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/forgot_password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/forgot_password_otp_verify',
      builder: (context, state) => const VerifyForgotPassPhoneOtp(
        numbar: '',
      ),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/entrypoint',
      builder: (context, state) => const EntryPoint(),
    ),
    GoRoute(
      path: '/staffroles',
      builder: (context, state) => const StaffRolesScreen(),
    ),
    GoRoute(
      path: '/courses',
      builder: (context, state) => const CourseWebviewScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      // path: '/',
      path: '/coursesPage',
      builder: (context, state) => const HomeCoursesPage(),
    ),
    GoRoute(
      // path: '/',
      path: '/blogs',
      builder: (context, state) => const BlogsScreen(),
    ),
  ],
  // Optional: Redirect if needed based on conditions (e.g., user authentication)
);
