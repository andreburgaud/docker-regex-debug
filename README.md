# Docker Regex Debug

Docker image to interaction with the Perl Regexp::Debugger module (https://metacpan.org/pod/Regexp::Debugger) authored by Damian Conway (http://blogs.perl.org/users/damian_conway/).

[![Docker Pulls](https://img.shields.io/docker/pulls/andreburgaud/regex-debug.svg)](https://hub.docker.com/r/andreburgaud/regex-debug)
[![Docker Automated Build](https://img.shields.io/docker/automated/andreburgaud/regex-debug.svg)](https://hub.docker.com/r/andreburgaud/regex-debug)
[![Docker Build Status](https://img.shields.io/docker/build/andreburgaud/regex-debug.svg)](https://hub.docker.com/r/andreburgaud/regex-debug)
[![Layers](https://images.microbadger.com/badges/image/andreburgaud/regex-debug.svg)](https://microbadger.com/images/andreburgaud/regex-debug)
[![Version](https://images.microbadger.com/badges/version/andreburgaud/regex-debug.svg)](https://microbadger.com/images/andreburgaud/regex-debug)

# Usage

```
$ docker pull andreburgaud/regex-debug
```

## Interactive Debugger

```
$ docker run --rm -it regexd
```

## Display number of steps

```
$ docker run --rm -it andreburgaud/regex-debug steps '^\d[a-z]*$' '1abcdef'
String : 1abcdef
Pattern: ^\d[a-z]*$
Regex analysis in progress...
Regex matched in 9 steps
```

## Display steps in JSON

```
$ docker run --rm -it andreburgaud/regex-debug json '^\d[a-z]*$' '1abcdef'
String : 1abcdef
Pattern: ^\d[a-z]*$
Regex analysis in progress...
[
  {
    "regex_pos": 0,
    "event": {
      "quantifier": "",
      "regex_pos": 0,
      "construct_type": "_START",
      "construct": "",
      "depth": 1,
      "msg": "Starting regex match",
      "indent": "  ",
      "lexical_scope": 0,
      "event_type": "pre"
    },
...
```

## Show help

```
$ docker run --rm -it andreburgaud/regex-debug help
```

## Show version

```
$ docker run --rm -it andreburgaud/regex-debug version
```

# License

MIT