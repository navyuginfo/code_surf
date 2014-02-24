fs      = require 'fs'
sysPath = require 'path'

# See docs at http://brunch.readthedocs.org/en/latest/config.html.

exports.config = 

  files: 
    
    javascripts: 
      defaultExtension: 'coffee',
      joinTo: 
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/

      order: 
        before: [
          'vendor/scripts/console-helper.js',
          'vendor/scripts/addons/jquery.js',
          'vendor/scripts/addons/jquery.cookie.js',
          'vendor/scripts/addons/fastclick.js',
          'vendor/scripts/addons/modernizr.js',
          'vendor/scripts/addons/placeholder.js',
          'vendor/scripts/foundation.min.js',
          'vendor/scripts/handlebars.js',
          'vendor/scripts/ember-latest.js',
          'vendor/scripts/ember-data-latest.js'
          ]

    stylesheets:
      defaultExtension: 'css'
      joinTo: 'stylesheets/app.css'
      order:
        before: ['vendor/styles/foundation.min.css',
          'vendor/styles/normalize.css'
        ]

    templates:
      precompile: true
      root: 'templates'
      defaultExtension: 'hbs'
      joinTo: 'javascripts/app.js' : /^app/

  # allow _ prefixed templates so partials work
  conventions:
    ignored: (path) ->
      startsWith = (string, substring) ->
        string.indexOf(substring, 0) is 0
      sep = sysPath.sep
      if path.indexOf("app#{sep}templates#{sep}") is 0
        false
      else
        startsWith sysPath.basename(path), '_'

  server:
    port: 3333
    base: '/'
    run: no

