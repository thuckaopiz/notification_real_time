App.notifications = App.cable.subscriptions.create "MessagesChannel",
  collection: -> $("#messages")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @perform 'follow'
      @installPageChangeCallback()
    , 1000

  followCurrentMessage: ->
    @perform 'follow'

  received: (data) ->
    console.log((JSON.parse(data.message)["user"]["email"]))
    @collection()
      .append(
        "<span style='color: red'>" +
        JSON.parse(data.message)["user"]["email"] + "</span>" +
        ":" +
        JSON.parse(data.message)["message"]["content"] +
        "</br>"
      )

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> @perform 'follow'
