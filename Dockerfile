FROM leobastiani/ubuntu-with-user:22.04

RUN sudo apt-get update
RUN sudo apt-get -y install tinyproxy

RUN echo "Allow MYIP" | sudo tee -a /etc/tinyproxy/tinyproxy.conf

RUN sudo mkdir -p /var/log/tinyproxy
RUN sudo touch /var/log/tinyproxy/tinyproxy.log
RUN sudo chown ubuntu:ubuntu /var/log/tinyproxy/tinyproxy.log

RUN sudo mkdir -p /var/run/tinyproxy
RUN sudo touch /var/run/tinyproxy/tinyproxy.pid
RUN sudo chown ubuntu:ubuntu /var/run/tinyproxy/tinyproxy.pid

CMD sudo tinyproxy -d -c /etc/tinyproxy/tinyproxy.conf
