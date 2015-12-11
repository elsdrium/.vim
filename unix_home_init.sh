#!/usr/bin/zsh

# Create mount points
if [[ "$platform" == 'osx' ]]; then
    sshfs elsdrm@140.109.21.195:/home /Users/elsdrm/nas
    sshfs elsdrm@140.109.21.195:/Database /Users/elsdrm/db
    curlftpfs -o user=elsdrm 140.109.21.198:10000 /Users/elsdrm/ftp198
    #curlftpfs -o user=elsdrm 140.109.21.197:10000 /Users/elsdrm/ftp197
elif [[ "$platform" == 'linux' ]]; then
    sshfs elsdrm@140.109.21.195:/home /home/elsdrm/nas
    sshfs elsdrm@140.109.21.195:/Database /home/elsdrm/db
    curlftpfs -o user=elsdrm 140.109.21.198:10000 /home/elsdrm/ftp198
    #curlftpfs -o user=elsdrm 140.109.21.197:10000 /home/elsdrm/ftp197
else
    echo 'Undefined OS.'
fi
