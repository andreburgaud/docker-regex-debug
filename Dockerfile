FROM alpine:3.8

ENV VERSION="0.1.1"

RUN apk update && apk upgrade

RUN apk add --no-cache jq perl perl-utils

RUN apk --no-cache add --virtual .build-dependencies \
        musl-dev \
        perl-dev \
        gcc \
        make && \
    cpan Log::Log4perl \
         File::Which \
         Canary::Stability \
         Term::ANSIColor \
         File::HomeDir \
         JSON Term::ReadKey \
         Time::HiRes \
         Regexp::Debugger && \
    apk del .build-dependencies

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
