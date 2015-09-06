$(document).ready ->
  punchClock = (e) ->
    e.preventDefault()
    url = $(e.target).attr("action")
    $.post url, $(e).serialize()
      .done (data) ->
        $("#button_container").html data['html']

  $(document).on "submit", "form#new_clockin", (e) ->
    punchClock(e)

  $(document).on "submit", "form#new_clockout", (e) ->
    punchClock(e)

