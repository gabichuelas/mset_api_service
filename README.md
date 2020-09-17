# MSET API Service

This Sinatra application serves as a back-end microservice for [MSET](https://github.com/gabichuelas/mset_app), an application for medication users to track side effects and symptoms in order to better inform and take control of their medical treatment. This microservice is responsible for making API calls to an [OpenFDA API](https://open.fda.gov/apis/) via `GET` requests that return information about various medications and their side effects. The front-end app consumes those endpoints via this Sinatra app, parses through the responses and formats the data for display on the front-end and to be saved as needed in the database.

You may explore the MSET application, the front-end of this microservice, via [Heroku](https://mset-api-service.herokuapp.com/) - or to launch it via your local server, following [these](https://github.com/gabichuelas/mset_app#implementation) set-up instructions.

<img width="958" alt="App architecture" src="https://user-images.githubusercontent.com/62635544/93505433-178d9300-f8d8-11ea-8b65-afb599e98ec3.png">

## Set up
* Clone down repo
* Run `bundle install`
* Run `rackup` to launch local server

## Notes for using with [MSET Rails App](https://github.com/gabichuelas/mset_app)
**To run Sinatra Service locally:**
* `mset_api_service` Should be running on `port:9292`
* Corresponding `mset_app` in rails is using `localhost:9292` to connect to this service; adjust accordingly if needed in `mset_app/app/services/mset_service.rb` class

## Endpoint Documentation


### Contributors
- Gaby Mendez
  - [Github](https://github.com/gabichuelas)
  - [LinkedIn](https://www.linkedin.com/in/gabymendez/)
- Ruthie Rabinovitch
  - [Github](https://github.com/rrabinovitch)
  - [LinkedIn](https://www.linkedin.com/in/ruthie-r/)
- Jessye Ejdelman
  - [Github](https://github.com/ejdelsztejn)
  - [LinkedIn](https://www.linkedin.com/in/jessye-ejdelman/)
- Michael Evans
  - [Github](https://github.com/michaeljevans)
  - [LinkedIn](https://www.linkedin.com/in/michaeljamesevans/)

**Acknowledgments**

Our instructors during Module 3 at Turing School:
Ian Douglas and Dione Wilson
