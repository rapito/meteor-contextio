class ContextIOClientTests

  wrapper: null
  client: null

  user =
    mail: "bob.gut@hotmail.com"
    name: "Bob"
    lastname: "Gut"

  describe 'ContextIOClient', ->
    describe 'Singleton', ->
      beforeAll (test) ->
        @wrapper = Cio

      beforeEach (test) ->
      afterEach (test) ->
      afterAll (test) ->

      it 'should be constructed', (test) ->
        console.log 'should be constructed'
        expect(@wrapper).to.be.an.instanceof(ContextIOClient);

      it 'should have same keys', (test) ->
        console.log 'should have same keys'

        # this values should be changed to
        # what you have on your Meteor.settings
        key = "1j9gnir6"
        secret = "s4fj0FqVHfQX2qC2"
        callbackUrl = "http://localhost"

        expect(@wrapper.key).to.equal(key);
        expect(@wrapper.secret).to.equal(secret);
        expect(@wrapper.callbackUrl).to.equal(callbackUrl);

    describe 'Client:npm-module', ->
      it 'should get accounts', (test)->
        Cio.client.accounts().get null, (e, r)->
          expect(e).to.be.null

          expect(r).to.be.an('object')
          expect(r).to.have.property('statusCode')
          expect(r).to.have.property('headers')
          expect(r.headers).to.have.property('link')

          expect(r.statusCode).to.eql(200)
          expect(r.headers.link).to.have.string('accounts')

    describe 'Functions', ->
      it 'should create accounts and delete them', (test)->
        # test full createAccount method
        result = Cio.createAccount(user.mail,user.name,user.lastname)
        expect(result).to.be.an('object')
        expect(result).to.have.property('body')

        result = result.body
        expect(result).to.have.property('success')
        expect(result).to.have.property('id')

        expect(result.success).to.eql(true)
        expect(result.id).to.be.a('string')

        id = result.id
        Cio.client.accounts(id).delete()

        # test simple createAccount method
        result = Cio.createAccountSimple(user.mail,user.name,user.lastname)
        expect(result).to.be.a('string')

        id = result
        Cio.client.accounts(id).delete()


      it 'should create account and delete it', (test)->
        id = Cio.createAccountSimple(user.mail,user.name,user.lastname)

        result = Cio.deleteAccount id
        expect(result).to.be.an('object')

        result = result.body
        console.log result
        expect(result).to.be.an('object')
        expect(result).to.have.property('success')
        expect(result.success).to.eql(true)

      it 'should create accounts add a mailbox to it and delete them', (test)->
        id = Cio.createAccountSimple(user.mail,user.name,user.lastname)

        # test full addMailbox method
        result = Cio.addMailbox id
        expect(result).to.be.an('object')
        expect(result).to.have.property('body')

        result = result.body
        expect(result).to.have.property('success')
        expect(result).to.have.property('token')
        expect(result).to.have.property('browser_redirect_url')
        expect(result.success).to.eql(true)

        # test simple addMailbox method
        result = Cio.addMailboxSimple id
        expect(result).to.be.a('string')

        Cio.deleteAccount id

Munit.run(new ContextIOClientTests())