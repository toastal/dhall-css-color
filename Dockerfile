FROM alpine:latest

COPY --from=dhallhaskell/dhall:latest /bin/dhall /bin/
COPY --from=dhallhaskell/dhall-json:latest /bin/dhall-to-json /bin/json-to-dhall /bin/

RUN apk update && \
    apk upgrade -U && \
    apk add curl dash fish jq
