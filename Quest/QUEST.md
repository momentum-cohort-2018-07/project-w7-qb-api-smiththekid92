# *Welcome To Quest!*

*This blogging application comes with an web version and an API version.*

****

**Let's go over some basics:**
* Anyone can view the qusestions asked and the answers to that question
* You must be logged in to ask or answer a question
* Usernames must be unique
* Passwords must be a mininum of 6 characters 

**Asking/Answering A Question**
* All questions and answers must have a title and a body
* If you try to ask or answer a question without authenticating you will be redirected to the login screen

****

***USING THE API VERSION OF QUEST***


* When using the API version of this application it is recommended that you use POSTMAN
* In order to created *any* POST request via the API you **MUST** authenticate with your API token prior to creating a reqest
* In order to create a POST request (such as adding a user) please use the following format:

{ "user": 

{
	"id": "[id#]",
	"username": "[username]",
	"email": "email@email.com",
	"password": "password"
}

}

*Note: When creating a user via POSTMAN your API token can be viewed on the preview screen*

* When creating a GET request please use the specified route to view the information

Ex: *localhost:3000/questions/:id/*

*localhost:3000/questions/45/*

* Routes:

*Prefix Verb   URI Pattern  

GET    /session/new(.:format)                     
DELETE /session(.:format)                         
POST   /session(.:format)                         
GET    /users(.:format)                           
POST   /users(.:format)                          
GET    /users/new(.:format)                       
GET    /users/:id/edit(.:format)                  
GET    /users/:id(.:format)                       
PATCH  /users/:id(.:format)                       
PUT    /users/:id(.:format)                       
DELETE /users/:id(.:format)                       
GET    /questions/:question_id/answers(.:format)  
POST   /questions/:question_id/answers(.:format)   
GET    /                                                                   GET    /api/v1/users(.:format)                                             POST   /api/v1/users(.:format)                                             GET    /api/v1/users/new(.:format)                                         GET    /api/v1/users/:id/edit(.:format)                                    GET    /api/v1/users/:id(.:format)                                         PATCH  /api/v1/users/:id(.:format)                                         PUT    /api/v1/users/:id(.:format)                                         DELETE /api/v1/users/:id(.:format)                                         GET    /api/v1/questions/:question_id/answers(.:format)                    POST   /api/v1/questions/:question_id/answers(.:format)                    GET    /api/v1/questions/:question_id/answers/new(.:format)                GET    /api/v1/questions/:question_id/answers/:id/edit(.:format)           GET    /api/v1/questions/:question_id/answers/:id(.:format)                PATCH  /api/v1/questions/:question_id/answers/:id(.:format)                PUT    /api/v1/questions/:question_id/answers/:id(.:format)                DELETE /api/v1/questions/:question_id/answers/:id(.:format)                GET    /api/v1/questions(.:format)                                         POST   /api/v1/questions(.:format)                                         GET    /api/v1/questions/new(.:format)                                     GET    /api/v1/questions/:id/edit(.:format)                                GET    /api/v1/questions/:id(.:format)                                     PATCH  /api/v1/questions/:id(.:format)                                     PUT    /api/v1/questions/:id(.:format)                                     DELETE /api/v1/questions/:id(.:format)                                     