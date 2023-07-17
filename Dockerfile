FROM dtzar/helm-kubectl:3.12.1

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli pyyaml \
    && rm -rf /var/cache/apk/*

RUN aws --version   # Just to make sure its installed alright

    
WORKDIR /app

COPY run.sh .

ENTRYPOINT [ "/app/run.sh" ]
