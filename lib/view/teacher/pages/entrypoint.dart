import 'package:core_dashboard/view/admin/OfflinePayment/course.dart';
import 'package:core_dashboard/view/admin/OfflinePayment/event.dart';
import 'package:core_dashboard/view/admin/OfflinePayment/package.dart';
import 'package:core_dashboard/view/admin/OfflinePayment/settings.dart';
import 'package:core_dashboard/view/admin/accounts/account_list.dart';
import 'package:core_dashboard/view/admin/accounts/expense_list.dart';
import 'package:core_dashboard/view/admin/accounts/income_list.dart';
import 'package:core_dashboard/view/admin/accounts/transaction_list.dart';
import 'package:core_dashboard/view/admin/addons.dart';
import 'package:core_dashboard/view/admin/assignment/assignment.dart';
import 'package:core_dashboard/view/admin/blogs/blog.dart';
import 'package:core_dashboard/view/admin/blogs/blog_category.dart';
import 'package:core_dashboard/view/admin/certificate_template_list.dart';
import 'package:core_dashboard/view/admin/certificates_list_screen.dart';
import 'package:core_dashboard/view/admin/classes/class.dart';
import 'package:core_dashboard/view/admin/contacts/contacts.dart';
import 'package:core_dashboard/view/admin/customers/course_categories.dart';
import 'package:core_dashboard/view/admin/customers/course_list.dart';
import 'package:core_dashboard/view/admin/dashboard/dashboard_page.dart';
import 'package:core_dashboard/view/admin/enrollment.dart';
import 'package:core_dashboard/view/admin/event/approved_event.dart';
import 'package:core_dashboard/view/admin/event/event_category.dart';
import 'package:core_dashboard/view/admin/event/rejected_events.dart';
import 'package:core_dashboard/view/admin/event/requested_events.dart';
import 'package:core_dashboard/view/admin/event/sale_event.dart';
import 'package:core_dashboard/view/admin/instructors/assign_instructor.dart';
import 'package:core_dashboard/view/admin/instructors/create_instructor.dart';
import 'package:core_dashboard/view/admin/instructors/instructor_list.dart';
import 'package:core_dashboard/view/admin/instructors/requested_instructor.dart';
import 'package:core_dashboard/view/admin/language.dart';
import 'package:core_dashboard/view/admin/marketing/discount_course_list.dart';
import 'package:core_dashboard/view/admin/marketing/featured_course_list.dart';
import 'package:core_dashboard/view/admin/organization/organization_list.dart';
import 'package:core_dashboard/view/admin/organization/requested_organization.dart';
import 'package:core_dashboard/view/admin/organization/suspended_organization_list.dart';
import 'package:core_dashboard/view/admin/payouts/payouts_list.dart';
import 'package:core_dashboard/view/admin/payouts/rejected_payouts_list.dart';
import 'package:core_dashboard/view/admin/payouts/requested_payouts_list.dart';
import 'package:core_dashboard/view/admin/payouts/unpaid_payouts_list.dart';
import 'package:core_dashboard/view/admin/profile/my_profile.dart';
import 'package:core_dashboard/view/admin/quizees/quizzes.dart';
import 'package:core_dashboard/view/admin/reports/course_completion.dart';
import 'package:core_dashboard/view/admin/reports/event_booking.dart';
import 'package:core_dashboard/view/admin/reports/instructor_engagement.dart';
import 'package:core_dashboard/view/admin/reports/purchase_history.dart';
import 'package:core_dashboard/view/admin/reports/student_engagement.dart';
import 'package:core_dashboard/view/admin/reports/student_performance.dart';
import 'package:core_dashboard/view/admin/reviews/review_list.dart';
import 'package:core_dashboard/view/admin/staffs/staff_roles.dart';
import 'package:core_dashboard/view/admin/staffs/userStaff.dart';
import 'package:core_dashboard/view/admin/students/student_list.dart';
import 'package:core_dashboard/view/admin/studyMaterials/study_materials.dart';
import 'package:core_dashboard/view/admin/subscription/approved_course.dart';
import 'package:core_dashboard/view/admin/subscription/package_duration_tyoe.dart';
import 'package:core_dashboard/view/admin/subscription/package_list.dart';
import 'package:core_dashboard/view/admin/subscription/package_purchase_list.dart';
import 'package:core_dashboard/view/admin/subscription/rejected_course.dart';
import 'package:core_dashboard/view/admin/subscription/requested_course.dart';
import 'package:core_dashboard/view/admin/testimonials/create_testimonial.dart';
import 'package:core_dashboard/view/admin/testimonials/testimonial_list.dart';
import 'package:core_dashboard/view/admin/trails/trails.dart';
import 'package:core_dashboard/view/admin/videos/videos.dart';
import 'package:core_dashboard/view/admin/websiteSetup/brand.dart';
import 'package:core_dashboard/view/admin/websiteSetup/footer_menu.dart';
import 'package:core_dashboard/view/admin/websiteSetup/image_gallery.dart';
import 'package:core_dashboard/view/admin/websiteSetup/page.dart';
import 'package:core_dashboard/view/admin/websiteSetup/payment_method.dart';
import 'package:core_dashboard/view/admin/websiteSetup/popular_categories.dart';
import 'package:core_dashboard/view/admin/websiteSetup/slider.dart';
import 'package:core_dashboard/view/admin/workshop.dart';
import 'package:core_dashboard/view/teacher/pages/sidebar_techer.dart';
import 'package:core_dashboard/view/teacher/pages/tabbar_teacher.dart';

