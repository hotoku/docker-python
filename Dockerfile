FROM python



RUN mkdir -p /root/build                                                              &&\
  cd /root/build                                                                      &&\
  wget https://github.com/Kitware/CMake/releases/download/v3.16.0/cmake-3.16.0.tar.gz &&\
  tar xzvf cmake-3.16.0.tar.gz                                                        &&\
  cd cmake-3.16.0                                                                     &&\
  ./bootstrap --parallel=4                                                            &&\
  make -j4                                                                            &&\
  make install

 
RUN mkdir -p /root/work
WORKDIR /root/work

RUN pip install Cython
RUN pip install folium
RUN pip install geojson
RUN pip install h3
RUN pip install jismesh
RUN pip install jupyterlab
RUN pip install jupyterlab-git
RUN pip install lightgbm
RUN pip install matplotlib
RUN pip install nodejs
RUN pip install numpy
RUN pip install optuna
RUN pip install pandas
RUN pip install plotly
RUN pip install pystan
RUN pip install python-dateutil
RUN pip install scikit-learn
RUN pip install scipy
RUN pip install seaborn
RUN pip install statsmodels
RUN pip install xgboost


RUN apt update              &&\
  apt-get install -y nodejs &&\
  apt-get install -y npm


RUN jupyter labextension install @jupyterlab/toc
RUN jupyter lab build
RUN jupyter labextension install @jupyterlab/git
RUN jupyter serverextension enable --py jupyterlab_git

RUN pip install gensim


COPY run-lab /usr/local/bin/run-lab
RUN chmod u+x /usr/local/bin/run-lab


ENTRYPOINT run-lab
