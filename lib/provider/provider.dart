import 'package:provider/provider.dart';
import 'package:raft_test/provider/auth_provider.dart';
import 'package:raft_test/provider/post_provider.dart';
import 'package:raft_test/provider/user_provider.dart';

dynamic get listOfProvider => [
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
  ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
];