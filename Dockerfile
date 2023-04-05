FROM dtzar/helm-kubectl:3.2.0

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install pyyaml \
    && pipx install git+https://github.com/aws/aws-cli.git@v2 \
    && rm -rf /var/cache/apk/*

RUN aws --version   # Just to make sure its installed alright

RUN aws eks update-kubeconfig
    
WORKDIR /app

COPY run.sh .

ENTRYPOINT [ "/app/run.sh" ]
