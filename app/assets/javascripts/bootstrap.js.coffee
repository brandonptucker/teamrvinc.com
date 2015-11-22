jQuery ->
  $("a[rel~=popover], .has-popover").popover(html: true)
  $("a[rel~=tooltip], .has-tooltip").tooltip()
