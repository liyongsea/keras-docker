docker run --name keras -v /home/cardiologs/workspace/keras/notebook:/notebook -p 8888:8888 -p 8889:8889 -d --privileged=True keras /bin/bash