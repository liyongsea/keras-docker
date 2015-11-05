FROM drunkar/cuda-caffe-lstm-anaconda

RUN conda install -y theano h5py \
  && pip install keras

# nvdia
RUN cd /opt && mkdir nvidia_installers && cd nvidia_installers && wget http://us.download.nvidia.com/XFree86/Linux-x86_64/346.96/NVIDIA-Linux-x86_64-346.96.run && chmod +x NVIDIA-Linux-x86_64-346.96.run && ./NVIDIA-Linux-x86_64-346.96.run -s -N --no-kernel-module

ENV PATH=/usr/local/cuda/bin:$PATH \
  LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

RUN bash -c 'echo "export PATH=/usr/local/cuda/bin:$PATH" >> /root/.bashrc'

RUN bash -c 'echo -e "[global]\nfloatX = float32\ndevice = gpu\n[nvcc]\nfastmath = True" >> /root/.theanorc'
