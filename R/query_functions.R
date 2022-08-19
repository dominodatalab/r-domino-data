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

#' Create a client to Domino datasources
#'
#' @param api_key string key to override the environment variable
#' @param token_file location of file to read token from
#'
#' @return A `domino_data.data_sources.DataSourceClient`.
#' @export
datasource_client <- function(api_key = NULL, token_file = NULL) {
    ds <- reticulate::import("domino_data.data_sources")
    ds$DataSourceClient()
}

#' Query a datasource and returns an arrow Table
#'
#' @param client `domino_data.data_sources.DataSourceClient`, as returned by [datasource_client()]
#' @param datasource The name of the datasource to query
#' @param query The query to run against the provided datasource
#' @param override An environment with configuration overrides
#'
#' @return An [arrow::Table]
#' @export
query <- function(client, datasource, query, override=new.env()) {
    datasource <- client$get_datasource(datasource)
    result <- client$execute(datasource$identifier,
                   query,
                   reticulate::dict(),
                   reticulate::dict())
    result$reader$to_reader()$read_table()
}
