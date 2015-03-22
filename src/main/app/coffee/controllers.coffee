# Define the Application Controllers Module
skeletonControllers = angular.module 'skeletonControllers', []

# Define the HeaderController Controller
skeletonControllers.controller 'HeaderController', ['$scope', '$log'
  ($scope, $log) ->
    $log.log '> HeaderController'

    $scope.preventDefaultAction = (e) ->
      e.preventDefault()

    $log.log '< HeaderController'
]

# Define the HomeController Controller
skeletonControllers.controller 'HomeController', ['$scope', '$log'
  ($scope, $log) ->
    $log.log '> HomeController'

    $log.log '< HomeController'
]

# Define the GreetingListController Controller
skeletonControllers.controller 'GreetingListController', ['$scope', '$log', 'Greeting',
  ($scope, $log, Greeting) ->
    $log.log '> GreetingListController'

    $scope.greetings = Greeting.query()

    $scope.greetingSort = 'text'

    $log.log '< GreetingListController'
]

# Define the GreetingDetailController Controller
skeletonControllers.controller 'GreetingDetailController', ['$scope', '$log', '$routeParams', 'Greeting',
  ($scope, $log, $routeParams, Greeting) ->
    $log.log '> GreetingDetailController'

    $scope.greeting = Greeting.get {greetingId: $routeParams.greetingId}

    $log.log '< GreetingDetailController'
]

# Define the GreetingCreateController Controller
skeletonControllers.controller 'GreetingCreateController', ['$scope', '$log',
  ($scope, $log) ->
    $log.log '> GreetingCreateController'

    $log.log '< GreetingCreateController'
]

# Define the GreetingCreateFormController Controller
skeletonControllers.controller 'GreetingCreateFormController', ['$scope', '$log', 'Greeting',
  ($scope, $log, Greeting) ->
    $log.log '> GreetingCreateFormController'

    $scope.master = {}

    # formData - required parameter
    # modalSelector - pass DOM selector if form embedded in modal
    $scope.create = (formData, modalSelector) ->
      $log.log '- creating new Greeting'
      $log.log 'form data:' + JSON.stringify formData
      newGreeting = new Greeting formData
      newGreeting.$save(
        (savedGreeting, responseHeaders)->
          $log.log 'success handler'
          $log.log "response data:#{savedGreeting}"
          # If inside modal, hide it.
          $scope.$hide() if $scope.$hide?

          #Reset the form content.
          $scope.reset()
        ,
        (httpResponse) ->
          $log.log 'failure handler'
          # TODO: Display Error Message
      )

    $scope.reset = () ->
      $scope.greeting = angular.copy $scope.master

    $scope.reset()

    $log.log '< GreetingCreateFormController'
]
