
# Create mount points
sshfs elsdrm@140.109.21.195:/home /home/elsdrm/nas
sshfs elsdrm@140.109.21.195:/Database /home/elsdrm/database
curlftpfs -o user=elsdrm 140.109.21.198:10000 /home/elsdrm/ftp198
curlftpfs -o user=elsdrm 140.109.21.197:10000 /home/elsdrm/ftp197
