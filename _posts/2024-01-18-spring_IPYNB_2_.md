---
layout: post
title: Spring POST Lesson
description: Our Spring POST Lesson with Database Definitions.
courses: {'csa': {'week': 18}}
type: lessons
---

# UML Backend Diagram

Link to IMG: https://ibb.co/dmJMqJD

## SPRING POST

# Comprehensive Guide to RESTful API Methods and HTTP Status Codes for Users


## RESTful API Methods for Users

### 1. GET: /users
- **Description:** Retrieve a list of users from the system.
- **Example Request:** `GET /users`
- **Example Response:** A successful response with a status code of 200 OK will include a JSON array containing details of multiple users.

### 2. GET: /users(id)
- **Description:** Fetch a single user by their unique identifier (ID).
- **Example Request:** `GET /users/123` --> This is the ID
- **Example Response:** A successful response (status code 200 OK) will contain a JSON object representing the user with ID 123.

### 3. POST: /users
- **Description:** Create a new user in the system.
- **Example Request:** To add a new user, send a `POST` request to `/users` with a JSON payload containing the necessary user information.
- **Example Response:** A successful response (status code 200 OK) will include a JSON object representing the newly created user.

### 4. PUT: /users(id)
- **Description:** Update an existing user identified by their ID.
- **Example Request:** To modify user details, send a `PUT` request to `/users/123` with a JSON payload containing the updated information.
- **Example Response:** A successful response (status code 200 OK) will include a JSON object representing the user with updated details.

### 5. DELETE: /users(id)
- **Description:** Remove a user from the system based on their ID.
- **Example Request:** To delete a user, send a `DELETE` request to `/users/123`.
- **Example Response:** A successful response (status code 200 OK) may include a message confirming the deletion.

## HTTP Status Codes

### 1. 200 OK
- **Description:** The request was successful, and the server returns the requested data.
- **Example Usage:** After a successful GET, POST, PUT, or DELETE operation, the server responds with a 200 OK status code.

### 2. 400 Bad Request
- **Description:** The server cannot understand the request, often due to malformed syntax or missing parameters.
- **Example Usage:** If the request is incorrectly formatted or lacks required information, the server responds with a 400 Bad Request status code.

### 3. 404 Not Found
- **Description:** The requested resource (user) could not be found on the server.
- **Example Usage:** When attempting to GET, PUT, or DELETE a user who does not exist, the server responds with a 404 Not Found status code.

### 4. 500 Internal Server Error
- **Description:** A generic error message indicating that an unexpected condition was encountered on the server.
- **Example Usage:** If the server encounters an unexpected issue, such as a bug or unhandled exception, it responds with a 500 Internal Server Error status code.




```Java
@Controller
@RequestMapping("/mvc/person")
public class PersonViewController {
    // Autowired enables Control to connect HTML and POJO Object to database easily for CRUD
    @Autowired
    private PersonDetailsService repository;

    @GetMapping("/read")
    public String person(Model model) {
        List<Person> list = repository.listAll();
        model.addAttribute("list", list);
        return "person/read";
    }

    /*  The HTML template Forms and PersonForm attributes are bound
        @return - template for person form
        @param - Person Class
    */
    @GetMapping("/create")
    public String personAdd(Person person) {
        return "person/create";
    }

    /* Gathers the attributes filled out in the form, tests for and retrieves validation error
    @param - Person object with @Valid
    @param - BindingResult object
     */
    @PostMapping("/create")
    public String personSave(@Valid Person person, BindingResult bindingResult) {
        // Validation of Decorated PersonForm attributes
        if (bindingResult.hasErrors()) {
            return "person/create";
        }
        repository.save(person);
        repository.addRoleToPerson(person.getEmail(), "ROLE_STUDENT");
        // Redirect to next step
        return "redirect:/mvc/person/read";
    }

    @GetMapping("/update/{id}")
    public String personUpdate(@PathVariable("id") int id, Model model) {
        model.addAttribute("person", repository.get(id));
        return "person/update";
    }

    @PostMapping("/update")
    public String personUpdateSave(@Valid Person person, BindingResult bindingResult) {
        // Validation of Decorated PersonForm attributes
        if (bindingResult.hasErrors()) {
            return "person/update";
        }
        repository.save(person);
        repository.addRoleToPerson(person.getEmail(), "ROLE_STUDENT");

        // Redirect to next step
        return "redirect:/mvc/person/read";
    }

    @GetMapping("/delete/{id}")
    public String personDelete(@PathVariable("id") long id) {
        repository.delete(id);
        return "redirect:/mvc/person/read";
    }

    @GetMapping("/search")
    public String person() {
        return "person/search";
    }

}
```

