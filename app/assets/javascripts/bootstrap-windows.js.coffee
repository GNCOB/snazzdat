$ ->
  $.windows = (toggle) ->
    if toggle
      if $('.window').hasClass toggle
        $('.window').removeClass "window-go-left window-go-right"
      else
        $('.window').addClass toggle
    else
      $('[data-toggle=window][data-target]').click (event) ->
        event.preventDefault()
        target = $ $(@).attr 'data-target'
        dir = if target.hasClass('window-left') then 'window-go-right' else 'window-go-left'
        if target.hasClass(dir)
          $('.window.window-center').removeClass 'window-go-left window-go-right'
          target.removeClass dir
        else
          $('.window.window-center').addClass dir
          target.addClass dir

      $('.window:not(.window-center) [data-toggle^="tab"]').click ->
        # slide it back
        $('.window.window-go-left').removeClass 'window-go-left'
        $('.window.window-go-right').removeClass 'window-go-right'
        # force the window to the top
        $('.window.window-center').scrollTop 0

  # document.ontouchmove = (event) ->
  #   if $('.window.window-center').hasClass('window-go-left') or $('.window.window-center').hasClass('window-go-right')
  #       event.preventDefault()

  # $('.window.window-left .contain').each ->
  #   @ontouchmove = (event) ->
  #     event.stopPropagation()
  #     # event.preventDefault()

  # $('.window.window-center').click ->
  #   if $(@).hasClass('window-go-left') or $(@).hasClass('window-go-right')
  #     $('.window').removeClass "window-go-left window-go-right"

  $.windows()