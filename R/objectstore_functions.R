# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

#' List the keys starting with prefix in an object store
#'
#' @param client `domino_data.data_sources.DataSourceClient`, as returned by [datasource_client()]
#' @param datasource The name of the datasource to query
#' @param prefix Prefix to filter keys to list
#' @param override An environment with configuration overrides
#'
#' @return A vector or string keys
#' @export
list_keys <- function(client, datasource, prefix = "", override = new.env()) {
  datasource <- client$get_datasource(datasource)
  client$list_keys(
    datasource$identifier,
    prefix,
    reticulate::dict(),
    reticulate::dict()
  )
}

#' Retrieve an object from a datasource
#'
#' @param client `domino_data.data_sources.DataSourceClient`, as returned by [datasource_client()]
#' @param datasource The name of the datasource to query
#' @param object The object to retrieve
#' @param override An environment with configuration overrides
#' @param as Passed through to \code{\link[httr]{content}}
#'
#' @return Raw vector representation of the object
#' @export
get_object <- function(client, datasource, object, override = new.env(), as = "raw") {
  datasource <- client$get_datasource(datasource)
  url <- client$get_key_url(
    datasource$identifier,
    object,
    FALSE,
    reticulate::dict(),
    reticulate::dict()
  )
  r <- objectGET(url, datasource_type = datasource$datasource_type)
  httr::content(r, as = as)
}

#' Save an object from a datasource to a local file
#'
#' @param client `domino_data.data_sources.DataSourceClient`, as returned by [datasource_client()]
#' @param datasource The name of the datasource to query
#' @param object The object to retrieve
#' @param file File path to save object at. Defaults to the object base name.
#' @param override An environment with configuration overrides
#'
#' @return Raw vector representation of the object
#' @export
save_object <- function(client, datasource, object, file = basename(object), override = new.env()) {
  datasource <- client$get_datasource(datasource)
  url <- client$get_key_url(
    datasource$identifier,
    object,
    FALSE,
    reticulate::dict(),
    reticulate::dict()
  )
  r <- objectGET(url, datasource_type = datasource$datasource_type, write_disk = httr::write_disk(file))
  file
}
