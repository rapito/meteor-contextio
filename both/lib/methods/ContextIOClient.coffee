Meteor.methods
  'createAccount': (primaryEmailAddress, firstName, lastName, cb)->
    Cio.createAccount primaryEmailAddress, firstName, lastName, cb

  'createAccountSimple': (primaryEmailAddress, firstName, lastName, cb)->
    Cio.createAccountSimple primaryEmailAddress, firstName, lastName, cb

  'deleteAccount': (accountId, cb)->
    Cio.deleteAccount accountId, cb

  'addMailbox': (accountId, cbUrl, cb)->
    Cio.addMailbox accountId, cbUrl, cb

  'addMailboxSimple': (accountId, cbUrl, cb)->
    Cio.addMailboxSimple accountId, cbUrl, cb
