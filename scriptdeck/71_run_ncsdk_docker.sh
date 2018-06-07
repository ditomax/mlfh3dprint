#!/bin/bash

sudo docker run --rm --net=host --privileged --mount type=bind,source="/Users/dietmar/deeplearning/stpoelten",target=/stpoelten -v /dev:/dev --name ncsdk -i -t ncsdk /bin/bash
