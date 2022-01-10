This is a description of the steps I would normally take in order to stress test a new HDD that is being added to my NAS. 

# 1. smartctl
Smartctl is run between *every* steps of the process to monitor possible errors: 

```bash
#Short test
smartctl -t short /dev/sd?

# Check for resutls
smartctl -a /dev/sd?
```
Overall PASS is a must, but the following values are also checked: 

| ID# | ATTRIBUTE_NAME          | FLAG   | VALUE | WORST | THRESH | TYPE     | UPDATED | WHEN_FAILED | RAW_VALUE |
|-----|-------------------------|--------|-------|-------|--------|----------|---------|-------------|-----------|
| 1   | Raw_Read_Error_Rate     | 0x000b | 100   | 100   | 016    | Pre-fail | Always  | -           | 0         |
| 5   | Reallocated_Sector_Ct   | 0x0033 | 100   | 100   | 005    | Pre-fail | Always  | -           | 0         |
| 7   | Seek_Error_Rate         | 0x000a | 100   | 100   | 067    | Old_age  | Always  | -           | 0         |
| 196 | Reallocated_Event_Count | 0x0032 | 100   | 100   | 000    | Old_age  | Always  | -           | 0         |
| 197 | Current_Pending_Sector  | 0x0022 | 100   | 100   | 000    | Old_age  | Always  | -           | 0         |
| 198 | Offline_Uncorrectable   | 0x0008 | 100   | 100   | 000    | Old_age  | Offline | -           | 0         |
| 199 | UDMA_CRC_Error_Count    | 0x000a | 200   | 200   | 000    | Old_age  | Always  | -           | 0         |

# 2. badblocks
Run `badblocks` on the entire disk to check for bad sectors. Bad sectors will get reallocated and seen in the smartctl test. 

```bash
badblocks -wsv -b 4096 -t 0x55 -o ~/output_file.txt /dev/sd?
```

## temps
While runnign `badblocks`, check every 2 hours the drive temperatures: 

```bash
smartctl -l scttemp /dev/sd?
```

# 3. fio 
Mechanichal stresstest that will write at random physical location on the drive. Runs for 2h, during which the drive might get noisier than usual. 

```bash
fio --filename=/dev/sd? --name=randwrite --ioengine=sync --iodepth=1 --rw=randrw --rwmixread=50 --rwmixwrite=50 --bs=4k --direct=0 --numjobs=8 --size=300G --runtime=7200 --group_reporting
```

# 4. Final verdict
If at the end of the above, `smartctl`'s ID above are still within threshold, disk is considered in working order and proceed with formatting. 

# EXTRA - Monthly monitoring
I am also runnign the following on a monthly basis within a cronjob (with a small delay between running the test and parsing the results) to check for each drive and send the relevant SMART values above: 

```bash
0 2 9 * * /usr/sbin/smartctl --test=short /dev/sd? -d sat &> /dev/null
0 4 9 * * (/usr/sbin/smartctl -a -d sat /dev/sd?) | /bin/grep "Serial\|Firmware\|result:\|Reallocated_Sector_Ct\|Spin_Retry_Count\|Reallocated_Event_Count\|Current_Pending_Sector\|Offline_Uncorrectable\|Extended\ offline"$
```
