FROM dtzar/helm-kubectl:3.11.2

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.25.7/2023-03-17/bin/linux/arm64/kubectl \
    && pip3 install awscli --ignore-installed six \
    && rm -rf /var/cache/apk/*

RUN aws --version   # Just to make sure its installed alright
    
WORKDIR /app

COPY run.sh .

ENTRYPOINT [ "/app/run.sh" ]
