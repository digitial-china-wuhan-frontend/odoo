FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y python3-pip git wget
  
RUN apt install -y \
  python3-dev \
  libxml2-dev \
  libxslt1-dev \
  libldap2-dev \
  libsasl2-dev \
  libtiff5-dev \
  libjpeg8-dev \
  libopenjp2-7-dev \
  zlib1g-dev \
  libfreetype6-dev \
  liblcms2-dev \
  libwebp-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libxcb1-dev \
  libpq-dev 

RUN apt-get install -y python3-venv  
RUN python3 -m venv /root/venv-odoo-14.0 
RUN . /root/venv-odoo-14.0/bin/activate

WORKDIR /root/odoo-dev/odoo

COPY . .

RUN pip3 install setuptools wheel && pip3 install -r requirements.txt

CMD ["python3","odoo-bin","-c","odoo.conf"]

EXPOSE 8069

