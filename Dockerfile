FROM jenkins/jenkins
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY jenkins-plugins-formatted /usr/share/jenkins/ref/jenkins-plugins-formatted
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/jenkins-plugins-formatted
