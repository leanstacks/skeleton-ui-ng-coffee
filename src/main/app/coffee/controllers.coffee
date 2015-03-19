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

    $scope.greetingSort = 'text'

    console.log '< GreetingListController'
]

# Define the GreetingDetailController Controller
skeletonControllers.controller 'GreetingDetailController', ['$scope', '$routeParams', 'Greeting',
  ($scope, $routeParams, Greeting) ->
    console.log '> GreetingDetailController'

    $scope.greeting = Greeting.get {greetingId: $routeParams.greetingId}

    console.log '< GreetingDetailController'
]

# Define the GreetingCreateController Controller
skeletonControllers.controller 'GreetingCreateController', ['$scope', 'Greeting',
  ($scope, Greeting) ->
    console.log '> GreetingCreateController'

    $scope.master = {}

    $scope.create = (formData) ->
      console.log '- creating new Greeting'
      console.log 'form data:' + JSON.stringify formData
      newGreeting = new Greeting formData
      newGreeting.$save()
      $scope.reset()

    $scope.reset = () ->
      $scope.greeting = angular.copy $scope.master

    $scope.reset()

    console.log '< GreetingCreateController'
]
