FROM alpine:3.5

ENV HELM_VERSION=2.2.2

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

VOLUME /data

ADD ./resources /resources

RUN /resources/build && rm -rf resources

WORKDIR /data

ENTRYPOINT ["helm"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="helm" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.5" \
      "org.label-schema.description"="kubernetes-helm in a container" \
      "org.label-schema.url"="https://github.com/kubernetes/helm" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-helm" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.helm.version"=$JENKINS_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run -v $(pwd):/data fxinnovation/helm --help"
