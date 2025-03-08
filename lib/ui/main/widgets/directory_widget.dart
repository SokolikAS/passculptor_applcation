import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

class DirectoryDrawerWidget extends StatelessWidget {
  const DirectoryDrawerWidget({
    super.key,
    required this.listenableEntityState,
  });

  final ValueNotifier<EntityState<Map<String, Set<String>>>>
      listenableEntityState;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 5 / 6,
      child: EntityStateNotifierBuilder(
        listenableEntityState: listenableEntityState,
        loadingBuilder: (_, __) => const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (_, jsonMap) => ListView(
          children: [
            const DrawerHeader(
              child: Text('Сохраненные пароли'),
            ),
            Text(jsonMap.toString()),
          ],
        ),
      ),
    );
  }
}