# Introduction to Databases and JSONB

## Databases and Complex Data Storage

- **Overview of Databases**: 
  - Databases are essential in storing, retrieving, and managing data.
  - They support a range of data types and structures, from simple to complex.

- **Need for Storing Complex Data**:
  - Modern applications often require the storage of nested, non-uniform data.
  - Traditional database structures can be limiting when dealing with dynamic or hierarchical data.

# Understanding JSONB

## Definition and Characteristics of JSONB

- **What is JSONB?**
  - JSONB stands for JSON Binary.
  - It is a specialized data format used in PostgreSQL and other SQL databases to store JSON (JavaScript Object Notation) documents in a binary, efficient form.

- **Key Characteristics**:
  - **Binary Format**: Unlike standard JSON, JSONB is stored in a decomposed binary format.
  - **Indexing**: Allows for the creation of GIN (Generalized Inverted Index) indexes, enhancing search capabilities.

## Comparison with Traditional JSON

- **Performance**:
  - JSONB offers faster processing (e.g., search, retrieval) as it avoids reparsing the data, unlike textual JSON storage.
- **Flexibility**:
  - While JSONB consumes slightly more disk space, it provides significantly more flexibility in querying and manipulating data.

- **Use Cases for JSONB**:
  - Ideal for storing dynamic or unstructured data.
  - Beneficial when frequent read and write operations are performed on the JSON data.

# Storing HashMaps with JSONB

## Practical Example: Storing User Stats as a Nested JSONB Structure

- **Scenario**: Storing diverse user statistics where the structure can vary for each user.

## Java Code Example

```java
import java.util.HashMap;
import java.util.Map;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Convert;
import org.hibernate.annotations.Type;

@Entity
public class UserStats {

    @Id
    private Long id;

    @Type(type = "jsonb")
    @Column(columnDefinition = "jsonb")
    private Map<String, Map<String, Object>> stats = new HashMap<>();

    // Standard getters and setters
}

# Integration with Java Backend

## POJO and Database Interaction

- **What is a POJO?**
  - POJO stands for Plain Old Java Object.
  - It's a Java object not bound by any restriction other than those forced by the Java Language Specification.

- **Role in Database Interaction**:
  - POJOs are used to encapsulate data and represent database entities in object-oriented programming.
  - They interact with databases through Object-Relational Mapping (ORM) frameworks like Hibernate.

#### Defining a POJO with JSONB Field

```java
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Convert;
import java.util.Map;
import java.util.HashMap;
import org.hibernate.annotations.Type;

@Entity
public class User {

    @Id
    private Long id;

    @Type(type = "jsonb")
    @Column(columnDefinition = "jsonb")
    private Map<String, Map<String, Object>> additionalProperties = new HashMap<>();

