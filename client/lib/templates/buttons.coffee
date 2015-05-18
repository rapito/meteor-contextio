popupFlags = 'width=440,height=400'
isAddingAccount = new ReactiveVar()

Template.connectMailboxButton.rendered = ->
  isAddingAccount.set(false)

Template.connectMailboxButton.events
  'click [data-button=cio-add-mb]': (evt)->
    evt.preventDefault()
    if isAddingAccount.get()
      console.log 'please wait'
      # TODO: show loading until callback
      return

    account = this?.account

    if not _.isString(account)
      console.error "There's no account dude, what am I supposed to do with this?", account
      return

    isAddingAccount.set true
    Meteor.call 'addMailboxSimple', account, (e, connectURL)->
      isAddingAccount.set false
      if e?
        console.error e
        return

      window.open connectURL, "Office", popupFlags

Template.connectMailboxButton.helpers
  label: ->
    label = this?.label
    label ?= 'Connect my Mailbox'

  classes: ->
    classes = this?.classes
    classes ?= 'btn btn-info' # defaults bootstrap classes




