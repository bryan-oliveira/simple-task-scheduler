# Simple Task Scheduler

This repository contains a REST web application written in Ruby on Rails that allows to schedule tasks. It was written for an interview in which 3 days were given to devise a REST Task Scheduler application.

## Database creation and initialization

To create database:

```rails db:migrate```

This creates a fresh copy of the database with all the tables used. 

To seed the database with random information:

```rails db:seed```

## Steps to prepare source code

To start the server run

```rails s```

A local server on localhost:3000 will start

## Assumptions made and missing requirements

Since all there was to work with were the requirements specifications, there
were details to be decided upon that naturally were based on assumptions,
educated guesses or personal perspective.

From the contradicting points:
  "Create an agent/server application, which will execute tasks in client side"
  "Server which will execute the task"

It was unclear who would execute the task. I opted for the server in order to
keep all information centralized in one place. Consequently, the agents can
perform CRUD tasks (both through the web application and REST web service).

Another issue was authentication. Based on:

  "When installing the agent, it will provide a key to the server, this key will
  link server-task"

the exact authentication mecanism was unclear to me. Nonetheless, most of the
groundwork for a stateless token-based authentication mecanism is layed. The
code to enable it is in place, however, some refactoring must be done, and also
application design must be rethought to accomodate for this feature.

The functional specifications demand that the application execute and schedule
tasks. I have only provisioned for the scheduling. The server does not execute
the inserted tasks. Nonetheless, both task scheduling and extensive logging
are fully functional.

Although the specifications did not provision for tests. A test suite is included.
Unit tests and integration tests can be performed to ensure the proper functioning
of the server. Also, TDD was used for some of the development.

Some additional requirements are the addition of API documentation. Following REST
standards, is is accessible by a GET to '<host>/api/v1/'. The addition of the
Twitter bootstrap CSS framework. Design was not part of the requirements, but
a little design always goes a long way. An additional entity was used to model
task logs. Therefore, each individual execution triggers a new task log complete
with detailed information about its execution. And because they are linked
with a task, it is possible to view all logs for a particular task, not just
a list of most recent logs.



In conclusion, it was a great project to work on. After submission I must
finish the application and polish some edges but overall I am happy with
the outcome. Had I had another couple of days to work on it, a working
application with the finished secure authentication and also task execution
would have been completed.
