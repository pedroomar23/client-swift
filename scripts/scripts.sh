#!/bin/bash

# This script is designed to be run on a server that has access to the internet.
# It will download and install the latest version of the Apache HTTP Server from the official website.
# The installation process will be automated, and the user will not need to interact with the terminal.

set -e

echo "🚀 Starting QvaPay Client"

cd client-swift
swift build
swift run

echo "🚀 QvaPay Client has been installed successfully!"
