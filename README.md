# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

ruby '2.6.1'

* System dependencies

materialize gem 
jQuery 
in rails 6 there isnt a jQuery gem anymore 
instead we have to manipulate the files in the asset pipeline for it to render
 follow the instructions below or look at notes.txt file to connect jQuery to the rails app
 I have done most of the work but if your pulling off an older commit you might have to manually set it up

* Configuration

go to app/stylesheet/application.css erase everything in there if ur starting a new rails app this file is usually called application.scss in the asset pipeline

@import url(materialize-css/dist/css/materialize); this is the only line that should be inside of app/javascript/stylesheets/application.css this file is a file we create if ur runing a new rails app 

check environment.js it should only have this in there

const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
    // popper: ['popper.js', 'default']
  })
)

module.exports = environment



run this in the terminal yarn install --check-files 

if u get an error check package.jason file
it should look like this 
{
  "name": "e_haggel",
  "private": true,
  "dependencies": {
    "@rails/actioncable": "^6.0.0",
    "@rails/activestorage": "^6.0.0",
    "@rails/ujs": "^6.0.0",
    "@rails/webpacker": "4.2.2",
    "jquery": "^3.5.1",
    "materialize": "^1.0.0",
    "materialize-css": "^1.0.0",
    "popper.js": "^1.16.1",
    "turbolinks": "^5.2.0"
  },
  "version": "0.1.0",
  "devDependencies": {
    "webpack-dev-server": "^3.11.0"
  }
}
u can have bootstrap or another css framework instead of materialize (u just have to add it with yarn or see the documentation)
if u have wrong version of jquery inside of package.json remove it and update like the above
also if you triggering javascript for dopdowns you have to write it inside of the app/javascript/packs/application.js

* Database creation

run rails db:migrate to migrate the database 

* Database initialization

might have to add active-storage 

* How to run the test suite

rails test 

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
run rails s to start the server

Questions 
email me at aniss.marrouch@gmail.com

# e-haggle-update
