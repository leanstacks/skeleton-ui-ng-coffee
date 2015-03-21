# Define the Application Services Module
skeletonServices = angular.module 'skeletonServices', ['ngResource']

# Define the Greeting Service
skeletonServices.factory 'Greeting', ['$resource',
  ($resource) ->
    $resource 'assets/app/data/greetings/:greetingId.json', {}, {
      query:
        method: 'GET'
        params:
          greetingId: 'greetings'
        isArray: true
    }
]
