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

#' Query a datasource and returns an arrow Table
#'
#' @import arrow
#'
#' @param client As returned by [datasource_client()]
#' @param datasource The name of the datasource to query
#' @param query The query to run against the provided datasource
#' @param override Configuration values to override ([add_override()])
#'
#' @return An [arrow::Table]
#' @export
query <- function(client, datasource, query, override = list()) {
  datasource <- client$get_datasource(datasource)
  credentials <- DominoDataR::add_credentials(datasource$auth_type, override)
  result <- client$execute(
    datasource$identifier,
    query,
    reticulate::dict(override),
    reticulate::dict(credentials)
  )
  result$reader$to_reader()$read_table()
}
