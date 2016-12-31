angular.module('app.mainApp').controller("mainCtrl", [
  '$scope',
  ($scope)->
    console.log 'mainCtrl running'

    $scope.testValue = "Hello angular and rails"

])
