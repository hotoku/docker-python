FROM continuumio/anaconda3
SHELL ["/bin/bash", "-l", "-c"]




RUN mkdir -p /root/work
WORKDIR /root/work




RUN conda update -n base -c defaults conda && \
  conda install -y -c conda-forge \
  Cython \
  folium \
  geojson \
  lightgbm \
  matplotlib \
  nodejs \
  numpy \
  optuna \
  pandas \
  plotly \
  pystan \
  python-dateutil \
  scikit-learn \
  scipy \
  seaborn \
  statsmodels \
  xgboost && \
  jupyter labextension install @jupyterlab/toc && \
  pip install --upgrade jupyterlab-git && \
  jupyter lab build && \
  jupyter labextension install @jupyterlab/git && \
  jupyter serverextension enable --py jupyterlab_git

RUN pip install jismesh


COPY run-lab /usr/local/bin/run-lab
RUN chmod u+x /usr/local/bin/run-lab


ENTRYPOINT run-lab
