# Define the Application Controllers Module
skeletonControllers = angular.module 'skeletonControllers', []

# Define the HeaderController Controller
skeletonControllers.controller 'HeaderController', ['$scope',
  ($scope) ->
    console.log '> HeaderController'

    $scope.preventDefaultAction = (e) ->
      console.log '  menu header clicked'
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
skeletonControllers.controller 'GreetingListController', ['$scope',
  ($scope) ->
    console.log '> GreetingListController'

    $scope.greetings = ['Hello World!', 'Hola Mundo!']

    console.log '< GreetingListController'
]
