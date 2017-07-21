# 生成自签证书
### 步骤  
> enter key : permit

root@iZ94tgfr5lyZ:/data/key# pwd
/data/key

root@iZ94tgfr5lyZ:/data/key# openssl genrsa -des3 -out intentplay.key 1024  

    Generating RSA private key, 1024 bit long modulus
    ..................................++++++
    ..........++++++  
    e is 65537 (0x010001)  

Enter pass phrase for intentplay.key:  
Verifying - Enter pass phrase for intentplay.key:  

root@iZ94tgfr5lyZ:/data/key# openssl req -new -key intentplay.key -out intentplay.csr  

Enter pass phrase for intentplay.key:

    You are about to be asked to enter information that will be
    incorporated into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,  
    If you enter '.', the field will be left blank.  
-----  
Country Name (2 letter code) [AU]:CN  
State or Province Name (full name) [Some-State]:Fujian  
Locality Name (eg, city) []:Fuzhou  
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Intentplay Co.,Ltd  
Organizational Unit Name (eg, section) []:Intentplay  
Common Name (e.g. server FQDN or YOUR name) []:*.intentplay.com  
Email Address []:admin@intentplay.com                  

    Please enter the following 'extra' attributes to be sent with your certificate request

A challenge password []:  
An optional company name []:

root@iZ94tgfr5lyZ:/data/key# ls

    intentplay.csr  intentplay.key

root@iZ94tgfr5lyZ:/data/key# openssl rsa -in intentplay.key -out intentplay_nopass.key  
Enter pass phrase for intentplay.key:  

    writing RSA key

root@iZ94tgfr5lyZ:/data/key# ls

    intentplay.csr  intentplay.key  intentplay_nopass.key

root@iZ94tgfr5lyZ:/data/key# openssl x509 -req -days 365 -in intentplay.csr -signkey intentplay.key -out intentplay.crt  

    Signature ok
    subject=C = CN, ST = Fujian, L = Fuzhou,
    O = "Intentplay Co.,Ltd", OU = Intentplay,
    CN = *.intentplay.com, emailAddress = admin@intentplay.com
    Getting Private key

Enter pass phrase for intentplay.key:  

root@iZ94tgfr5lyZ:/data/key# ls  

    intentplay.crt  intentplay.csr  intentplay.key  intentplay_nopass.key
