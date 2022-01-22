# mailreceiver - HTTPSでメール受信してIMAP/POPで読む

## システム構成

```
-- https --> [nginx] -- http --> [lmtpdeliver] -- lmtp --> [dovecot] -- POP3 --> [Gmail]
                                                                     -- IMAP --> [Mailer]
``` 

- Dovecot のストレージはS3を使用。
- 本プログラムのetc以下を持ってさえいれば、どこでも再開できる。
- 別途、ホストOS側でSSL証明書の管理が必要。

## 初期設定

### S3QL の設定

メールボックスバケットにS3QLファイルシステムを作成する。

```
docker run -ti -e S3QL_USERNAME=$AWS_ACCESS_KEY_ID \
               -e S3QL_PASSWORD=$AWS_SECRET_ACCESS_KEY \
               -e S3QL_URL=s3://$AWS_REGION/$BUCKET_NAME \
               registry.gitlab.com/salokyn/docker-s3ql:latest \
               mkfs.s3ql s3://$AWS_REGION/$BUCKET_NAME
```

最初の`docker-compose up -d`した後に、メール保存ディレクトリを作成する必要がある。

```
$ docker exec mailreceiver-dovecot-1 mkdir /srv/mail
$ docker exec mailreceiver-dovecot-1 chown vmail:vmail /srv/mail
```