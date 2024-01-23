---
toc: True
comments: True
layout: notebook
title: Thymeleaf Lesson
courses: {'csa': {'week': 19}}
type: lessons
---

# What is ThymeLeaf 
Thymeleaf is a template engine for server-side Java applications to create to create pages that can be displayed with within the browser. It can 
process the following templates: 

- HTML 
- XML 
- JavaScript 
- CSS
- Plain text 

It is most commonly used to generate HTML content for websites. 

## Structure of Thymeleaf
The templates used by Thymeleaf are just HTML5 files with extra properties added for dynamic content. 

```
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>This is the title</title>
</head>
<body>
    <h1 th:text="${message}">hello</h1>
</body>
</html>
```

the code defines a simple webpage with a title and a heading. The heading's text is set dynamically using Thymeleaf's syntax.

## Syntax of Thymeleaf
- The basic syntax of Thymeleaf are from the 5 types of basic expressions 
- `${}` - Variable Expressions
- `*{}` - Selection Expressions
- `#{}` - Message Expressions
- `@{}` - Link (URL) Expressions
- `~{}` - Fragment Expressions

### Variable Expressions
- Variable expressions are when integrated with Spring are Spring Expression Language that operate on context variables. 

A context variable could look like `${session.user.name}`


### Selection Expressions
- Selection expressions are similar to variable expressions but execute on the previous object instead of the entire context. 

A selection expression could look like `*{title}`

where it would act on a object specified by `th.object`.  

```Html
<div th:object="${book}">
  ...
  <span th:text="*{title}">...</span>
  ...
</div>
```

### Message Expressions
- Message expressions are used to be abel to access messages from external sources. These are most commonly from .properties files where they can be referenced through using an optional key and applying a set of parameters. 

A message expression could look like `#{title}` You can also use variable expressions within the message expression such as `#{message.entrycreated(${entryId})}`

where it would act on a object specified by `th.object`.  As seen below. 

```HTML
<table>
  ...
  <th th:text="#{header.address.city}">...</th>
  <th th:text="#{header.address.country}">...</th>
  ...
</table>
```

### Link Expressions
- Link expressions are used to create URLs add context to them which is known as URL rewriting. 
- So for instance if you have a shopping endpoint you may use an expression 

```html
<a th:href="@{/order/list}">...</a>
```
- While also being able to have parameters within the URL such as 

```html
<a th:href="@{/order/details(id=${orderId},type=${orderType})}">...</a>
```

- Link expressions also allow for being relative to not add application context through for example 

```html
<a th:href="@{../order/list}">...</a>
```

- Or Server relative with no app context 

```html
<a th:href="@{~/order/list}">...</a>
```
- Or protocol relative using http or https to display the page within the browser. 

```html
<a th:href="@{/grocery.checkout.com/cart}">...</a>
```

- Or absolute link expressions like 

```html
<a th:href="@{http://www.mycompany.com/main}">...</a>
```

### Fragment Expressions 
- Fragment expressions are used to represent little sections of markup and move them around hte page, allowing markup to be replicated and passed to other templates. 

- Commonly used with `th:insert` and `th:replace` attributes. Which can be used anywhere. 

```html
<div th:with="frag=~{footer :: #main/text()}">
  <p th:insert="${frag}">
</div>
```

### Attributes
- `th.text` - replacing a body with just the tag 
- `th:each` - repeats the element per the length of the array passed in. for example `<li th:each="book : ${books}" th:text="${book.title}">En las Orillas del Sar</li>`

### XHTML 
- Thymeleaf also contains XHTML and HTML5 attributes that when used evaluate the expression and set it equal to value of the result  

```html
<form th:action="@{/createOrder}">

<input type="button" th:value= "#{form.submit}"/>

<a th:href="@{/admin/users}">
```



# Auto-Configuration:

In Spring Boot, Auto-Configuration automatically configures beans based on the dependencies present in the classpath. Thymeleaf Auto-Configuration simplifies the configuration of Thymeleaf-related beans, making it easy to integrate Thymeleaf into your Spring Boot application without extensive manual setup.

### Steps to Enable Thymeleaf Auto-Configuration:

1. Ensure that you have the Thymeleaf dependency in your pom.xml:
   
