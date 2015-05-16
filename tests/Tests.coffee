class Tests

  describe 'Tests', ->

    it 'should read settings', (test) ->
      console.log 'should read settings'
      expect(Meteor.settings).not.to.be.null


Munit.run(new Tests())