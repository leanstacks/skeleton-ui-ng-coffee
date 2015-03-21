describe 'Controller Suite', ->

  beforeEach ->
    module 'skeletonApp'
    module 'skeletonServices'

  describe 'GreetingListController', ->

    scope = {}
    ctrl = null
    $httpBackend = null

    beforeEach ->
      inject (_$httpBackend_, $rootScope, $controller) ->
        $httpBackend = _$httpBackend_
        $httpBackend.expectGET('assets/app/data/greetings/greetings.json')
          .respond [
              id: 1
              text: 'Hello World!'
              lang: 'en'
            ,
              id: 2
              text: 'Hola Mundo!'
              lang: 'es'
            ,
              id: 3
              text: 'Bonjour Le Monde!'
              lang: 'fr'
            ]

        scope = $rootScope.$new();
        ctrl = $controller('GreetingListController', {$scope: scope});


    it 'should create "greetings" model with 3 greetings', ->
      $httpBackend.flush()

      expect(scope.greetings.length).toBe 3

    it 'should set the default value of greetingSort model', ->
      expect(scope.greetingSort).toBe 'text'
