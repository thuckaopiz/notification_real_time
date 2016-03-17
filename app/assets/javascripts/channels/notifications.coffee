App.notifications = App.cable.subscriptions.create "NotificationsChannel",
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
    console.log((data.notification))
    @collection().append(data.notification)

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> @perform 'follow'
