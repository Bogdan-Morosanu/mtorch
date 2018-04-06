# this is just a local build of the upstream pytorch docker
FROM local-pytorch:latest 

LABEL maintainer="Bogdan Morosanu <bogdan.moro.mail@gmail.com>"

RUN apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends -y emacs

RUN conda install --name=base \
        Pillow \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        scipy \
        scikit-learn \
	scikit-image \
	seaborn \
	csvkit \
	nltk

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# IPython
EXPOSE 8888

RUN mkdir /notebooks

WORKDIR "/notebooks"

CMD ["/run_jupyter.sh"]