```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

2. HTML Templates in src/main/resources/templates:

Thymeleaf looks for templates in the src/main/resources/templates directory by default. Create HTML templates in this directory.

3. Application Properties:

Spring Boot provides sensible default configurations for Thymeleaf. You can customize properties in application.properties if needed. For example:

```
spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html
```

This configuration sets the template prefix and suffix.

# Implementing CRUD with Thymeleaf and Spring 

Thymeleaf allows for seamless use of Spring to easily create CRUD applications through a layer of standard JPA-based CRUD repositories.

## Integrating Thymeleaf with Spring with Maven
```
<parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
</parent>
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-thymeleaf</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
    </dependency>
</dependencies>

```
- Add the following dependencies to your pom.xml file
The other thymeleaf dependencies you need should already be there. 

## Add the Domain Layer
For simplicity’s sake, this layer will include one single class that will be responsible for modeling User entities:


```python
@Entity
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @NotBlank(message = "Name is mandatory")
    private String name;
    
    @NotBlank(message = "Email is mandatory")
    private String email;

    // standard constructors / setters / getters / toString
}
```

## The Repository Layer

Spring Data JPA is a key component of Spring Boot’s spring-boot-starter-data-jpa that makes it easy to add CRUD functionality through a powerful layer of abstraction placed on top of a JPA implementation. This abstraction layer allows us to access the persistence layer without having to provide our own DAO implementations from scratch.

To provide our application with basic CRUD functionality on User objects, we just need to extend the CrudRepository interface:


```python
@Repository
public interface UserRepository extends CrudRepository<User, Long> {}
```

## The Controller Layer

Thanks to the layer of abstraction that spring-boot-starter-data-jpa places on top of the underlying JPA implementation, we can easily add some CRUD functionality to our web application through a basic web tier.

In our case, a single controller class will suffice for handling GET and POST HTTP requests and then mapping them to calls to our UserRepository implementation.

Let’s start with the controller’s showSignUpForm() and addUser() methods.

The former will display the user signup form, while the latter will persist a new entity in the database after validating the constrained fields.

If the entity doesn’t pass the validation, the signup form will be redisplayed.

Otherwise, once the entity has been saved, the list of persisted entities will be updated in the corresponding view:


```python
@Controller
public class UserController {
    
    @GetMapping("/signup")
    public String showSignUpForm(User user) {
        return "add-user";
    }
    
    @PostMapping("/adduser")
    public String addUser(@Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "add-user";
        }
        
        userRepository.save(user);
        return "redirect:/index";
    }

    // additional CRUD methods
}
```

Mapping for the /index URL:


```python
@GetMapping("/index")
public String showUserList(Model model) {
    model.addAttribute("users", userRepository.findAll());
    return "index";
}
```

Within the UserController, we will also have the showUpdateForm() method, which is responsible for fetching the User entity that matches the supplied id from the database.

If the entity exists, it will be passed on as a model attribute to the update form view.

So, the form can be populated with the values of the name and email fields:


```python
@GetMapping("/edit/{id}")
public String showUpdateForm(@PathVariable("id") long id, Model model) {
    User user = userRepository.findById(id)
      .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
    
    model.addAttribute("user", user);
    return "update-user";
}
```

Finally, we have the updateUser() and deleteUser() methods within the UserController class.

The first one will persist the updated entity in the database, while the last one will remove the given entity.

In either case, the list of persisted entities will be updated accordingly:


```python
@PostMapping("/update/{id}")
public String updateUser(@PathVariable("id") long id, @Valid User user, 
  BindingResult result, Model model) {
    if (result.hasErrors()) {
        user.setId(id);
        return "update-user";
    }
        
    userRepository.save(user);
    return "redirect:/index";
}
    
@GetMapping("/delete/{id}")
public String deleteUser(@PathVariable("id") long id, Model model) {
    User user = userRepository.findById(id)
      .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
    userRepository.delete(user);
    return "redirect:/index";
}
```

## Adding the View Layer

Under the src/main/resources/templates folder, we need to create the HTML templates required for displaying the signup form and the update form as well as rendering the list of persisted User entities.

As stated in the introduction, we’ll use Thymeleaf as the underlying template engine for parsing the template files.

Here’s the relevant section of the add-user.html file:
```
<form action="#" th:action="@{/adduser}" th:object="${user}" method="post">
    <label for="name">Name</label>
    <input type="text" th:field="*{name}" id="name" placeholder="Name">
    <span th:if="${#fields.hasErrors('name')}" th:errors="*{name}"></span>
    <label for="email">Email</label>
    <input type="text" th:field="*{email}" id="email" placeholder="Email">
    <span th:if="${#fields.hasErrors('email')}" th:errors="*{email}"></span>
    <input type="submit" value="Add User">   
