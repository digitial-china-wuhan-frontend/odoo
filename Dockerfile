FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y python3-pip git wget
  
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

RUN apt-get install -y python3-venv && \
  python3 -m venv /root/venv-odoo-14.0 && \
  . /root/venv-odoo-14.0/bin/activate

WORKDIR /root/sourcecode/odoo

COPY requirements.txt .

RUN pip3 install setuptools wheel debugpy

RUN pip3 install -r requirements.txt

COPY . .

ENV PORT 8069
EXPOSE $PORT

# CMD [ "python3" , "odoo-bin" , "-c" , "/root/sourcecode/odoo/config/odoo.dev.conf" ]
CMD [ "python3" , "-m" , "debugpy" , "--listen" , "5678" , "odoo-bin" , "-c" , "/root/sourcecode/odoo/config/odoo.dev.conf" ]



