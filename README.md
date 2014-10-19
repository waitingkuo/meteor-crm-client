# Meteor CRM

Tracking your users in the Meteor way

### Website (Dashboard)
http://meteorcrm.meteor.com

### Demo Account:
demo@meteorcrm.io / demo1234

### Demo Site
http://meteorcrm-telescope.meteor.com


### P.S.
We're still in alpha 0.1, dont use in production


# Installation

    meteor add waitingkuo:meteor-crm-client

# Usage

Register in http://meteorcrm.meteor.com

Get the apiToken in the setting page, http://meteorcrm.meteor.com/setting

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

