FROM python:3.8
WORKDIR $'pwd'

RUN apt-get -y update  && apt-get install -y \
    python3-dev \
    apt-utils \
    python-dev \
    build-essential \   
&& rm -rf /var/lib/apt/lists/* 

RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -U cython
RUN pip install --no-cache-dir -U numpy
RUN pip install --no-cache-dir -U pystan

COPY src/requirements.txt .
RUN pip install --no-cache-dir -U -r requirements.txt

COPY src/* .
# COPY src/main.py .
# COPY src/model.py .
EXPOSE 8000

# RUN echo $PATH

CMD ["uvicorn","main:app", "--reload", "--workers", "1", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]