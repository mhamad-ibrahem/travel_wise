enum StatusRequest {
  none, //the start status
  dataLoaded, //request success
  loading, //loading on the full page
  failure, //error on the full page
  authorizedFailure, //error401
  forbiddenFailure, //error403
  timeOutFailure, //timeout error on the full page
  offlineFailure, //offline error on the full page
  paginating, //small loading in the bottom of page
  paginatingFailure, //toast error
  refresh, //for refresh indicator
  loadingPartOfPage, //loading part of the  page
  errorPartOfPage, //error part of the  page
  internalServerError, //status code 500
  serverOnRepair //server is stop and need fex
}
