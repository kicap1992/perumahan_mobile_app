import 'package:flutter/material.dart';
import 'package:perumahan_bew/ui/views/user_index/user_list_pembangunan/user_list_pembangunan_view.dart';
import 'package:stacked/stacked.dart';

import './user_list_pembangunan_page_view_model.dart';

class UserListPembangunanPageView extends StatelessWidget {
  const UserListPembangunanPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserListPembangunanPageViewModel>.nonReactive(
      viewModelBuilder: () => UserListPembangunanPageViewModel(),
      onViewModelReady: (UserListPembangunanPageViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        UserListPembangunanPageViewModel model,
        Widget? child,
      ) {
        return const UserListPembangunanView();
      },
    );
  }
}
