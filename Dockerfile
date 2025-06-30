FROM alpine/jmeter:5.6

# copy test to container
COPY qpp-test-plan.jmx /qpp-test-plan.jmx
COPY entrypoint.sh /entrypoint.sh

# run j meter
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]