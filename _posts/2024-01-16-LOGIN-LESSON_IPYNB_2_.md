---
layout: base
title: Login Lesson
description: SASS + JavaScript Login/Signup pages
author: Finn C, Theo H, Justin N
permalink: lesson
type: lessons
courses: {'csa': {'week': 18}}
---

# Login and Sign up Page Lesson

# Sign up/Login Wireframes

## What the common HTML elements needed
- Container: The Div that holds all the elements inside of it, first layer
    - Common SASS that a Container will have:
    - display
    - justify-content/align items
    - color
- Card: A Div that will hold username, password buttons
- _________ and ________: Where the user will put there information/login

## Needed HTML properties
- Most HTML Elements:
    - _____: used to assign html elements to there own SASS
    - id: used mostly in javascript to identify a single element in an entire page full of HTML
- _____:
    - Placeholder: puts text inside an input to help the user what to input
- Buttons:
    - onclick: runs a javascript function when clicked
    - note: onclick can be replaced with event listeners, although onclick is simpler to code


# Bare Code
```html
<div class="CONTAINER">
    <div class="CARD">
        <h3>Login</h3>
        <input id="signInEmailInput" class="input" placeholder="Email">
        <input id="signInPasswordInput" class="input" placeholder="Password">
        <button class="signInButton" onclick="login_user()">Login</button>
    </div>
</div>
```

<div class="CONTAINER">
    <div class="CARD">
        <h3>Login</h3>
        <input id="signInEmailInput" class="input" placeholder="Email">
        <input id="signInPasswordInput" class="input" placeholder="Password">
        <button class="signInButton" onclick="login_user()">Login</button>
    </div>
</div>

<br>

# SASS
- Be SASSy when it come to designing your wireframes
- Nobody wants to look at some boring designs when signing up or logging in
- Make sure to add some ____ to your code 

