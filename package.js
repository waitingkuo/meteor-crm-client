Package.describe({
    name: 'waitingkuo:meteor-crm-client',
    summary: 'Meteor CRM in the Meteor way',
    version: '0.0.1',
    git: 'https://github.com/waitingkuo/meteor-crm-client.git'
});

Package.onUse(function(api) {


  api.versionsFrom('METEOR@0.9.0');
  api.use(['coffeescript', 'iron:router@0.9.4', 'ddp', 'tracker'], 'client');
  api.addFiles('meteor-crm.coffee', 'client');
  api.export('Crm', 'client');

});
