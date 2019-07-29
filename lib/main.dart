import 'package:flutter/material.dart';
import 'screens/Log_Reg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:moshal/services/graphqldata.dart';
import 'components/messageCard.dart';
import 'components/chatCard.dart';

void main() => runApp(
  GraphQLProvider(
    client: graphQLObject.client,
    child:CacheProvider(
      child: MaterialApp(
        routes: {
          ChatScreen.routeName: (context) => ChatScreen()
        },
      title: 'Moshal',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    ),
    ),
  )
);