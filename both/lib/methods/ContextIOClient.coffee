Meteor.methods
  'createAccount': (primaryEmailAddress, firstName, lastName)->
    Cio.createAccount primaryEmailAddress, firstName, lastName

  'createAccountSimple': (primaryEmailAddress, firstName, lastName)->
    Cio.createAccountSimple primaryEmailAddress, firstName, lastName

  'deleteAccount': (accountId)->
    Cio.deleteAccount accountId

  'addMailbox': (accountId, cbUrl)->
    Cio.addMailbox accountId, cbUrl

  'addMailboxSimple': (accountId, cbUrl)->
    Cio.addMailboxSimple accountId, cbUrl
