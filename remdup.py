import os
import hashlib

def file_checksum(file_path):
    with open(file_path, "rb") as f:
        hash_md5 = hashlib.md5()
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
        return hash_md5.hexdigest()

def remove_duplicate_files(directory):
    checksums_seen = set()
    
    for root, _, files in os.walk(directory):
        for file_name in files:
            file_path = os.path.join(root, file_name)
            checksum = file_checksum(file_path)
            
            if checksum in checksums_seen:
                print(f"Removing duplicate file: {file_path}")
                os.remove(file_path)
            else:
                checksums_seen.add(checksum)

if __name__ == "__main__":
    directory_to_scan = "/path/to/directory"
    remove_duplicate_files(directory_to_scan)