# WD API Test

## Development setup on Mac:

1. Fork the repo in github

2. Clone the forked repo to your mac

3. Install [rvm](http://rvm.beginrescueend.com/ "RVM"): 

		bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
	
	__Attention__: Be sure to follow post install instructions.
	
4. Install ruby 1.9.2 in rvm:

		rvm install 1.9.2
	
5. Go to project folder:

		cd wd-api-test
	
6. Read the RVM Notice, follow on screen instructions and at the end type:

		yes
	
7. Make sure the proper version of ruby is used:

		ruby -v

7. Install required gems:

		bundle install
	
8. Edit config/database.yml

	You can use `config/database_example.yml` as a skeleton.

9. Start local development server

		rails s thin

## Introduction

The API does its best to adhere to the principles of REST and should hopefully feel familiar if you’ve interacted with APIs of other consumer Web apps before. Manipulating resources is done over HTTP. We do our best to follow standards and best practices.

## Authorization

Authorization is required to get or modify data (generally whenever using GET, POST, PUT or DELETE). Some resources are protected and will require authorization to manipulate. Protected resources exposed by this API can be accessed using `auth_token`. The `auth_token` parameter is unique for all users and used for authentication each user per request where required.

## Formats and HTTP response codes

### Response Formats

We currently support only JSON format.

### HTTP Response Codes

The following HTTP status codes may be returned in responses from the server:

1. 200 OK
It worked fine!

2. 404 Not Found
The resource doesn’t exist.
	
3. 401 Not Authorized
You’re accessing resources without the correct authorization. (Make sure your authorization code is properly working - double check if `auth_token` parameter is present)

4. 422 Unprocessable Entity
In most cases this is the result of invalid or missing parameters. Make sure the data you’re sending in your request is correct.

5. 500 Internal Server Error
Something really went wrong and we could’t handle your request in any way.

## Sample usage with curl:

1. Create user

		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"email":"john@gmail.com", "password":"MySecretPass", "password_confirmation":"MySecretPass", "first_name":"John", "last_name":"Wayne", "hobby":"diving"}}' "http://localhost:3000/users"

2. Index profiles

		curl -v -H "Accept: application/json" -H "Content-type: application/json" "http://localhost:3000/api/v1/profiles"

3. Show profile

		curl -v -H "Accept: application/json" -H "Content-type: application/json" "http://localhost:3000/api/v1/profiles/<ID>"

4. Edit profile

		curl -v -H "Accept: application/json" -H "Content-type: application/json" "http://localhost:3000/api/v1/profiles/<ID>/edit?auth_token=<AUTH_TOKEN>"

5. Update profile

		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{"user":{"first_name":"John", "last_name":"Doe", "hobby":"climbing"}}' "http://localhost:3000/api/v1/profiles/<ID>?auth_token=<AUTH_TOKEN>"

6. Delete profile

		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X DELETE "http://localhost:3000/api/v1/profiles/<ID>?auth_token=<AUTH_TOKEN>"