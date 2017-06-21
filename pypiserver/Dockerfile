FROM python:3.4

RUN pip install passlib pypiserver gunicorn
ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pypiserver"]
