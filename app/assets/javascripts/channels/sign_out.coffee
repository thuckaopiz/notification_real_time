App.notifications = App.cable.subscriptions.create "SignOutChannel",
  collection: -> $("#notification")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @perform 'follow'
      @installPageChangeCallback()
    , 1000

  followCurrentMessage: ->
    @perform 'follow'

  received: (data) ->
    console.log((JSON.parse(data.message)))
    onlineStatus = "#online-status-" + JSON.parse(data.message)["id"]
    $(onlineStatus).removeClass("online");

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> @perform 'follow'
