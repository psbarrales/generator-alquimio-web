app = angular.module('App.Scaffolding', [
  'App.Controller'
  'App.Directive'
])

app.constant "LOCALE", {
  "es-la": {
  }
};

app.run () ->
  return

app.filter 'locale', [
  'LOCALE'
  '$interpolate'
  '$sce',
  '$rootScope'
  (LOCALE, $interpolate, $sce, $rootScope) ->
    (input, lang, kind) ->
      name = input or ''
      out = input
      try
        if typeof name == 'string'
          names = name.split('.')
          now = 0
          locales = LOCALE[$rootScope.lang || "es-la"];
          while names.length > 0
            locales = locales[names[0]]
            now++
            names.shift()
          out = locales
      catch e
        out = name
      if typeof out == 'undefined'
        out = name
      out = $interpolate(out, false, false, false)
      if typeof object == 'string'
        object = object.replace(/'/g, '"')
        object = angular.fromJson(object)
      if kind == 'html'
        return $sce.trustAsHtml(out object or {})
      else
        return out object or {}
]

app.config ($animateProvider) ->
  $animateProvider.classNameFilter /^(?:(?!ng-animate-disabled).)*$/
  return

# ---
# generated by js2coffee 2.1.0