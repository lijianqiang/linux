# nginx配置https

## openssl生成key
使用crt、key文件

## 配置

    server {
        listen 443;
        server_name api.intentplay.com;
        default_type 'text/html';

        # ssl begin
        ssl on;
        ssl_certificate         ssl_key/intentplay.crt;
        ssl_certificate_key     ssl_key/intentplay.key;

        ssl_protocols   TLSv1 TLSv1.1 TLSv1.2 SSLv3;
        ssl_ciphers     HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers   on;
        ssl_session_cache     builtin:1000 shared:SSL:10m;
        ssl_session_timeout   10m;
        # ssl end

        location / {
            content_by_lua_block {
                ngx.say("https ok")
            }
        }
    }


    server {
        listen 80;
        server_name api.intentplay.com;
        rewrite ^(.*)$  https://$host$1 permanent;
    }

> ssl_ciphers:  
 ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-RC4-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:RC4-SHA:!aNULL:!eNULL:!EXPORT:!DES:!3DES:!MD5:!DSS:!PKS;
