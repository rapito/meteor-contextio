class Tests

  describe 'Tests', ->
    it 'should read settings', (test) ->
      console.log 'should read settings'
      expect(Meteor.settings).not.to.be.null

  describe 'Methods', ->
    accountId = '5557270c14626f660c8b463a'
    user =
      mail: "bob.gut@hotmail.com"
      name: "Bob"
      lastname: "Gut"

    it 'should call createAccount and deleteAccount', (test)->
      Meteor.call 'createAccount', user.mail, user.name, user.lastname, (e, r)->
        expect(r).to.be.an('object')
        id = r?.body?.id
        # delete the created account
        Meteor.call 'deleteAccount', id, (e, r)->
          expect(r).to.be.an('object')

    it 'should call createAccountSimple and deleteAccount', (test)->
      Meteor.call 'createAccountSimple', user.mail, user.name, user.lastname, (e, r)->
        expect(r).to.be.a('string')
        id = r
        # delete the created account
        Meteor.call 'deleteAccount', id, (e, r)->
          expect(r).to.be.an('object')

    it 'should call addMailbox', (test)->
      id = accountId

      Meteor.call 'addMailbox', id, (e, r)->
        expect(r).to.be.an('object')

    it 'should call addMailboxSimple', (test)->
      id = accountId

      Meteor.call 'addMailboxSimple', id, (e, r)->
        expect(r).to.be.a('string')


Munit.run(new Tests())