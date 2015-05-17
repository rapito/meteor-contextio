popupFlags = 'width=440,height=301'
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

    connectURL = 'http://127.0.0.1:3000/'
    connectURL = 'https://connect.context.io/api/2.0/connect_tokens/sjq4kxhlla58acmr?user_id=5557270c14626f660c8b463a&developer_key=5554ffa9f1e8ca1c008b4567'
    connectURL = 'https://connect.context.io/api/2.0/connect_tokens/sjq4kxhlla58acmr?user_id=5557270c14626f660c8b463a&developer_key=5554ffa9f1e8ca1c008b4567'

    isAddingAccount.set true
    Meteor.call 'addMailbox', account, (e, r)->
      isAddingAccount.set false
      if e?
        console.error e
        return
      connectURL = r.body.browser_redirect_url
      window.open connectURL, "Office", popupFlags

Template.connectMailboxButton.helpers
  label: ->
    label = this?.label
    label ?= 'Connect my Mailbox'

  classes: ->
    classes = this?.classes
    classes ?= 'btn btn-info' # defaults bootstrap classes




