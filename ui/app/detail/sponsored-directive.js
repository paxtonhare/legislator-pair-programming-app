(function () {

  'use strict';

  angular.module('app.sponsored')
    .directive('mlSponsored', mlSponsored);

  mlSponsored.$inject = ['MLRest'];

  function mlSponsored(mlRest) {
    return {
      restrict: 'E',
      templateUrl: 'app/detail/sponsored-directive.html',
      scope: { uri: '@', limit: '@' },
      link: function(scope, iElement, iAttrs, ctrl) {
        mlRest.extension('sponsored',
          {
            method: 'GET',
            params:
              {
                'rs:uri': scope.uri
              }
          })
          .then(function(response) {
            scope.sponsored = response.data;
          });
      }
    };
  }

}());
