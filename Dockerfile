#Build Argument for specifying the version of image,for example,1.12.0-alpine3.9  
ARG VERSION

FROM golang:$VERSION

# Creates an /app directory within image that will hold our application source files
RUN mkdir /app

# Copies everything in the root directory into /app directory
ADD . /app

# Specifies the working dirctory
WORKDIR /app

# We run go build to compile hello.go program and make it executable
RUN go build -o hello .

# Adds crontab file in the cron directory
COPY crontab /etc/crontabs/root

# Creates the log file
RUN touch /var/log/cron.log

# Start crond with log level 8 in foreground, output to stderr
CMD ["crond", "-f", "-d", "8"]
