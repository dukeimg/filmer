# Filmer

Filmer is an open-source RoR application which allows you to create interactive photo stories. It's all free and created for education purposes.

Currently it uses:

* Ruby 2.2.3
* Rails 4.2.5
* Material Design Lite
* Devise
* AngularJS

# How to try it localy

1. Fork it!
2. Clone it
3. Run
    `bundle install`
4. Reconfigure
    `/config/environments/production.rb`
if you're going to run production enviroment
5. Reconfigure
    `/config/database.yml`
to use Filmer with your database
6. Set up your S3
7. Run
    `bundle exec figaro install`
8. Go to
    `config/application.yml`
and add following:
<code>
    S3_BUCKET_NAME: 'Your value here'
    AWS_ACCESS_KEY_ID: 'Your value here'
    AWS_SECRET_ACCESS_KEY: 'Your value here'
    email: 'Email for mailer in production'
    password: 'password for mailer in production'
</code>
9. If using postgresql, run
    `rake db:create:all`
10. Run
    `rake db:migrate`
11. Run
    `sudo apt-get install imagemagick -y`
to install ImageMagic

Done.