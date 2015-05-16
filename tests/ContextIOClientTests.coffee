class ContextIOClientTests

  wrapper: null
  client: null

  describe 'ContextIOClient', ->
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

Munit.run(new ContextIOClientTests())