    // Standard getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Map<String, Map<String, Object>> getAdditionalProperties() {
        return additionalProperties;
    }

    public void setAdditionalProperties(Map<String, Map<String, Object>> additionalProperties) {
        this.additionalProperties = additionalProperties;
    }
}
```

## Introduction to JPA

- **What is JPA?**
  - JPA stands for Java Persistence API.
  - It's a specification for accessing, persisting, and managing data between Java objects and a relational database.

- **JPA in Database Operations**:
  - JPA allows developers to define database tables with Java classes.
  - Provides a set of annotations to map Java objects to database tables.

### Using JPA Repository

```java
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByLastName(String lastName);
    Optional<User> findByEmail(String email);
    List<User> findByAgeGreaterThan(int age);
}
```

# CRUD Operations with JSONB

## Detailed Guide on CRUD Operations

- **Create, Read, Update, Delete (CRUD)**:
  - These are the four basic functions of persistent storage in applications.
  - JSONB fields can be integrated into CRUD operations for enhanced data handling.

## Java Code Examples for CRUD Operations

```java
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

public class UserStatsService {

    @PersistenceContext
    private EntityManager entityManager;

    // Create
    @Transactional
    public void createUserStat(UserStats userStat) {
        entityManager.persist(userStat);
    }

    // Read
    public UserStats getUserStat(Long id) {
        return entityManager.find(UserStats.class, id);
    }

    // Update
    @Transactional
    public void updateUserStat(Long id, Map<String, Map<String, Object>> newStats) {
        UserStats userStat = getUserStat(id);
        if (userStat != null) {
            userStat.setStats(newStats);
            entityManager.merge(userStat);
        }
    }

    // Delete
    @Transactional
    public void deleteUserStat(Long id) {
        UserStats userStat = getUserStat(id);
        if (userStat != null) {
            entityManager.remove(userStat);
        }
    }
}


# Example Code with all Rest API Methods


```Java
// User model class representing the user entity
public class User {
    private Long id;
    private String username;
    private String email;
    // other fields, getters, setters
}

// UserController class handling user-related API requests
@RestController //handles HTTP requests and produces JSON responses.
@RequestMapping("/users")
public class UserController {

    // Service for handling user-related operations
    @Autowired
    private UserService userService;

    // GET: Retrieve a list of users (read)
    @GetMapping
    public ResponseEntity<List<User>> getUsers() {
        List<User> users = userService.getAllUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    // GET: Fetch a single user by ID (read)
    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    // POST: Create a new user (Create)
    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User newUser) {
        User createdUser = userService.createUser(newUser);
        return new ResponseEntity<>(createdUser, HttpStatus.CREATED);
    }

    // PUT: Update an existing user by ID (Update)
    @PutMapping("/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User updatedUser) {
        User user = userService.updateUser(id, updatedUser);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    // DELETE: Remove a user by ID (Delete)
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return new ResponseEntity<>("User deleted successfully", HttpStatus.OK);
    }
}

// UserService interface defining user-related operations
public interface UserService { //declares all 5 methods of CRUD
    List<User> getAllUsers();
    User getUserById(Long id);
    User createUser(User user);
    User updateUser(Long id, User updatedUser);
    void deleteUser(Long id);
}
```

### User Class (Model):
- Represents the user entity with fields such as id, username, and email.
- Follows the standard Java Bean conventions with private fields and public getters and setters.

### UserController Class (Controller):
- Handles API requests related to users.
- Annotated with @RestController to indicate that it handles HTTP requests and produces JSON responses.
- Defines various endpoints (/users, /users/{id}) for CRUD (Create, Read, Update, Delete) operations on users.
- Utilizes UserService for handling business logic.

### UserServiceImpl Class (Service):
- Implements the UserService interface.
- Maintains an in-memory list of users.
- Implements methods to perform operations like getting all users, getting a user by ID, creating, updating, and deleting users.

### Endpoints:
- GET /users: Retrieves a list of all users.
- GET /users/{id}: Fetches a single user by ID.
- POST /users: Creates a new user.
= PUT /users/{id}: Updates an existing user by ID.
= DELETE /users/{id}: Deletes a user by ID.

### HTTP Responses:
- Responses are wrapped in ResponseEntity objects with appropriate HTTP status codes.
- For example, successful creation returns 201 Created, successful update returns 200 OK, and successful deletion returns 200 OK.
