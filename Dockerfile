FROM continuumio/anaconda3
SHELL ["/bin/bash", "-l", "-c"]




RUN mkdir -p /root/work
WORKDIR /root/work




RUN conda update -n base -c defaults conda
RUN conda install -y -c conda-forge \
  Cython \
  folium \
  geojson \
  h3 \
  lightgbm \
  matplotlib \
  nodejs \
  numpy \
  pandas \
  plotly \
  pystan \
  python-dateutil \
  scikit-learn \
  scipy \
  seaborn \
  statsmodels \
  xgboost
RUN pip install \
  jismesh \
  optuna 




RUN jupyter labextension install @jupyterlab/toc
RUN pip install --upgrade jupyterlab-git && jupyter lab build
RUN jupyter labextension install @jupyterlab/git && jupyter serverextension enable --py jupyterlab_git



COPY run-lab /usr/local/bin/run-lab
RUN chmod u+x /usr/local/bin/run-lab
