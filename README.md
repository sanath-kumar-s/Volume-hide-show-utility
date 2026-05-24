# 🔒 USB Volume Hide/Show Utility

> Hide and reveal drive partitions on Windows using built-in `diskpart` — no third-party software needed.

![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D6?logo=windows) ![Batch](https://img.shields.io/badge/Script-Batch-4D4D4D) ![License](https://img.shields.io/badge/License-MIT-green)

---

## What It Does

This utility lets you instantly hide or show any drive partition by removing or assigning its drive letter via `diskpart`. Hidden partitions disappear from File Explorer but remain physically intact on disk.

**Common use cases:**
- Private or personal storage partitions
- Multi-partition USB setups (public/private split)
- Portable developer environments
- Hidden toolkits on pendrives

> ⚠️ **This does not encrypt data.** It only removes the drive letter. Data is still accessible via forensic tools or diskpart by other users with admin access.

---

## Files

| File | Description |
|------|-------------|
| `hide_volume.bat` | Lists volumes and removes a drive letter to hide it |
| `show_volume.bat` | Lists volumes and assigns a drive letter to restore it |

---

## Requirements

- Windows 10 or 11
- Administrator privileges
- `diskpart` (built into Windows by default)

---

## Usage

### Hide a Volume

The script lists all volumes. Enter the number of the volume you want to hide:

```
Volume 3   DATA   NTFS   Partition
```

Input:
```
3
```

The partition disappears from File Explorer. Data remains intact.

---

### Show a Volume

The script lists all volumes. Enter the volume number and a drive letter to assign:

```
Volume Number: 3
Drive Letter:  Z
```

The partition reappears as `Z:\` in File Explorer.

---

## ⚠️ Safety Warning

Be careful when selecting volumes. Choosing the wrong one can hide critical system partitions.

> [!NOTE]
> You can unhide the partition from the Disk Management in windows if unintentionally have hidden the wrong partition 

**Never run these scripts on:**
- EFI / System Reserved partitions
- Your Windows system drive (usually `C:`)
- Any partition you are unsure about

---
## Example Demo

### Hiding the Partition

```bat
  Volume ###  Ltr  Label         Fs     Type        Size     Status     Info
  ----------  ---  ------------  -----  ----------  -------  ---------  --------
  Volume 0     C   Windows       NTFS   Partition    476 GB  Healthy    Boot
  Volume 1     D   Work          NTFS   Partition    512 GB  Healthy
  Volume 2     E   Media         NTFS   Partition      1 TB  Healthy
  Volume 3     F   USB-Tools     FAT32  Removable      16 GB  Healthy
  Volume 4         Private       NTFS   Removable    7000 MB  Healthy

Enter the volume number to hide: 4

Microsoft DiskPart version 10.0.22621.1

Copyright (C) Microsoft Corporation.
On computer: USER-PC

Volume 4 is the selected volume.

DiskPart successfully removed the drive letter or mount point.

Done.
Press any key to continue . . .
```

---
### Showing the Partition

```bat
=========================
     LIST OF VOLUMES
=========================


Microsoft DiskPart version 10.0.22621.1

Copyright (C) Microsoft Corporation.
On computer: USER-PC

  Volume ###  Ltr  Label         Fs     Type        Size     Status     Info
  ----------  ---  ------------  -----  ----------  -------  ---------  --------
  Volume 0     C   Windows       NTFS   Partition    476 GB  Healthy    Boot
  Volume 1     D   Work          NTFS   Partition    512 GB  Healthy
  Volume 2     E   Media         NTFS   Partition      1 TB  Healthy
  Volume 3     F   USB-Tools     FAT32  Removable      16 GB  Healthy
  Volume 4         Private       NTFS   Removable    7000 MB  Healthy

Enter volume number to SHOW: 4

Enter drive letter to assign (example: Z): G

Showing volume...

Microsoft DiskPart version 10.0.22621.1

Copyright (C) Microsoft Corporation.
On computer: USER-PC

Volume 4 is the selected volume.

DiskPart successfully assigned the drive letter or mount point.

Done.
Press any key to continue . . .
```


## License

MIT — use freely and responsibly.
