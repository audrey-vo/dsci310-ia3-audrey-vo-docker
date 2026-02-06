FROM rocker/rstudio:4.4.2

WORKDIR /home/rstudio

COPY clean_data.R clean_data.R
COPY renv.lock renv.lock
COPY renv renv

USER root
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"
RUN R -e "renv::restore()"