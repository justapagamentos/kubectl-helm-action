FROM dtzar/helm-kubectl:3.2.0

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscliv2 pyyaml \
    && rm -rf /var/cache/apk/*

RUN awsv2 --version   # Just to make sure its installed alright

RUN awsv2 eks update-kubeconfig
    
WORKDIR /app

COPY run.sh .

ENTRYPOINT [ "/app/run.sh" ]
