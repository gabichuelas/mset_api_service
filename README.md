# MSET API Service

This Sinatra application serves as a back-end microservice for [MSET](https://github.com/gabichuelas/mset_app), an application for medication users to track side effects and symptoms in order to better inform and take control of their medical treatment. This microservice is responsible for making API calls to an [OpenFDA API](https://open.fda.gov/apis/) via `GET` requests that return information about various medications and their side effects. The front-end app consumes those endpoints via this Sinatra app, parses through the responses and formats the data for display on the front-end and to be saved as needed in the database.

You may explore the MSET application, the front-end of this microservice, via [Heroku](https://mset-api-service.herokuapp.com/) - or to launch it via your local server, following [these](https://github.com/gabichuelas/mset_app#implementation) set-up instructions.

<img width="958" alt="App architecture" src="https://user-images.githubusercontent.com/62635544/93505433-178d9300-f8d8-11ea-8b65-afb599e98ec3.png">

## Local set up
* Clone down repo
* Run `bundle install`
* Run `rackup` to launch local server

## Notes for using with [MSET Rails App](https://github.com/gabichuelas/mset_app)
**To run Sinatra Service locally:**
* `mset_api_service` Should be running on `port:9292`
* Corresponding `mset_app` in rails is using `localhost:9292` to connect to this service; adjust accordingly if needed in `mset_app/app/services/mset_service.rb` class


## Contributors
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


## Endpoint Documentation [![Run in Postman](https://run.pstmn.io/button.svg)](https://www.getpostman.com/collections/5595b65121a77cfc7378)

These endpoints can be consumed via the deployed application or via your local server:
* Calls to the Heroku site should be prepended with `https://mset-app.herokuapp.com`
* Calls to the microservice when launched via your local server should be prepended with `https://localhost:9292`


### Medication Search endpoint:
**GET /med_search/<medication_brand_name>**
```
{
"meta": {
"disclaimer": "Do not rely on openFDA to make decisions regarding medical care. While we make every effort to ensure
that data is accurate, you should assume all results are unvalidated. We may limit or otherwise restrict your access to
the API in line with our Terms of Service.",
"terms": "https://open.fda.gov/terms/",
"license": "https://open.fda.gov/license/",
"last_updated": "2020-09-17",
"results": {
"skip": 0,
"limit": 10,
"total": 13
}
},
"results": [
{
"product_ndc": "54092-381",
"generic_name": "Dextroamphetamine Sulfate, Dextroamphetamine Saccharate, Amphetamine Sulfate and Amphetamine
Aspartate",
"labeler_name": "Shire US Manufacturing Inc.",
"dea_schedule": "CII",
"packaging": [
{
"marketing_start_date": "20020522",
"package_ndc": "54092-381-01",
"description": "100 CAPSULE, EXTENDED RELEASE in 1 BOTTLE (54092-381-01)",
"sample": false
}
],
"brand_name_suffix": "XR",
"brand_name": "Adderall XR",
...
}
```

### Symptom Search endpoint:
**GET /sym_search/<product_ndc>**
_Product NDC can be accessed by searching for a medication name via the Medication Search endpoint, which returns a medication's Product NDC in the response_
_Symptoms and side effects can be accessed via the `adverse_reactions_table` and can be parsed using Nokogiri_
```
{
"meta": {
"disclaimer": "Do not rely on openFDA to make decisions regarding medical care. While we make every effort to ensure
that data is accurate, you should assume all results are unvalidated. We may limit or otherwise restrict your access to
the API in line with our Terms of Service.",
"terms": "https://open.fda.gov/terms/",
"license": "https://open.fda.gov/license/",
"last_updated": "2020-09-17",
"results": {
"skip": 0,
"limit": 1,
"total": 1
}
},
"results": [
{
"effective_time": "20190717",
...
...
"adverse_reactions_table": [
	"<table width=\"65%\">
		<caption>Table 1 Adverse Reactions Reported by 2% or More of Children (6-12 Years Old) Receiving ADDERALL XR
			with Higher Incidence Than on Placebo in a 584-Patient Clinical Study</caption>
		<col width=\"34%\" align=\"left\" valign=\"top\" />
		<col width=\"28%\" align=\"left\" valign=\"top\" />
		<col width=\"22%\" align=\"left\" valign=\"top\" />
		<col width=\"16%\" align=\"left\" valign=\"top\" />
		<thead>
			<tr>
				<th styleCode=\"Lrule Rrule\">Body System</th>
				<th styleCode=\"Rrule\">Preferred Term</th>
				<th styleCode=\"Rrule\">ADDERALL XR (n=374)</th>
				<th styleCode=\"Rrule\">Placebo (n=210)</th>
			</tr>
  ...
],
...
}
```
