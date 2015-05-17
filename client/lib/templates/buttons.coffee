Template.connectMailboxButton.events
  'click [data-button=cio-add-mb]': (evt)->
    console.log evt
    console.log this

Template.connectMailboxButton.helpers
  label: ->
    console.log 'helpers.label', this

    label = this?.label
    label ?= 'Connect my Mailbox'

#
  classes: ->
    console.log 'helpers.classes', this

    classes = this?.classes
    classes ?= 'btn btn-info' # defaults bootstrap classes




