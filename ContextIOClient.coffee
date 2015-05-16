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

  createAccount: (primaryEmailAddress, firstName, lastName)->
    expect(primaryEmailAddress).to.be.a('string')
    expect(firstName).to.be.a('string')
    expect(lastName).to.be.a('string')
    result = null

    asyncFunc = Meteor.wrapAsync(@client.accounts().post)
    asyncFunc {email: primaryEmailAddress, first_name: firstName, last_name: lastName}, (e, r)->
      expect(e).to.be.null
      result = r
      console.log r

    result

  @get: (key, secret)->
    if ContextIOClient.instance?
      return ContextIOClient.instance

    key ?= Meteor.settings.services.contextio.key
    secret ?= Meteor.settings.services.contextio.secret

    ContextIOClient.instance ?= new ContextIOClient(key, secret)
    ContextIOClient.instance


Cio = ContextIOClient.get()