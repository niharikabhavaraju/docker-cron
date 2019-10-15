FROM ubuntu:latest

# Install cron
RUN apt-get update -y -q && apt-get upgrade -y -q 
RUN apt-get install cron

# Install tools we might need
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git 

# Download Go 1.2.2 and install it to /usr/local/go
RUN curl -s https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz| tar -v -C /usr/local -xz

# Lets people find our Go binaries
ENV PATH $PATH:/usr/local/go/bin

# Add hello.go which prints hello user
ADD hello.go /

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Create the log file
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
