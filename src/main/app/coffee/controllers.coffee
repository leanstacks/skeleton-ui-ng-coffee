# Define the Application Controllers Module
skeletonControllers = angular.module 'skeletonControllers', []

# Define the BodyController Controller
skeletonControllers.controller 'BodyController', ['$scope',
  ($scope) ->
    console.log '> BodyController'

    $scope.greeting = 'Hello World!'

    console.log '< BodyController'
]
