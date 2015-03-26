# The Angular Application Module

skeletonApp = angular.module 'skeletonApp', [
  'ngRoute',
  'ngAnimate',
  'mgcrea.ngStrap',
  'skeletonControllers',
  'skeletonServices'
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
      .when '/greetings/create',
        templateUrl: 'assets/app/partials/greeting-create.html'
        controller: 'GreetingCreateController'
      .when '/greetings/:greetingId',
        templateUrl: 'assets/app/partials/greeting-detail.html'
        controller: 'GreetingDetailController'
      .otherwise
        redirectTo: '/home'
]
