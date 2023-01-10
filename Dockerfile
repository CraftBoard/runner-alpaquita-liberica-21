From bellsoft/liberica-runtime-container:jre-17-musl

# Update
RUN apk update && apk upgrade

# Install libstdc++ (required by purpur)
RUN apk add libstdc++

# Create server folder
RUN mkdir -p /opt/server

# Add script
ADD ./run.sh /opt/run.sh


USER nobody
CMD /bin/sh /opt/run.sh
