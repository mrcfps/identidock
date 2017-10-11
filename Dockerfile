FROM python:3.5

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1 redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 5000 9090 9191
USER uwsgi

CMD [ "/cmd.sh" ]