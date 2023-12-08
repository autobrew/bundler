#!/bin/sh
source lib/functions.sh
export package=grpc
export protobuf_static_extra_files="*/*/bin"
export grpc_static_extra_files="*/*/bin/grpc_cpp_plugin */*/bin/grpc_cli"
deploy_new_bundles grpc-static
merge_universal_bundles grpc
