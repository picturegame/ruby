# IronPics API

API For THE IRON YARD group project - Image guessing game

## General Rules

### Authorization

All authorized requests unless otherwise mentioned require an "**Auth-Token**" header to be present. Users are assigned an Auth Token during account creation.

### Errors

Any request that fails to be processed will contain an "errors" key in the returned JSON describing the problem.

## Routes

#### POST /registrations

*This route is for managing registration of new users.*

Params:
* username: string
* email: string
* password: string

Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

**Request**
...
{
"username": "Bob",
"email:" "Bob@bob.bob",
"password": "password"
}
...

**Response**
...
{
	"user": {
		"username": "bob",
		"email": "bob@bob.bob",
		"auth_token": "c92692fd6c686ef6985b8eb124d37488"
	}
}
...
