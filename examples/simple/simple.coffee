@Mailboxes = new Meteor.Collection 'Mailboxes'

if Meteor.isServer
  Meteor.startup ->
    Mailboxes.remove {}

Meteor.methods
  'deleteMailboxes': ->
    Mailboxes.remove {}

  'connectTokensSimple': (accountId, token)->
    console.log 'connecting account with mailbox...', accountId, token

    if Meteor.isServer
      cb = (e, r) ->
        if e?
          console.error e
        else
          Mailboxes.insert r.body

      Cio.client.accounts(accountId).connectTokens(token).get Meteor.bindEnvironment(cb)

if Meteor.isClient
  AutoForm.hooks
    createAccountForm:
      onSubmit: (insert, update, current)->
        data = insert

        Meteor.call 'deleteMailboxes'
        Meteor.call 'createAccountSimple', data.mail, data.name, data.lastName, (e, r)->
          if e?
            alert e
          console.log 'created account with id: ', r
          Session.set 'accountId', r

        return false

  Template.home.rendered = ->
    token = this.data?.token
    parentWindow = window.opener

    if token? and parentWindow?
      console.log 'received token: ', token
      id = parentWindow.Session.get 'accountId'
      parentWindow.Meteor.call 'connectTokensSimple', id, token
      window.close()

  Template.accountForm.helpers
    accountSchema: ->
      AccountSchema

  Template.registerHelper 'accountId', ->
    Session.get('accountId')

  Template.registerHelper 'callbackUrl', ->
    'http://127.0.0.1:3000/'

  Template.mailboxesInfo.helpers
    mailboxes: ->
      Mailboxes.find({})