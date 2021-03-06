#' Get current dimensions and metrics available in GA API.
#'
#' @param version The Google Analytics API metadata to fetch - "universal" for Universal and earlier versions, "data" for Google Analytics 4
#' @param propertyId If requesting from Google Analytics 4, pass the propertyId to get metadata specific to that property.  Leaving it NULL or 0 will return universal metadata
#' @return dataframe of dimensions and metrics available to use
#'
#' @seealso \url{https://developers.google.com/analytics/devguides/reporting/metadata/v3/reference/metadata/columns/list}, \url{https://developers.google.com/analytics/trusted-testing/analytics-data/rest/v1alpha/TopLevel/getUniversalMetadata}
#' 
#' @importFrom googleAuthR gar_api_generator
#' 
#' @export
#' @examples 
#' 
#' \dontrun{
#' 
#' # universal analytics
#' ga_meta()
#' 
#' # Google Analytics 4 metadata from the Data API
#' ga_meta("data")
#' 
#' # Google Analytics 4 metadata for a particular Web Property
#' ga_meta("data", propertyId = 206670707)
#' 
#' }
ga_meta <- function(version = c("universal","data"),
                    propertyId = NULL){
  
  version <- match.arg(version)
  
  if(version == "universal"){
    meta <- gar_api_generator("https://www.googleapis.com/analytics/v3",
                              "GET",
                              path_args = list(metadata = "ga",
                                               columns = ""),
                              data_parse_function = parse_google_analytics_meta )
    o <- meta()
  } else if(version == "data"){
    o <- ga_meta_aw(propertyId)
  }

  o
  
  
}

ga_meta_aw <- function(propertyId){
  
  pid <- 0
  if(!is.null(propertyId)){
    pid <- propertyId
    myMessage("Metadata for propertyId", pid, level = 3)
  }
  
  the_url <- sprintf("https://analyticsdata.googleapis.com/%s/properties/%s/metadata",
              version_aw(), pid)
  meta <- gar_api_generator(the_url, "GET",
                            data_parse_function = parse_ga_meta_aw)
  
  meta()
  
}

