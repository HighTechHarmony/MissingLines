# Missing lines diff utility
You have 2 files with lots of lines.  You want to know what lines are present in file 2 that are not presenting in file 1, regardless of order.

## Usage
perl MissingFiles.pl [file 1] [file 2]

Where:
File 1 is the file that is missing certain lines that are present in File 2.

## Output
Lines that are in file 2 that are not in file 1.  

## Notes
To be clear, an exact match is required.  If the line in file 2 is different in anyway from that of file 1, in is considered missing. 
For example:

```
File 1    File2
-----     -----
Foo       Foo
Bar       BAR

Output:
BAR
```

The order of the output lines may differ from that of the files.  Specifically, they are not guaranteed to be in the same order the missing lines are found to be in.
