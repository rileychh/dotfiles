#!/usr/bin/env python3
"""Verify a media manifest against a local or mounted uploaded archive."""

import argparse
import hashlib
import json
from pathlib import Path
import sys
import time


def verify_file(root, entry):
    relative = Path(entry['archive'])
    if relative.is_absolute() or '..' in relative.parts or relative == Path('.'):
        raise ValueError('unsafe archive path')
    path = root / relative
    if not path.resolve().is_relative_to(root.resolve()):
        raise ValueError('archive path escapes root')
    size = entry['size']
    if not isinstance(size, int) or isinstance(size, bool) or size < 0:
        raise ValueError('invalid manifest size')
    before = path.stat()
    if before.st_size != size:
        raise ValueError(f'size mismatch: {before.st_size} != {size}')
    digest = hashlib.sha256()
    remaining = size
    with path.open('rb') as stream:
        while remaining:
            chunk = stream.read(min(1024 * 1024, remaining))
            if not chunk:
                raise OSError(f'short read: {remaining} bytes missing')
            digest.update(chunk)
            remaining -= len(chunk)
    after = path.stat()
    if (before.st_size, before.st_mtime_ns) != (after.st_size, after.st_mtime_ns):
        raise ValueError('file changed during verification')
    if digest.hexdigest() != entry['sha256']:
        raise ValueError('SHA-256 mismatch')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest', required=True, type=Path)
    parser.add_argument('--root', required=True, type=Path)
    parser.add_argument('--attempts', type=int, default=3)
    args = parser.parse_args()
    if args.attempts < 1:
        parser.error('--attempts must be positive')
    entries = json.loads(args.manifest.read_text())['files']
    if not entries:
        parser.error('manifest contains no files')
    if not args.root.is_dir():
        parser.error('archive root is not an available directory')
    failures = 0
    total = 0
    for entry in entries:
        for attempt in range(args.attempts):
            try:
                verify_file(args.root, entry)
                total += entry['size']
                break
            except (OSError, ValueError, KeyError) as error:
                if attempt + 1 == args.attempts:
                    failures += 1
                    print(f"FAIL {entry.get('archive', '<invalid entry>')}: {error}", file=sys.stderr)
                else:
                    time.sleep(1)
    print(f'{len(entries) - failures}/{len(entries)} files verified; {total} bytes; {failures} failures')
    return 1 if failures else 0


if __name__ == '__main__':
    sys.exit(main())
