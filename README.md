# CourseSelect(en) 

## Introduction

This sample system is an extended english version of CourseSelect [Original Version](https://github.com/PENGZhaoqing/CourseSelect), which is developed for the UCAS master course (Senior Software Engineering). Aiming to help beginners to learn RoR (Ruby on Rails).
Based on this, beginners can add more function:

* Deal with course conflict and control the student number
* Count credit points, degree course, etc.
* Add the function of opening and closing the selective courses system.
* Customize administrator backstage
* Authorized login based on OAuth
* Data input in Excel format
* Bind user’s mailbox (to achieve the function of register activation,forgot password, etc.)
* Search and retrieval within the site (such as searching courses 
* according to the classification)

## Another Motivation 

This app extends the original CourseSelect with OAuth Interaction, which aimed to demonstrate the interaction beetween [UcasPortal](https://github.com/PENGZhaoqing/UcasPortal) and other web application with OAuth 2.0 protocol. 

[UcasPortal](https://github.com/PENGZhaoqing/UcasPortal) is a campus portals information system developed to provide as unified access entrance for the faculties, students and campus application developers. Because of the popularity of utilizing  OAuth 2.0, UcasPortal can communicate with pervasive web applications, which were supported by various languages such as python, php, ruby and so on.

And This app is a rails sample web app written by ruby, which could show how the UcasPortal works with ruby apps

## Dependencies

We are currently using :

* [omniauth-oauth2](https://github.com/intridea/omniauth-oauth2) for OAuth Interaction
* [Rails_admin](https://github.com/sferik/rails_admin) for back-stage management
* [postgresql](http://postgresapp.com/) for database

You have to install Bundle, Gem, Ruby, Rails.. dependences before you use

Please install [postgresql](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup) according to you local system environment, and run `psql -h localhost` to test your database


## Installation

run the following code in terminal of Mac OS or Linux 

```
$ git clone https://github.com/PENGZhaoqing/UcasPortal_SampleApp
$ cd UcasPortal_SampleApp
$ bundle install
$ rake db:migrate
$ rake db:seed
$ rails server
```

type `localhost:3000` in your broswer to visit the home page

## Usage

1.Student Login

account:`student1@test.com`

password:`password`

2.Teacher Login

account:`teacher1@test.com`

password:`password`

3.Admin Login

account:`admin@test.com`

password:`password`

the number in account can be replaced by 2,3... and so on

## Test

This project included some test (such as integeration/fixture/model test), the test file is in `/test`, please run test with `rake test`

```
PENG-MacBook-Pro:UcasPortal_SampleApp PENG-mac$ rake test
Run options: --seed 15794

# Running:
.........

Finished in 1.202169s, 7.4865 runs/s, 16.6366 assertions/s.

9 runs, 20 assertions, 0 failures, 0 errors, 0 skips
```


## How to contribute

Fork this repertory first, modify it in branch, and pull request back to master. 

If you have any questions, do not hesitate to create issues. And welcome contributors

If you think good of this repertory, star it ~



