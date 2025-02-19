import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:unicons/unicons.dart';

import '../../config/locator.dart';
import '../../core/services/manage_files.dart';
import '../widgets/favorite_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ManageFiles _manageFiles = locator<ManageFiles>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  translate('app.fav.title'),
                  key: const Key('app.fav.title'),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              loading
                  ? Center(child: CircularProgressIndicator(strokeWidth: 2))
                  : IconButton(
                      icon: Icon(
                        UniconsLine.file_export,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        setState(() => loading = true);
                        await _manageFiles.saveFile();
                        setState(() => loading = false);
                      },
                    )
            ],
          ),
        ),
        Expanded(child: FavoriteList()),
      ],
    );
  }
}
