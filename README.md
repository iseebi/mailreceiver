# mailreceiver - HTTPSでメール受信してIMAP/POPで読む

## システム構成

```
-- https --> [nginx] -- http --> [lmtpdeliver] -- lmtp --> [dovecot] -- POP3 --> [Gmail]
                                                                     -- IMAP --> [Mailer]
``` 

- Dovecot のストレージはS3を使用。
- 本プログラムのetc以下を持ってさえいれば、どこでも再開できる。
- 別途、ホストOS側でSSL証明書の管理が必要。