## Not SASSy code
![no sass](https://raw.githubusercontent.com/F1nnC/Login-Lesson/main/images/mortSASS.png)

## SASSy Code
<div class="login-container">
    <div class="card">
        <h3>Login</h3>
        <div class="Email">
            <input id="signInEmailInput" class="input" placeholder="Email">
        </div>
        <div class="Password">
            <input id="signInPasswordInput" class="input" placeholder="Password">
        </div>
        <div class="Buttons">
            <button class="signInButton">Login</button>
        </div>
    </div>
</div>

# Copy this code into your custom-styles.scss
```scss
// Cool color palette
$color1: #5D737E; $color2: #64B6AC; $color3: #D0F4DE; $color4: #1B4332; 
// Warm color palette
$color5: #FFB447; $color6: #FF3E4D;  $color7: #FF1E56; $color8: #FFBD69; 

// Animating Backgrounds
@keyframes fade1 {
    0% { background-color: $color1} 25% { background-color: $color2} 50% { background-color: $color3} 75% { background-color: $color4} 100% { background-color: $color1}
  }
  
@keyframes fade2 {
    0% { background-color: $color5} 25% { background-color: $color6} 50% { background-color: $color7} 75% { background-color: $color8} 100% { background-color: $color5}
}

.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    color: black;
    .card {
        width: 300px;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        animation: fade1 5s ease infinite; 
    }
    .card2 {
        width: 300px;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        animation: fade2 5s ease infinite;
    }
    h3 {
        margin-bottom: 20px;
    }
    .input {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
    }
}
```

# Popcorn Hacks
- Change the colors in the keyframe animation
- Extra points if you can make a completely different keyframe that looks cool


# overview of userDbRequest function (part 1 of the login/signup puzzle)

### what does this even do?

- primary function is to add data to our frontend html fragment, which will store our data.
- this would be a creating data in our frontend database view which users can see with authentication aka login. (part 2)

<!-- HTML table fragment for page -->
<table>
  <thead>
  <tr>
    <th>Name</th>
    <th>ID</th>
    <th>Age</th>
  </tr>
  </thead>
  <tbody id="result">
    <!-- javascript generated data -->
  </tbody>
</table>

this html fragment represents our table which we fill with data using our function.


```java
function userDbRequest() {

    // prepare HTML result container for new output
    const resultContainer = document.getElementById("result");

    // set options for cross origin header request
    const options = {
      method: 'GET', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, *cors, same-origin
      cache: 'default', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'include', // include, *same-origin, omit
      headers: {
        'Content-Type': 'application/json',
      },
    };

    fetch("http://localhost:8085/api/person/", options)
      .then(response => {
        if (response.status !== 200) {
            const errorMsg = 'Database response error: ' + response.status;
            console.log(errorMsg);
            const tr = document.createElement("tr");
            const td = document.createElement("td");
            td.innerHTML = errorMsg;
            tr.appendChild(td);
            resultContainer.appendChild(tr);
            return;
        }
        // valid response will contain json data
        response.json().then(data => {
            console.log(data);
            for (const row of data) {
              // tr and td build out for each row
              const tr = document.createElement("tr");
              const name = document.createElement("td");
              const id = document.createElement("td");
              const age = document.createElement("td");
              // data is specific to the API
              name.innerHTML = row.name;
              id.innerHTML = row.email;
              age.innerHTML = row.age;
              // this build td's into tr
              tr.appendChild(name);
              tr.appendChild(id);
              tr.appendChild(age);
              // add HTML to container
              resultContainer.appendChild(tr);
            }
        })
    })
    // catch fetch errors (ie ACCESS to server blocked)
    .catch(err => {
      console.error(err);
      const tr = document.createElement("tr");
      const td = document.createElement("td");
      td.innerHTML = err + ": " + url;
      tr.appendChild(td);
      resultContainer.appendChild(tr);
    });
  }
```

# popcorn hack
- make sure you understand how you can adapt this to your project. What role with userDbRequest() play in your project? How will the row and column values be changed for your specific purposes?

# LOG IN

# overview of user authentication aka how to do login (part 2 of the login/signup puzzle)

### what do we need to do for login?

1. create function that sends authentication request to backend
2. create backend methods to only allow authenticated users to send GET request to backend when accessing the database on frontend
3. implement those backend methods into frontend


# figure 1-A: function login_user in frontend


```java
function login_user() {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    // STEP ONE: COLLECT USER INPUT
    var raw = JSON.stringify({
        "email": document.getElementById("signInEmailInput").value,
        "password": document.getElementById("signInPasswordInput").value

        // For quick testing
        //"email": "toby@gmail.com",
        //"password": "123Toby!"
    });
    console.log(raw);

    var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        credentials: 'include',
        body: raw,
        redirect: 'follow'
    };

    // STEP TWO: SEND REQUEST TO BACKEND AND GET JWT COOKIE
    fetch("http://localhost:8085/authenticate", requestOptions)
    .then(response => {
        if (!response.ok) {
            const errorMsg = 'Login error: ' + response.status;
            console.log(errorMsg);

            switch (response.status) {
                case 401:
                    alert("Incorrect username or password");
                    break;
                case 403:
                    alert("Access forbidden. You do not have permission to access this resource.");
                    break;
                case 404:
                    alert("User not found. Please check your credentials.");
                    break;
                // Add more cases for other status codes as needed
                default:
                    alert("Login failed. Please try again later.");
            }

            return Promise.reject('Login failed');
        }
        return response.text()
    })
    .then(result => {
        console.log(result);
        window.location.href = "http://127.0.0.1:4100/Login-Lesson/account";
    })
    .catch(error => console.error('Error during login:', error));

}
```

# what does it do?

this function sends an authentication request to backend, which then redirects to our database page.

the authentication request in question is located in spring_portfolio/mvc/jwt/JwtApiController.java 

FOR REFERENCE:


```java
@PostMapping("/authenticate")
	public ResponseEntity<?> createAuthenticationToken(@RequestBody Person authenticationRequest) throws Exception {
		authenticate(authenticationRequest.getEmail(), authenticationRequest.getPassword());
		final UserDetails userDetails = personDetailsService
				.loadUserByUsername(authenticationRequest.getEmail());
		final String token = jwtTokenUtil.generateToken(userDetails);
		final ResponseCookie tokenCookie = ResponseCookie.from("jwt", token)
			.httpOnly(true)
			.secure(true)
			.path("/")
			.maxAge(3600)
			.sameSite("None; Secure")
			// .domain("example.com") // Set to backend domain
			.build();
		return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, tokenCookie.toString()).build();
	}

	private void authenticate(String username, String password) throws Exception {
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
		} catch (DisabledException e) {
			throw new Exception("USER_DISABLED", e);
		} catch (BadCredentialsException e) {
			throw new Exception("INVALID_CREDENTIALS", e);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}

```

this is the authentication method we are calling to, which provides us with the cookie we need for access to our database.

# figure 1-B: function user_data in frontend db


```java

function fetchUserData() {
    var requestOptions = {
      method: 'GET',
      mode: 'cors',
      cache: 'default',
      credentials: 'include',
    };

    fetch("http://localhost:8085/api/person/jwt", requestOptions)
      .then(response => {
              if (!response.ok) {
                  const errorMsg = 'Login error: ' + response.status;
                  console.log(errorMsg);

                  switch (response.status) {
                      case 401:
                          alert("Please log into or make an account");
                          window.location.href = "http://127.0.0.1:4100/Login-Lesson/loginSignup";
                          break;
                      case 403:
                          alert("Access forbidden. You do not have permission to access this resource.");
                          break;
                      case 404:
                          alert("User not found. Please check your credentials.");
                          break;
                      // Add more cases for other status codes as needed
                      default:
                          alert("Login failed. Please try again later.");
                  }

                  return Promise.reject('Login failed');
              }
              return response.json();
              // Success!!!
          })
      .then(data => {
        // Display user data above the table
        const userDataContainer = document.getElementById("userData");
        userDataContainer.innerHTML = `
          <img src="/Login-Lesson/images/defaultUser.png" width="250" height="250">
          <h1><strong>${data.name}</strong></h1>
          <p>Email: ${data.email}</p>
          <p>Age: ${data.age}</p>
          <p>ID: ${data.id}</p>
          <button onclick="signOut()">Sign Out</button>
        `;
        console.log(data);
      })
      .catch(error => console.log('error', error));
}
```

# what does it do?

this function resides in our database display on our frontend, and does 2 things

1. access our jwt method and check for authentication, then get the database if so
2. handle errors for when authentication fails

# backend method


```java
@GetMapping("/jwt")
@PreAuthorize("isAuthenticated()")  // Restrict access to authenticated users
public ResponseEntity<Person> getAuthenticatedPersonData() {
    String username = SecurityContextHolder.getContext().getAuthentication().getName();
    Person person = repository.findByEmail(username);  // Retrieve data for the authenticated user
    return new ResponseEntity<>(person, HttpStatus.OK);
}
```

# so how do I add login?

1. create a login function on the frontend which can send authentication request to backend. make sure it passes user input as variables for the authentication request
2. in database page, create method which calls a get method that checks for authentication first before displaying the data.
3. add error handling for when our authentication fails

# SIGN UP

## Steps
1. Collect user input
2. Put user input into a url as parameters
3. Send POST to backend to make user
3. (RECOMMENDED) Redirect/Refresh page


```java
function signup_user() {
    var requestOptions = {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache'
    };

    // Collect user input
    let fetchName = document.getElementById("signUpNameInput").value;
    let fetchEmail = document.getElementById("signUpEmailInput").value;
    let fetchPassword = document.getElementById("signUpPasswordInput").value;
    let fetchDob = document.getElementById("signUpDobInput").value;

    // Posting in backend only works if user input is sent as query parameters
    let requestURL = `http://localhost:8085/api/person/post?email=${fetchEmail}&password=${fetchPassword}&name=${fetchName}&dob=${fetchDob}`;
    console.log(requestURL)

    fetch(requestURL, requestOptions)
    .then(response => {
            if (!response.ok) {
                return response.text().then(errorMsg => {
                    alert('Error: ' + errorMsg);
                });
            }
            // Success!!!
            alert("Signup Complete");
            // Redirect to Database location
            location.reload();
        })
        .catch(error => {
            alert('An unexpected error occurred: ' + error.message);
        });
}
```

# Notable Backend Code

## Security


```java
.authorizeHttpRequests(auth -> auth
	.requestMatchers("/authenticate").permitAll()
    .requestMatchers("/mvc/person/update/**", "/mvc/person/delete/**").authenticated()

    // .requestMatchers("/api/person/post/**", "/api/person/delete/**").authenticated()
    // Removed so anyone without a cookie can post

    .requestMatchers("/api/person/delete/**").authenticated()
    .requestMatchers("/**").permitAll()
)
```

# Endpoint Mapping


```java
@PostMapping( "/post")
// @RequestParam is why user input needs to be a parameter
public ResponseEntity<Object> postPerson(@RequestParam("email") String email,
                                         @RequestParam("password") String password,
                                         @RequestParam("name") String name,
                                         @RequestParam("dob") String dobString) {
    Date dob;
    // dob handling
    try {
        dob = new SimpleDateFormat("MM-dd-yyyy").parse(dobString);
    } catch (Exception e) {
        return new ResponseEntity<>(dobString +" error; try MM-dd-yyyy", HttpStatus.BAD_REQUEST);
    }
    // A person object WITHOUT ID will create a new record with default roles as student
    Person person = new Person(email, password, name, dob);
    personDetailsService.save(person);
    return new ResponseEntity<>(email +" is created successfully", HttpStatus.CREATED);
}
```

# PULL REQUESTS
- If anyone can make the signout button clear the jwt cookie and redirect to login page (I was not able to figure this out)
- Make your own endpoint mapping in the backend and have it do something you think is useful/cool
