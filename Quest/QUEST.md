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