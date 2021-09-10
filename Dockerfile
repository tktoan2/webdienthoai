FROM mono:latest as webapp
RUN apt-get update && apt-get install libgpm2 libncurses6 libprocps7 mono-xsp4 mono-xsp4-base procps psmisc
WORKDIR /myapp
COPY ./Ictshop /myapp
ENTRYPOINT ["/bin/bash", "-c", "xsp4 --port 9000"]

FROM mcr.microsoft.com/mssql/server:2019-latest as dbserver
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Password@123
ENV MSSQL_TCP_PORT=1433
EXPOSE 1433
WORKDIR /src
COPY --chown=10001 attach_db.sh /posdb/
COPY ./Database/database/QLdienthoai.mdf /posdb/
COPY ./Database/database/QLdienthoai_log.ldf /posdb/
RUN chmod +x /posdb/attach_db.sh
RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started"
ENTRYPOINT /posdb/attach_db.sh & /opt/mssql/bin/sqlservr

 
