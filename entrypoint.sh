#!/bin/bash
set -e
echo "Running JMeter test"
jmeter -n -t /qpp-test-plan.jmx -l /result.jtl -j /jmeter.log
echo "JMeter Test Finished"


if [ -d /results ]; then
    echo "copy results to /results"
    cp /result.jtl /results/
    cp /jmeter.log /results/
    chown -R 1000:1000 /results
    pwd
    cd /results
    ls -la
else
    echo "/results not found. skip this stage"
fi

echo "bash script finished"

# tail -f /dev/null