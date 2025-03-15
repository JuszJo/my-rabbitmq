FROM rabbitmq:3.8.0-management
COPY rabbitmq.conf /etc/rabbitmq/
ENV RABBITMQ_NODENAME=rabbit@localhost
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf

# Add these lines to fix the permissions issue
RUN mkdir -p /var/lib/rabbitmq || true
RUN touch /var/lib/rabbitmq/.erlang.cookie || true
RUN chmod 600 /var/lib/rabbitmq/.erlang.cookie 
RUN chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie

USER rabbitmq:rabbitmq
