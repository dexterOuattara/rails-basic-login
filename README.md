# README
#Basic login system with Ruby and Rails + Devices auth + Bootstrap


**Please find here the simple process to use the project**

**I / First Step : Start the project**

* 1 Git clone https://github.com/dexterOuattara/rails-basic-login.git
* 2 Run : bundle install
* 3 Run : rails db:migrate
* 4 Run : rails s

***
* II / Second Step : Customize the login system 

* 1 Add table on your User migration https://guides.rubyonrails.org/active_record_migrations.html
  
* 2 Go to rails-basic-login/app/views/devise/registrations/new.html.erb
add the field for your project 
  
* 3 Edit the Application Controller https://github.com/dexterOuattara/rails-basic-login/blob/main/app/controllers/application_controller.rb

and add the different field.


Dev Environment:

* Ruby version
  ruby '2.7.2'

* System dependencies
  gem 'devise'
  
