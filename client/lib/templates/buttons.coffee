Template.connectMailboxButton.events
    'click [data-button=cio-add-mb]': (evt)->
        console.log evt
        console.log this

Template.connectMailboxButton.helpers
    label: ->
        console.log 'helpers.label',this
        'Connect my Mailbox'

    classes: ->
        console.log 'helpers.classes',this
        'btn btn-info' # bootstrap classes


