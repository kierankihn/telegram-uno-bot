FROM alpine:3.14

WORKDIR /app

ADD . .

RUN apk add --no-cache gettext

RUN find /app/locales -maxdepth 2 -type d -name 'LC_MESSAGES' -exec sh -c 'msgfmt {}/unobot.po -o {}/unobot.mo' \;

RUN apk add --update --no-cache py3-pip binutils

RUN pip3 install -r requirements.txt

CMD ["python3", "/app/bot.py"]
