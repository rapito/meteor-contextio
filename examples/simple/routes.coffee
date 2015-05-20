Router.route '/',
  name: 'home'
  data: ->
    data =
      params: this.params
      token: this.params.query.contextio_token