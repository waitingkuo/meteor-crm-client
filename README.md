# Meteor CRM

Tracking your users in the Meteor way

P.S. We're still in alpha 0.1, dont use in production

# Installation

    meteor add waitingkuo:meteor-crm-client

# Usage

Register in http://meteorcrm.meteor.com
Get the apiToken

Add followings to your settings.json

    {
        "public": {
            "meteorCrm": {
                "apiToken": YOUR_API_TOKEN
            }   
        }
    }
  

Then run your meteor by

    meteor --settings settings.json


By default, user login event will be tracked. If you want to add customized event, you can use

    Crm.track(eventName);

