class @ContextIOClient
  ContextIO = Npm.require('contextio')
  @instance: null

  client: null
  key: null
  secret: null

  constructor: (key, secret)->
    @key = key
    @secret = secret

    @client = new ContextIO.Client
      key: key
      secret: secret

    ContextIOClient.instance = @

  createAccount: ()->


  @get: (key, secret)->
    if ContextIOClient.instance?
      return ContextIOClient.instance

    key ?= Meteor.settings.services.contextio.key
    secret ?= Meteor.settings.services.contextio.secret

    ContextIOClient.instance ?= new ContextIOClient(key, secret)
    ContextIOClient.instance


Cio = ContextIOClient.get()