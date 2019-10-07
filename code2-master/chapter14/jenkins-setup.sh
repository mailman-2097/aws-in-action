#! /bin/bash -xe
Jenkins_Plugins="$(cat jenkins_recommended_plugins.txt | awk '{printf "%s ",$1}')"
for var_plugin in $Jenkins_Plugins; do
  java -jar /share/jenkins-cli.jar -s "http://localhost:8080" -auth admin:admin -noKeyAuth install-plugin $var_plugin
done
java -jar /share/jenkins-cli.jar -s http://localhost:8080 -auth admin:admin safe-restart

