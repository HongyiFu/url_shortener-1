Url Shortener Rspec Assessment
===============================


1) Bundle install all gems
```
$ bundle install
```


2) Create database
```
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```


3) Open a new terminal and execute Guard:
```
$ bundle exec guard
```
Apparently Ruby 2.4 doesn't work (not tested though), so run below in terminal (at app root path) to revert to 2.3.3.
$ rbenv install 2.3.3
$ rbenv local 2.3.3