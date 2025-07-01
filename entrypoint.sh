#!/bin/bash
set -e
echo "Running JMeter test"
jmeter -n -t /qpp-test-plan.jmx -l /result.jtl -j /jmeter.log
echo "JMeter Test Finished"


if [ -d /results ]; then
    echo "copy results to /results"
    cp /result.jtl /results/
    cp /jmeter.log /results/
    pwd
else
    echo "/results not found. skip this stage"
fi

echo "bash script finished"

# tail -f /dev/null