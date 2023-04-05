FROM dtzar/helm-kubectl:3.2.0

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install pyyaml \
    && pip3 install git+git://github.com/aws/aws-cli.git#2.0.0 \
    && rm -rf /var/cache/apk/*

RUN aws --version   # Just to make sure its installed alright

RUN aws eks update-kubeconfig
    
WORKDIR /app

COPY run.sh .

ENTRYPOINT [ "/app/run.sh" ]
