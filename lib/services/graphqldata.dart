import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLObject {
  static HttpLink httpLink =
      HttpLink(uri: "https://moshal-app.herokuapp.com/graphql");

  static AuthLink authLink = AuthLink();

  static Link link = httpLink as Link;

  ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(cache: InMemoryCache(), link: link));
}

GraphQLObject graphQLObject = new GraphQLObject();

String getStudentMessages(receiver) {
  return ("""
        query GetStudentMessages{
                      getStudentMessage(receiver: "$receiver") {
                                  id
                                  receiver
                                  body
                                  date
                      }
                }

  """);
}


String newMessage(body, student, coordinator) {
  return ("""
    mutation AddStudentMessage{
        addStudentMessage(body: "$body", student: "$student", coordinator: "$coordinator"){
          messages{
            id
            body
            to
            date
          }
        }

    }  
  
  """);
}

String getStudentChats(studentId) {
  return ("""
          query GetStudentChats{
            getStudentChats(studentId: "$studentId"){
             id
              createdAt
              lastUpdated
              coordinatorId{
                name
              }
              studentId{
                name
              }
            }
          }

      """);
}

String getStudentsContacts(uni) {
  return ("""
          query GetStudentContacts{
            getStudentsContacts(uni: "$uni"){
             name
             surname
             email
             cellnumber
             dob
            }
          }

      """);
}

String getSearchedQuery(uni, searchQuery) {
  return ("""
          query GetSearchedStudents{
            getSearchedStudents(uni: "$uni", searchQuery: "$searchQuery"){
             name
             surname
             email
             cellnumber
             dob
            }
          }

      """);
}

String getChatMessages(chatId) {
  return ("""
            query GetChatMessages {
                getChatMessages(chatId: "$chatId") {
                    messages {
                        id
                        messageBody
                        to
                        date
                    }
            } 
        }

        """);
}
