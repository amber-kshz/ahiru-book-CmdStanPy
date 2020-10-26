FROM ubuntu:20.04

RUN apt-get -y update
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install numpy scipy scikit-learn matplotlib seaborn pandas cmdstanpy[all]==0.9.65 jupyterlab
RUN python3 -c 'import cmdstanpy; cmdstanpy.install_cmdstan()'

WORKDIR /workdir
EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
CMD ["--notebook-dir=/workdir"]
