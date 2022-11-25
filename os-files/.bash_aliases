alias unlock-documents='sudo mount -t ecryptfs -o  ecryptfs_cipher=aes,ecryptfs_key_bytes=16,ecryptfs_passthrough=no,ecryptfs_enable_filename_crypto=yes /mnt/storage/root/documents/.important /mnt/storage/root/documents/important'
alias lock-documents='sudo umount /mnt/storage/root/documents/important'