import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../../../shared/constants/defaults.dart';
import '../../../shared/widgets/header.dart';
import '../../../shared/widgets/not_found.dart';
import '../../../shared/widgets/sidemenu/sidebar.dart';
import '../../../shared/widgets/sidemenu/tab_sidebar.dart';

final GlobalKey<ScaffoldState> _drawerKeyT = GlobalKey();
// int selectedIndex = 0;

class TeacherEntryPoint extends StatefulWidget {
  const TeacherEntryPoint({super.key});

  @override
  State<TeacherEntryPoint> createState() => _TeacherEntryPointState();
}

class _TeacherEntryPointState extends State<TeacherEntryPoint> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // selectedIndex = _selectedIndex;
    return Scaffold(
      key: _drawerKeyT,
      drawer: Responsive.isMobile(context)
          ? SidebarTeacher(
              selectedIndex: _selectedIndex,
              onChanged: (i) => setState(() => _selectedIndex = i),
            )
          : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            SidebarTeacher(
              selectedIndex: _selectedIndex,
              onChanged: (i) => setState(() => _selectedIndex = i),
            ),
          if (Responsive.isTablet(context))
            TabSidebarTeacher(
              selectedIndex: _selectedIndex,
              onChanged: (i) => setState(() => _selectedIndex = i),
            ),
          Expanded(
            child: Column(
              children: [
                Header(drawerKey: _drawerKeyT),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1360),
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDefaults.padding *
                                (Responsive.isMobile(context) ? 1 : 1.5),
                          ),
                          child: SafeArea(
                            child: _selectedIndex == 0
                                // ? Text("data")
                                // ? const TrailsScreen()
                                // ? const StudyMaterialsScreen()
                                ? const DashboardPage()
                                // ? const GeneralSettingsScreen()
                                // MyProfileScreen(
                                //     isEditProfile: false,
                                //     isUpdatePassword: false,
                                //   )
                                : _selectedIndex == 16
                                    ? const WorkshopScreen()
                                    : _selectedIndex == 1
                                        ? const StaffRolesScreen()
                                        : _selectedIndex == 2
                                            ? const UserStaff()
                                            : _selectedIndex == 3
                                                ? const StudyMaterialsScreen()
                                                : _selectedIndex == 78
                                                    ? const ClassesScreen()
                                                    : _selectedIndex == 3
                                                        ? const NotFound()
                                                        : _selectedIndex == 4
                                                            ? const CategoriesListPage()
                                                            : _selectedIndex ==
                                                                    5
                                                                ? const CoursesList()
                                                                : _selectedIndex ==
                                                                        6
                                                                    ? const AssignmentScreen()
                                                                    : _selectedIndex ==
                                                                            7
                                                                        ? const QuizzesScreen()
                                                                        : _selectedIndex ==
                                                                                8
                                                                            ? const EnrollmentScreen()
                                                                            : _selectedIndex == 9
                                                                                ? const CertificatesListSccreen()
                                                                                : _selectedIndex == 10
                                                                                    ? const CertificatesTemplateListSccreen()
                                                                                    : _selectedIndex == 11
                                                                                        ? const RequestedOrganizationScreen()
                                                                                        : _selectedIndex == 12
                                                                                            ? const SuspendedOrganizationListScreen()
                                                                                            : _selectedIndex == 13
                                                                                                ? const Organization(isCreateOrganization: false)
                                                                                                : _selectedIndex == 14
                                                                                                    ? const Organization(isCreateOrganization: true)
                                                                                                    : _selectedIndex == 15
                                                                                                        ? const RequestedInstructorScreen()
                                                                                                        : _selectedIndex == 17
                                                                                                            ? const AssignInstructorScreen()
                                                                                                            // ? const SuspendedInstructorsScreen()
                                                                                                            : _selectedIndex == 18
                                                                                                                ? const InstructorListScreen()
                                                                                                                : _selectedIndex == 19
                                                                                                                    ? const CreateInstructorScreen()
                                                                                                                    : _selectedIndex == 20
                                                                                                                        ? const StudentListScreen()
                                                                                                                        : _selectedIndex == 21
                                                                                                                            ? const ReviewListScreen()
                                                                                                                            : _selectedIndex == 22
                                                                                                                                ? const RequestedPayoutsListScreen()
                                                                                                                                : _selectedIndex == 23
                                                                                                                                    ? const UnpaidPayoutsListScreen()
                                                                                                                                    : _selectedIndex == 24
                                                                                                                                        ? const RejectedPayoutsListScreen()
                                                                                                                                        : _selectedIndex == 25
                                                                                                                                            ? const PayoutsListScreen()
                                                                                                                                            : _selectedIndex == 26
                                                                                                                                                ? const SettingsScreen()
                                                                                                                                                : _selectedIndex == 27
                                                                                                                                                    ? const CourseScreen()
                                                                                                                                                    : _selectedIndex == 28
                                                                                                                                                        ? const EventScreen()
                                                                                                                                                        : _selectedIndex == 29
                                                                                                                                                            ? const PackageScreen()
                                                                                                                                                            : _selectedIndex == 30
                                                                                                                                                                ? const AccountListScreen()
                                                                                                                                                                : _selectedIndex == 31
                                                                                                                                                                    ? const IncomeListScreen()
                                                                                                                                                                    : _selectedIndex == 32
                                                                                                                                                                        ? const ExpenseListScreen()
                                                                                                                                                                        : _selectedIndex == 33
                                                                                                                                                                            ? const TransactionListScreen()
                                                                                                                                                                            : _selectedIndex == 34
                                                                                                                                                                                ? const ContactsScreen()
                                                                                                                                                                                : _selectedIndex == 35
                                                                                                                                                                                    ? const FeaturedCourseListScreen()
                                                                                                                                                                                    : _selectedIndex == 36
                                                                                                                                                                                        ? const DiscountCourseListScreen()
                                                                                                                                                                                        : _selectedIndex == 37
                                                                                                                                                                                            ? const StudentEngagementScreen()
                                                                                                                                                                                            : _selectedIndex == 38
                                                                                                                                                                                                ? const InstructorEngagementScreen()
                                                                                                                                                                                                : _selectedIndex == 39
                                                                                                                                                                                                    ? const PurchaseHistoryScreen()
                                                                                                                                                                                                    : _selectedIndex == 40
                                                                                                                                                                                                        ? const CourseCompletionScreen()
                                                                                                                                                                                                        : _selectedIndex == 41
                                                                                                                                                                                                            ? const StudentPerformanceScreen()
                                                                                                                                                                                                            : _selectedIndex == 42
                                                                                                                                                                                                                ? const EventBookingScreen()
                                                                                                                                                                                                                : _selectedIndex == 43
                                                                                                                                                                                                                    ? const TransactionListScreen()
                                                                                                                                                                                                                    : _selectedIndex == 44
                                                                                                                                                                                                                        ? const TestimonialListScreen()
                                                                                                                                                                                                                        : _selectedIndex == 45
                                                                                                                                                                                                                            ? const CreateTestimonialScreen()
                                                                                                                                                                                                                            : _selectedIndex == 46
                                                                                                                                                                                                                                ? const BlogCategoryScreen()
                                                                                                                                                                                                                                : _selectedIndex == 47
                                                                                                                                                                                                                                    ? const BlogScreen()
                                                                                                                                                                                                                                    : _selectedIndex == 48
                                                                                                                                                                                                                                        ? const RequestedCourseScreen()
                                                                                                                                                                                                                                        : _selectedIndex == 49
                                                                                                                                                                                                                                            ? const ApprovedCourseScreen()
                                                                                                                                                                                                                                            : _selectedIndex == 50
                                                                                                                                                                                                                                                ? const RejectedCourseScreen()
                                                                                                                                                                                                                                                : _selectedIndex == 51
                                                                                                                                                                                                                                                    ? const PackageDurationTypeScreen()
                                                                                                                                                                                                                                                    : _selectedIndex == 52
                                                                                                                                                                                                                                                        ? const PackageListScreen()
                                                                                                                                                                                                                                                        : _selectedIndex == 53
                                                                                                                                                                                                                                                            ? const PackagePurchaseListScreen()
                                                                                                                                                                                                                                                            : _selectedIndex == 54
                                                                                                                                                                                                                                                                ? const RequestedEventsScreen()
                                                                                                                                                                                                                                                                : _selectedIndex == 55
                                                                                                                                                                                                                                                                    ? const ApprovedEventScreen()
                                                                                                                                                                                                                                                                    : _selectedIndex == 56
                                                                                                                                                                                                                                                                        ? const RejectedEventsScreen()
                                                                                                                                                                                                                                                                        : _selectedIndex == 57
                                                                                                                                                                                                                                                                            ? const EventCategoryScreen()
                                                                                                                                                                                                                                                                            : _selectedIndex == 58
                                                                                                                                                                                                                                                                                ? const SaleEventScreen()
                                                                                                                                                                                                                                                                                : _selectedIndex == 59
                                                                                                                                                                                                                                                                                    ? const SliderScreen()
                                                                                                                                                                                                                                                                                    : _selectedIndex == 60
                                                                                                                                                                                                                                                                                        ? const PopularCategoriesScreen()
                                                                                                                                                                                                                                                                                        : _selectedIndex == 61
                                                                                                                                                                                                                                                                                            ? const BrandScreen()
                                                                                                                                                                                                                                                                                            : _selectedIndex == 62
                                                                                                                                                                                                                                                                                                ? const PageScreen()
                                                                                                                                                                                                                                                                                                : _selectedIndex == 63
                                                                                                                                                                                                                                                                                                    ? const ImageGalleryScreen()
                                                                                                                                                                                                                                                                                                    : _selectedIndex == 64
                                                                                                                                                                                                                                                                                                        ? const FooterMenuScreen()
                                                                                                                                                                                                                                                                                                        : _selectedIndex == 65
                                                                                                                                                                                                                                                                                                            ? const PaymentMethodScreen()
                                                                                                                                                                                                                                                                                                            : _selectedIndex == 66
                                                                                                                                                                                                                                                                                                                ? MyProfileScreen(
                                                                                                                                                                                                                                                                                                                    isEditProfile: false,
                                                                                                                                                                                                                                                                                                                    isUpdatePassword: false,
                                                                                                                                                                                                                                                                                                                  )
                                                                                                                                                                                                                                                                                                                : _selectedIndex == 67
                                                                                                                                                                                                                                                                                                                    ? MyProfileScreen(
                                                                                                                                                                                                                                                                                                                        isEditProfile: true,
                                                                                                                                                                                                                                                                                                                        isUpdatePassword: false,
                                                                                                                                                                                                                                                                                                                      )
                                                                                                                                                                                                                                                                                                                    : _selectedIndex == 68
                                                                                                                                                                                                                                                                                                                        ? MyProfileScreen(
                                                                                                                                                                                                                                                                                                                            isEditProfile: false,
                                                                                                                                                                                                                                                                                                                            isUpdatePassword: true,
                                                                                                                                                                                                                                                                                                                          )
                                                                                                                                                                                                                                                                                                                        : _selectedIndex == 69
                                                                                                                                                                                                                                                                                                                            ? const LanguageScreen()
                                                                                                                                                                                                                                                                                                                            : _selectedIndex == 80
                                                                                                                                                                                                                                                                                                                                ? UploadVideo(isUploadVideo: false)
                                                                                                                                                                                                                                                                                                                                : _selectedIndex == 81
                                                                                                                                                                                                                                                                                                                                    ? const TrailsScreen()
                                                                                                                                                                                                                                                                                                                                    : _selectedIndex == 70
                                                                                                                                                                                                                                                                                                                                        ? const AddonsScreen()
                                                                                                                                                                                                                                                                                                                                        : const NotFound(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
