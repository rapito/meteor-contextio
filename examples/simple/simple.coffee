@AccountSchema = new SimpleSchema
  primaryEmailAddress:
    type: String
    regEx: SimpleSchema.RegEx.Email,
    label: 'e-Mail Address'
  firstName:
    type: String
  lastName:
    type: String

if Meteor.isClient
  AutoForm.hooks
    createAccountForm:
      onSubmit: (insert, update, current)->
        console.log 'createAccountForm:onSubmit', arguments

  Template.simple.helpers
    accountSchema: ->
      @AccountSchema