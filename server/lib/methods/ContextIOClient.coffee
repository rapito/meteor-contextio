Meteor.methods
  'addMailbox': (accountId,cb)->
    Cio.addMailbox.apply this,arguments
