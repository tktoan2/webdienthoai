sleep 10s
/opt/mssql-tools/bin/sqlcmd -S . -U sa -P Password@123 \
-Q "CREATE DATABASE [QLdienthoai] ON (FILENAME ='/posdb/QLdienthoai.mdf'),(FILENAME = '/posdb/QLdienthoai_log.ldf') FOR ATTACH"
