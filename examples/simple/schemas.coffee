Router.route '/',
  data: ->
    data =
      params: this.params
      token: this.params.query.contextio_token