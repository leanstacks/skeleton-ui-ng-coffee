# Define the Application Controllers Module
skeletonControllers = angular.module 'skeletonControllers', []

# Define the HeaderController Controller
skeletonControllers.controller 'HeaderController', ['$scope',
  ($scope) ->
    console.log '> HeaderController'

    $scope.preventDefaultAction = (e) ->
      e.preventDefault()

    console.log '< HeaderController'
]

# Define the HomeController Controller
skeletonControllers.controller 'HomeController', ['$scope',
  ($scope) ->
    console.log '> HomeController'

    console.log '< HomeController'
]

# Define the GreetingListController Controller
skeletonControllers.controller 'GreetingListController', ['$scope', 'Greeting',
  ($scope, Greeting) ->
    console.log '> GreetingListController'

    $scope.greetings = Greeting.query()

    console.log '< GreetingListController'
]

# Define the GreetingDetailController Controller
skeletonControllers.controller 'GreetingDetailController', ['$scope', '$routeParams', 'Greeting',
  ($scope, $routeParams, Greeting) ->
    console.log '> GreetingDetailController'

    $scope.greeting = Greeting.get {greetingId: $routeParams.greetingId}

    console.log '< GreetingDetailController'
]
