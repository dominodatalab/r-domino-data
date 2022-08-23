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

#' GET HTTP requests for Object Stores
#'
#' @details This is mostly for internal use by object store APIs.
#' @param url Signed URL to download object at.
#' @param datasource_type Type of datasource the object is stored in.
#' @param write_disk An argument like \code{\link[httr]{write_disk}} to write the result directly to disk.
#'
#' @return a \code{\link[httr]{response}} object.
objectGET <- function(url, datasource_type, write_disk = NULL) {
  config <- list()
  headers <- list()
  if (datasource_type == "ADLSConfig") {
    headers["X-Ms-Blob-Type"] <- "BlockBlob"
  }
  if (datasource_type == "GenericS3Config") {
    config <- httr::config(ssl_verifypeer = FALSE)
  }
  if (!is.null(write_disk)) {
    httr::GET(url, do.call(httr::add_headers, headers), config, write_disk)
  } else {
    httr::GET(url, do.call(httr::add_headers, headers), config)
  }
}
