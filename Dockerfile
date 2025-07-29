FROM pretix/standalone:stable

USER root

RUN pip3 install pretix-passbook pretix-fontpack-free

USER pretixuser


RUN cd /pretix/src && make production

USER root

RUN sed -i '/location \/media\/ {/a\	    add_header Access-Control-Allow-Origin "*";' /etc/nginx/nginx.conf

USER pretixuser
