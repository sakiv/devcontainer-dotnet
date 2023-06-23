# set base image (host OS)
FROM mcr.microsoft.com/dotnet/sdk:6.0

# Custom cache invalidation
ARG CACHEBUST=1

# set the working directory in the container
WORKDIR /workspace

# install editors - nano
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    nano

# Setup SSH with secure root login
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    openssh-server netcat \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/run/sshd \
    && echo 'root:password' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]