</form>
```

And here's how the update-user.html file looks like:

```
<form action="#" 
  th:action="@{/update/{id}(id=${user.id})}" 
  th:object="${user}" 
  method="post">
    <label for="name">Name</label>
    <input type="text" th:field="*{name}" id="name" placeholder="Name">
    <span th:if="${#fields.hasErrors('name')}" th:errors="*{name}"></span>
    <label for="email">Email</label>
    <input type="text" th:field="*{email}" id="email" placeholder="Email">
    <span th:if="${#fields.hasErrors('email')}" th:errors="*{email}"></span>
    <input type="submit" value="Update User">   
</form>
```

Finally, we have the index.html file that displays the list of persisted entities along with the links for editing and removing existing ones:

```
<div th:switch="${users}">
    <h2 th:case="null">No users yet!</h2>
        <div th:case="*">
            <h2>Users</h2>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                <tr th:each="user : ${users}">
                    <td th:text="${user.name}"></td>
                    <td th:text="${user.email}"></td>
                    <td><a th:href="@{/edit/{id}(id=${user.id})}">Edit</a></td>
                    <td><a th:href="@{/delete/{id}(id=${user.id})}">Delete</a></td>
                </tr>
            </tbody>
        </table>
    </div>      
    <p><a href="/signup">Add a new user</a></p>
</div>

```

### How to interact with the backend using Thymeleaf
Once you login and gain access to the database edit page, you can use Thymeleaf to interact with the backend, allowing for the creation, updating, and deletion of data from the webpage itself. 

```java

<form class="form-inline" action="#" th:action="@{/mvc/person/create}" th:object="${person}" method="POST">
    <div class="form-group mb-2 mr-sm-2">
        <label for="email">Email:</label>
        <input type="email" th:field="*{email}" id="email">
        <small th:if="${#fields.hasErrors('email')}" th:errors="*{email}">Email Error</small>
    </div>
    <div class="form-group mb-2 mr-sm-2">
        <label for="password">Password:</label>
        <input type="password" th:field="*{password}" id="password">
        <small th:if="${#fields.hasErrors('password')}" th:errors="*{password}">Password Error</small>
    </div>                       
    <div class="input-group mb-2 mr-sm-2">
        <label for="name">Name:</label>
        <input type="text" th:field="*{name}" id="name">
        <small th:if="${#fields.hasErrors('name')}" th:errors="*{name}">Name Error</small>
    </div>
    <div class="input-group mb-2 mr-sm-2">
        <label for="dob">Birth Date:</label>
        <input type="date" th:field="*{dob}" id="dob">
        <small th:if="${#fields.hasErrors('dob')}" th:errors="*{dob}">Birth Date Error</small>
    </div>
    <button type="submit" class="btn btn-primary">Add</button>
</form>
```

The code starts with the form declaration, which uses the Thymeleaf syntax of "th:action" and "th:object". "th:action" is Thymeleaf syntax indicating the form action, which is to send teh data to the specified endpoint. "th:object" binds the form to an object (in this case, the person object), to allow Thymeleaf to automatically populate form fields with the object's properties.

Next is the form fields. The form fields in this case have "th:field", "th:if", and "th:errors". "th:field" binds the input field, in this case, that would be the email. This would make that field collect email data.  "th:if" is a conditional statement, used here to catch errors, particularly validation errors for the email field. "th.errors" returns error messages for the email field for the user to see.

This format is used for the other classes as well, just swapped from email to things like password and name.

For deletion, you can create another button and specify the th:action to be the delete function, as illustrated by the code below:
```
<form class="form-inline" action="#" th:action="@{/mvc/person/create}" th:object="${person}" method="POST">
    <!-- ... existing form fields ... -->
    <button type="button" class="btn btn-danger" th:onclick="deletePerson()">Delete</button>
</form>

<script th:inline="javascript">
    /* Thymeleaf inlined JavaScript for confirmation and form submission */
    function deletePerson() {
        if (confirm('Are you sure you want to delete this person?')) {
            var form = document.forms[0]; // Assuming it's the first form on the page
            form.action = /* Set the URL for delete operation */;
            form.method = 'DELETE'; // Or 'POST' depending on your server-side handling
            form.submit();
        }
    }
