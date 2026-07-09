import 'package:go_router/go_router.dart';
import 'package:pgold_wallet/data/repos/dashboard_repository.dart';
import 'package:pgold_wallet/data/services/mock_service.dart';
import 'package:pgold_wallet/screens/dashboard/dashboard_screen.dart';
import 'package:pgold_wallet/stores/dashboard/dashboard_store.dart';


final mockService = MockService();
final repository = DashboardRepository(mockService);
final dashboardStore = DashboardStore(repository);

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return DashboardScreen(
          store: dashboardStore,
        );
      },
    ),
  ],
);