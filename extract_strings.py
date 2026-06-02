import re
import sys

def extract_strings(file_path):
    with open(file_path, 'rb') as f:
        data = f.read()

    # Simple string extraction: 4 or more printable characters
    strings = re.findall(b'[\\x20-\\x7E]{4,}', data)

    unique_urls = set()
    url_pattern = re.compile(b'https?://[a-zA-Z0-9\\./_-]+')

    for s in strings:
        urls = url_pattern.findall(s)
        for url in urls:
            unique_urls.add(url.decode('ascii', errors='ignore'))

    for url in sorted(unique_urls):
        print(url)

if __name__ == "__main__":
    extract_strings(sys.argv[1])
