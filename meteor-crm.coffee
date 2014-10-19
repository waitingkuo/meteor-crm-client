Crm = {}

Crm.ddp = DDP.connect 'meteorcrm.meteor.com'

Crm.load = (apiToken) ->
  # should add more verify functions
  @apiToken = apiToken
  if not @apiToken?
    console.log '[MeteorCRM] Missing apiToken'
    return
  @ddp.call 'init', @apiToken

#Crm.reload = ->

Crm.identify = (userId, properties) ->
  if not @apiToken? 
    return
  @userId = userId
  @ddp.call 'identify', @apiToken, userId, properties
  #@lastUserId = userId

Crm.track = (eventName, properties) ->
  if not @apiToken? 
    return
  # Should provide a way to track anonymous users
  if @userId
    @ddp.call 'track', @apiToken, @userId, eventName, properties

Crm.pageView = () ->
  if not @apiToken? 
    return
  url = document.URL
  if url isnt @lastPageView
    Crm.track 'pageView',
      url: url
  @lastPageView = document.URL
  

Meteor.startup ->
  apiToken = Meteor.settings?.public?.meteorCrm?.apiToken
  Crm.load apiToken

  Tracker.autorun ->
    if Meteor.user() and not Meteor.loggingIn()

      # userId
      userId = Meteor.userId()

      # email
      email = Meteor.user().emails?[0]?.address
      properties = {}
      if email?
        properties.email = email

      Crm.identify userId, properties

      if userId isnt Crm.lastUserId
        Crm.track 'login', {}

      Crm.lastUserId = userId

  Router.onAfterAction ->
    Tracker.nonreactive ->
      Crm.pageView()
