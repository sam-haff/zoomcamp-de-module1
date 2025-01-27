#!/bin/bash
# Windows version, remove leading / to run in Linux
# Double slash is needed on Windows
# https://stackoverflow.com/a/49013604
docker run -it --entrypoint "//bin/bash" python:3.12.8 