hbs = require 'express-hbs'

hbs.registerHelper 'css', (file, media) ->
  # By default second arg is context if not explicitly passed
  media = "all" unless media.substring?
  """<link href="#{css(file)}" media="#{media}" rel="stylesheet" type="text/css"/>"""

hbs.registerHelper 'js', (path) ->
  files = js(path)
  if files.substring?
    files = [files]
  ("""<script src="#{file}" type="text/javascript"></script>""" for file in files).join('\n')

hbs.registerHelper 'img', (file) ->
  """<img src="#{img(file)}"/>"""