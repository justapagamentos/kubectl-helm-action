FROM dtzar/helm-kubectl:3.11.2

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
#     && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && pip3 install awscli --ignore-installed six \
    && rm -rf /var/cache/apk/*

# RUN unzip awscliv2.zip

# RUN ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

RUN aws --version   # Just to make sure its installed alright
    
WORKDIR /app

COPY run.sh .

ENTRYPOINT [ "/app/run.sh" ]
