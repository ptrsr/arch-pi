#!/bin/bash

docker run -it --rm \
  --network=host \
  -v $(realpath .)/bin/arch-arm.qcow2:/project/arch-arm.qcow2 \
  arch-pi
