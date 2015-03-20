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
skeletonControllers.controller 'GreetingCreateController', ['$scope', '$log', 'Greeting',
  ($scope, $log, Greeting) ->
    $log.log '> GreetingCreateController'

    $scope.master = {}

    $scope.create = (formData) ->
      $log.log '- creating new Greeting'
      $log.log 'form data:' + JSON.stringify formData
      newGreeting = new Greeting formData
      newGreeting.$save()
      $scope.reset()

    $scope.reset = () ->
      $scope.greeting = angular.copy $scope.master

    $scope.reset()

    $log.log '< GreetingCreateController'
]
