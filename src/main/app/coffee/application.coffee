# The Angular Application Module

skeletonApp = angular.module 'skeletonApp', [
  'ngRoute',
  'skeletonControllers'
]

skeletonApp.config ['$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when '/home',
        templateUrl: 'assets/app/partials/home.html'
        controller: 'HomeController'
      .when '/greetings',
        templateUrl: 'assets/app/partials/greeting-list.html'
        controller: 'GreetingListController'
      .otherwise
        redirectTo: '/home'
]
