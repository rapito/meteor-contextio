class Tests

  describe 'Tests', ->
    it 'should read settings', (test) ->
      expect(Meteor.settings).not.to.be.null

  describe 'Methods', ->
    # use an id from your own context.io accounts
    accountId = '555972c677abddcb358b4603'
    user =
      mail: "bob.gut@hotmail.com"
      name: "Bob"
      lastname: "Gut"

    afterEach ->
      spies.restoreAll()

    it 'should call createAccount and deleteAccount', (test, waitFor)->
      cb = (e, r)->
        expect(r).to.be.an('object')
        id = r?.body?.id

        # delete the created account
        Meteor.call 'deleteAccount', id, (e, r)->
          expect(r).to.be.an('object')

      Meteor.call 'createAccount', user.mail, user.name, user.lastname, waitFor(cb)

    it 'should call createAccountSimple and deleteAccount', (test, waitFor)->
      cb = (e, r)->
        expect(r).to.be.a('string')
        id = r

        # delete the created account
        Meteor.call 'deleteAccount', id, (e, r)->
          expect(r).to.be.an('object')

      Meteor.call 'createAccountSimple', user.mail, user.name, user.lastname, waitFor(cb)

    it 'should call addMailbox', (test, waitFor)->
      id = accountId
      cb = (e, r)->
        expect(r).to.be.an('object')

      Meteor.call 'addMailbox', id, waitFor(cb)

    it 'should call addMailboxSimple', (test, waitFor)->
      id = accountId
      cb = (e, r)->
        expect(r).to.be.a('string')

      Meteor.call 'addMailboxSimple', id, waitFor(cb)


Munit.run(new Tests())