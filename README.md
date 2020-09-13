# MSET API Service - Sinatra
[Heroku Link](https://mset-api-service.herokuapp.com/)

## To Use
* Clone down repo
* Run `bundle install`
* Run `rackup` to launch local server

## Notes for using with [MSET Rails App](https://github.com/gabichuelas/mset_app)
**To run Sinatra Service locally:**
* `mset_api_service` Should be running on `port:9292`
* Corresponding `mset_app` in rails is using `localhost:9292` to connect to this service; adjust accordingly if needed in `mset_app/app/services/mset_service.rb` class

