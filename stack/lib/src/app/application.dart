/*
 * Copyright (C) 2018 The jVanila Open Source Project
 * Copyright (C) 2018 The Purnatva Solutions Private limited
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 * author - pavan.jvanila@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:jvanila_flutter/jvanila.dart';
import 'package:stack/src/moduleB/module_b_widget.dart';

class StackApplication extends ApplicationView {

  Map<String, WidgetBuilder> routes;

  StackApplication({this.routes});

  @override
  void setHomeView() {
    if (widgetTree['home'] == null) {
      widgetTree['home'] = new RootWidget();
    }
    else {
      widgetTree['home'] = new RootWidget();
      //(widgetTree['home'] as RefreshableWidget).refresh();
    }
  }

  @override
  Widget loadView(BuildContext context) {
    return new MaterialApp(home: widgetTree["home"], routes: routes,);
  }
}

class RootWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Second'),
          onPressed: () {
            Routing.push(context, new ModuleBWidget(new ModuleBView()));
            // Navigate to the second screen using a named route
//            Navigator.pushNamed(context, '/moduleA');
//            Navigator.pushReplacementNamed(context, '/moduleA');
          },
        ),
      ),
    );
  }
}