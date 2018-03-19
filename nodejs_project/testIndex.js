var bodyParser = require('body-parser');
var express = require('express');
var fs = require('fs');
var path = require('path');
var Themeparks = require('themeparks');
var url = require('url');

var app = express();

var port = (process.env.PORT || 5000);

// list all the parks supported by the library
for (var park in Themeparks.Parks) {
    console.log("* " + new Themeparks.Parks[park]().Name + " (DisneyAPI." + park + ")");
}

// access a specific park
var disneyMagicKingdom = new Themeparks.Parks.WaltDisneyWorldAnimalKingdom();

// access wait times by Promise
disneyMagicKingdom.GetWaitTimes().then(function(rides) {
    // print each wait time
    for(var i=0, ride; ride=rides[i++];) {
        console.log(ride.name + ": " + ride.waitTime + " minutes wait");
  //      console.log(ride);
    }
}, console.error);

// get park opening times
disneyMagicKingdom.GetOpeningTimes().then(function(times) {
    // print opening times
    for(var i=0, time; time=times[i++];) {
        if (time.type == "Operating") {
            console.log("[" + time.date + "] Open from " + time.openingTime + " until " + time.closingTime);
        }
    }
}, console.error);