</script>
```


# Using jQuery for Asynchronous Requests
Assuming you have a button triggering some action, such as fetching data from the server, you can use jQuery to make an AJAX request to your Spring controller.

Let's say you have a button with the id "getDataBtn" and a div with the id "result" to display the fetched data. An example of implementing this in JQuery would be to add the following script:Add the following jQuery script:


```python
%%html
<script>
    $(document).ready(function() {
        $("#getDataBtn").click(function() {
            $.ajax({
                type: "GET",
                url: "/getdata",  // Adjust the URL based on your Spring controller mapping
                success: function(data) {
                    $("#result").html("Data from server: " + data);
                },
                error: function() {
                    $("#result").html("Error fetching data.");
                }
            });
        });
    });
</script>

```

## How Spring connects and initializes and creates a database

Check PersonAPIController AND PersonVieController
The @Controller annotation is a general-purpose annotation used to mark a class as a Spring MVC controller. It is often used in combination with Thymeleaf for generating dynamic HTML content.
The @RestController annotation is a specialized version of the @Controller annotation. It is typically used for creating RESTful web services where the response is not a view but data (like JSON or XML).
Controller methods are responsible for handling specific HTTP requests. They are annotated with various annotations to specify the type of request they handle (@GetMapping, @PostMapping, etc.). These methods can return different types of responses, such as a view name, a model and view object, or data.

Thymeleaf Templates:

HTML templates (usually residing in the src/main/resources/templates directory) with Thymeleaf expressions for dynamic content.

Annotations for JPA and Hibernate:

@Entity: Indicates that this class is a JPA entity and should be persisted in the database.
@Id: Marks the primary key field.
@GeneratedValue: Specifies the generation strategy for the primary key values.
@Column: Specifies the mapping between the entity attribute and the database column.
@ManyToMany: Defines a many-to-many relationship between entities.

Lombok Annotations:

@Data: Lombok annotation that generates boilerplate code for getters, setters, toString(), and other common methods.
@AllArgsConstructor: Lombok annotation for generating a constructor with all fields.
@NoArgsConstructor: Lombok annotation for generating a no-argument constructor.
@NonNull: Lombok annotation to generate null checks and constructor parameters.
Other Annotations and Types:

@Convert: Specifies a converter for a persistent attribute.
@JdbcTypeCode and @Column(columnDefinition = "jsonb"): Used for handling JSON data types in the database.
@DateTimeFormat: Specifies the format for a Date attribute.
Static Test Data Initialization: The init() method is used to create static test data (an array of Person objects).
Main Method:

The main method demonstrates the initialization of test data and prints the objects using an enhanced for loop.
- Create (C): Creating a new record in the database involves saving a new instance of the entity.
In this example, the createPerson method is a REST endpoint that receives a JSON representation of a Person object in the request body. It then saves the new person using the personRepository.save(person) method.
```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PersonController {

    @Autowired
    private PersonRepository personRepository;

    // Handles POST requests to create a new person
    @PostMapping("/persons")
    public Person createPerson(@RequestBody Person person) {
        return personRepository.save(person);
    }
}

```
- Read (R):
Reading data from the database involves retrieving records based on certain criteria.
```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PersonController {

    @Autowired
    private PersonRepository personRepository;

    // Handles GET requests to retrieve a person by ID
    @GetMapping("/persons/{id}")
    public Person getPersonById(@PathVariable Long id) {
        return personRepository.findById(id).orElse(null);
    }
}
```
The getPersonById method is a REST endpoint that retrieves a person by their ID using the personRepository.findById(id) method.

- Update (U):
Updating an existing record involves modifying the attributes of an existing entity.
```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PersonController {

    @Autowired
    private PersonRepository personRepository;

    // Handles PUT requests to update a person by ID
    @PutMapping("/persons/{id}")
    public Person updatePerson(@PathVariable Long id, @RequestBody Person updatedPerson) {
        Person existingPerson = personRepository.findById(id).orElse(null);

        if (existingPerson != null) {
            existingPerson.setName(updatedPerson.getName());
            existingPerson.setEmail(updatedPerson.getEmail());
            // Update other attributes as needed
            return personRepository.save(existingPerson);
        }

        return null; // Or handle not found scenario
    }
}
```

- Delete (D):

Deleting a record involves removing it from the database.


```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PersonController {

    @Autowired
    private PersonRepository personRepository;

    // Handles DELETE requests to delete a person by ID
    @DeleteMapping("/persons/{id}")
    public void deletePerson(@PathVariable Long id) {
        personRepository.deleteById(id);
    }
}

```
The deletePerson method is a REST endpoint that deletes a person by their ID using the personRepository.deleteById(id) method.
