import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_cubit.dart';
import 'package:project_test/features/auth/presentation/views/forget_password.dart';
import 'package:project_test/features/auth/presentation/views/login_View.dart';
import 'package:project_test/features/auth/presentation/views/register_View.dart';
import 'package:project_test/features/cart/presentation/widgets/SucssesfulScreen.dart';
import 'package:project_test/features/cart/presentation/widgets/chechout.dart';
import 'package:project_test/features/home/presentation/views/home_view.dart';
import 'package:project_test/features/home/presentation/widgets/battreyscreen.dart';
import 'package:project_test/features/home/presentation/widgets/cellscreen.dart';
import 'package:project_test/features/home/presentation/widgets/chargerscreen.dart';
import 'package:project_test/features/home/presentation/widgets/inverterscreen.dart';
import 'package:project_test/features/home/presentation/widgets/testnavbar.dart';
import 'package:project_test/features/on_borading/presentation/views/logo_view.dart';
import 'package:project_test/features/on_borading/presentation/views/onboradingView.dart';

abstract class AppRouter {
  // static const kHomeView = '/homeview';
  // static const konBoradingView = '/onBoradingView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, State) => logoView(),
      ),
      GoRoute(
        path: "/onBoarding",
        builder: (context, State) => onBoardingView(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, State) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const registerView(),
        ),
      ),
      GoRoute(
        path: "/login",
        builder: (context, State) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const loginnView(),
        ),
      ),
      GoRoute(
        path: "/forgetpassword",
        builder: (context, State) => BlocProvider(
          create: (context) => AuthCubit(),
          child: forgetPasswordView(),
        ),
      ),
      GoRoute(
        path: "/homeNavBar",
        builder: (context, State) => const navtest(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, State) => const Home(),
      ),
      GoRoute(
        path: "/inverterScreen",
        builder: (context, State) => const inverterScreen(),
      ),
      GoRoute(
        path: "/chargerScreen",
        builder: (context, State) => const chargerScreen(),
      ),
      GoRoute(
        path: "/cellScreen",
        builder: (context, State) => const cellScreen(),
      ),
      GoRoute(
        path: "/batteryScreen",
        builder: (context, State) => const batteryScreen(),
      ),
      GoRoute(
        path: "/checkout",
        builder: (context, State) => const checkout(),
      ),
      GoRoute(
        path: "/SucssesfulScreen",
        builder: (context, State) => const SucssesfulScreen(),
      ),

    ],
  );
}
