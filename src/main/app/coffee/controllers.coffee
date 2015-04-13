# Define the Application Controllers Module
skeletonControllers = angular.module 'skeletonControllers', []

# Define the HeaderController Controller
skeletonControllers.controller 'HeaderController', ['$scope', '$log'
  ($scope, $log) ->
    $log.log '> HeaderController'

    $scope.greetingMenu = [
        text: 'List'
        href: '#/greetings'
      ,
        divider: true
      ,
        text: 'Create'
        href: '#/greetings/create'
    ]

    $scope.accountMenu = [
        text: 'Profile'
        href: '#/account'
      ,
        divider: true
      ,
        text: 'Sign Out'
        href: '#/account/signout'
    ]


    $scope.preventDefaultAction = (e) ->
      e.preventDefault()

    $log.log '< HeaderController'
]

# Define the FooterController Controller
skeletonControllers.controller 'FooterController', ['$scope', '$log'
  ($scope, $log) ->
    $log.log '> FooterController'

    $scope.currentDateTime = new Date()

    $log.log '< FooterController'
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

    $scope.greetingInfoClass = 'text-muted'

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
skeletonControllers.controller 'GreetingCreateFormController', ['$scope', '$log', '$alert', 'Greeting',
  ($scope, $log, $alert, Greeting) ->
    $log.log '> GreetingCreateFormController'

    $scope.master = {}
    messages = null

    # formData - required parameter
    $scope.create = (formData) ->
      $log.log '- creating new Greeting'
      $log.log 'form data:' + JSON.stringify formData

      # instantiate a new Greeting resource with the form data
      newGreeting = new Greeting formData
      # save the Greeting (i.e. POST to server)
      newGreeting.$save(
        (savedGreeting, responseHeaders)->
          $log.log 'success handler'
          $log.log "response data:#{savedGreeting}"
          # If inside modal, hide it.
          $scope.$hide() if $scope.$hide?

          #Reset the form content.
          $scope.reset()
          null
        ,
        (httpResponse) ->
          $log.log 'failure handler'
          # if messages previously displayed, hide old messages
          messages.hide() if messages?
          # display alert with messages
          messages = $alert
            title: 'Oops'
            content: 'An unexpected problem has occurred. Please try again.'
            type: 'danger'
            container: '#form-greeting-create-alert'
          null
      )

    $scope.reset = () ->
      $scope.greeting = angular.copy $scope.master

    $scope.reset()

    $log.log '< GreetingCreateFormController'
]
