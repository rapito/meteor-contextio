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

        key = "1j9gnir6"
        secret = "s4fj0FqVHfQX2qC2"

        expect(@wrapper.key).to.equal(key);
        expect(@wrapper.secret).to.equal(secret);

    describe 'Functions', ->
      it 'should create accounts and delete them', (test)->
        result = Cio.createAccount(user.mail,user.name,user.lastname)
        console.log result
        expect(result).to.be.an('object')
        expect(result).to.have.property('success')
        expect(result).to.have.property('id')

        expect(result.success).to.eql(true)
        expect(result.id).to.be.a('string')

        id = result.id

        Cio.client.accounts(id).delete()


    describe 'Client:npm-module', ->
      it 'should get accounts', (test)->
        Cio.client.accounts().get null, (e, r)->
#          console.log e
          expect(e).to.be.null

#          console.log r
          expect(r).to.be.an('object')
          expect(r).to.have.property('statusCode')
          expect(r).to.have.property('headers')
          expect(r.headers).to.have.property('link')

          expect(r.statusCode).to.eql(200)
          expect(r.headers.link).to.have.string('accounts')


Munit.run(new ContextIOClientTests())