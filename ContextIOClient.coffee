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

  createAccount: (primaryEmailAddress, firstName, lastName, cb)->
    expect(primaryEmailAddress).to.be.a('string')
    expect(firstName).to.be.a('string')
    expect(lastName).to.be.a('string')
    params = {email: primaryEmailAddress, first_name: firstName, last_name: lastName}
    result = @callAsyncOrSync(@client.accounts().post,params,cb)

    result

  # Shared method to choose whether to do an Async o
  # Sync call the the specified function
  callAsyncOrSync: (func,params,cb)->
    result = null
    if not cb
      asyncFunc = Meteor.wrapAsync(func)
      result = asyncFunc params
    else
      func params, cb
    result

  @get: (key, secret)->
    if ContextIOClient.instance?
      return ContextIOClient.instance

    key ?= Meteor.settings.services.contextio.key
    secret ?= Meteor.settings.services.contextio.secret

    ContextIOClient.instance ?= new ContextIOClient(key, secret)
    ContextIOClient.instance


Cio = ContextIOClient.get()