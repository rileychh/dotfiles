---
name: camera-archive
description: Archive camera photos and videos by capture month, verify uploaded files on everest, then safely clear the SD card. Also use for capture-date corrections.
---

# Camera archival

## Locations

- Card: `/Volumes/CANON_DC`
- Local Nextcloud archive: `/Users/riley/Library/CloudStorage/Nextcloud-nc.rileychh.dev-何承軒/app/photos/g16`
- Uploaded archive on SSH host `everest`: `/srv/nextcloud-aio/data/riley/files/app/photos/g16`
- Nextcloud AIO: `nextcloud-aio-nextcloud`; container `/mnt/ncdata` maps to host `/srv/nextcloud-aio/data`. Confirm this mapping and that encryption is disabled before hashing storage directly.

## Workflow

1. Inventory all card photos and videos. Ignore ancillary files; never back them up.
2. Use ExifTool capture dates to copy into `YYYY/MM/original-filename`. Keep RAW/JPG pairs together. Preserve embedded dates unless the user supplies corrections; flag missing or reset-clock dates. Never overwrite different content.
3. Verify local copies against source SHA-256 hashes. Save a media-only `manifest.json` under `.card-backups/<unique-import>/` in the archive. Each `files` entry needs `source`, `archive` (relative path), `size`, and `sha256`.
4. Let Nextcloud upload. If File Provider stalls, use the WebDAV fallback below rather than waiting indefinitely. Confirm the uploaded manifest matches the local one. Run `scripts/verify_archive.py` on `everest` against the actual storage, streaming the script over SSH:

   ```sh
   ssh everest 'python3 - --manifest <server-manifest> --root /srv/nextcloud-aio/data/riley/files/app/photos/g16' \
     < ~/.agents/skills/camera-archive/scripts/verify_archive.py
   ```

   Hash photo bytes on the server, not through WebDAV. Every file must pass size and SHA-256 verification. Missing files or mismatches block clearing; never silently prune the manifest.
5. Only when the user requests clearing: recheck card inventory and source hashes, then delete the exact verified media files and obsolete Canon catalogs. Leave filesystem metadata intact; do not reformat. Confirm no camera media remains.

## WebDAV fallback

If File Provider stalls, upload verified local copies through WebDAV. Reuse a matching mount or mount with saved Keychain credentials:

```sh
osascript -e 'mount volume "https://nc.rileychh.dev/remote.php/dav/files/riley/"'
```

Confirm the endpoint and mount point with `mount -t webdav`; the archive is `<mount-point>/app/photos/g16`. Let the user handle authentication prompts; never extract credentials or bypass certificate warnings.

Copy only missing manifest-listed media and the manifest, preserving relative paths. Verify local sources and uploaded copies against manifest sizes and SHA-256 hashes. Never overwrite different content, copy ancillary files, or prune manifest entries. Re-run full server-side verification on `everest`; WebDAV readback alone does not permit clearing.

Leave existing mounts intact. Unmount temporary mounts created for the import after verification; never force-unmount.

## Date corrections

Update EXIF capture/creation/modification dates consistently; preserve time unless specified. Update corresponding XMP dates when present. Stage corrected files in the proper month, verify uploaded metadata and hashes, then remove old copies. Update the manifest while retaining the original source checksum. Remove temporary files and ExifTool backup copies.
