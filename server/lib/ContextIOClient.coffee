class @ContextIOClient
  ContextIO = Npm.require('contextio')
  @instance: null

  client: null
  key: null
  secret: null
  callbackUrl: null

  constructor: (key, secret, callbackUrl)->
    @key = key
    @secret = secret
    @callbackUrl = callbackUrl

    @client = new ContextIO.Client
      key: key
      secret: secret
      callbackUrl: callbackUrl

    ContextIOClient.instance = @

  createAccount: (primaryEmailAddress, firstName, lastName, cb)->
    expect(primaryEmailAddress).to.be.a('string')
    expect(firstName).to.be.a('string')
    expect(lastName).to.be.a('string')
    params = {email: primaryEmailAddress, first_name: firstName, last_name: lastName}
    result = @callAsyncOrSync(@client.accounts().post, params, cb)

    result

  # Retrieves full object response of accounts/{id}/connect_tokens
  addMailbox: (accountId, cbURL, cb)->
    expect(accountId).to.be.an('string')
    callbackURL = @callbackUrl
    callbackURL ?= cbURL
    expect(callbackURL).to.be.an('string')

    params = {callback_url: callbackURL}
    result = @callAsyncOrSync(@client.accounts(accountId).connectTokens().post, params, cb)
    result

  # Retrieves only browser_redirect_uri of accounts/{id}/connect_tokens
  addMailboxSimple: (accountId, cbURL, cb)->
    result = @addMailbox accountId, cbURL, cb
    result?.body?.browser_redirect_url

  # Shared method to choose whether to do an Async o
  # Sync call the the specified function
  callAsyncOrSync: (func, params, cb)->
    result = null
    if not cb
      asyncFunc = Meteor.wrapAsync(func)
      result = asyncFunc params
    else
      func params, cb
    result

  @get: (key, secret, callbackUrl)->
    if ContextIOClient.instance?
      return ContextIOClient.instance

    key ?= Meteor.settings.services.contextio.key
    secret ?= Meteor.settings.services.contextio.secret
    callbackUrl ?= Meteor.settings.services.contextio.callbackUrl

    ContextIOClient.instance ?= new ContextIOClient(key, secret, callbackUrl)
    ContextIOClient.instance

Cio = ContextIOClient.get()