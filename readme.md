Simple utility to list latest typo3 versions (+ wget/tar commands for easy copy/paste).


## Screenshot

![screenshot of the output](screenshot.png?raw=true "screenshot of the output")


## Installation

```shell
git clone https://github.com/derblub/typo3_version_checker  
sudo ln -s /path/to/typo3_version_checker/main.sh /usr/bin/t3version
```  

## Usage
```shell
t3version
```


## Output Example

```shell
$ t3version

latest_lts:        v7.6.9
latest_stable:     v7.6.9
latest_old_lts:    v6.2.25
latest_old_stable: v6.2.25

latest v6.2 LTS branch: v6.2.25 from 2016-05-24 09:57:51 UTC (released 35 days ago)
wget get.typo3.org/6.2.25 -O typo3_src-6.2.25.tar.gz 1>/dev/null 2>&1
tar xzf typo3_src-6.2.25.tar.gz 1>/dev/null 2>&1 && rm -rf typo3_src-6.2.25.tar.gz 1>/dev/null 2>&1

latest v7 LTS branch: v7.6.9 from 2016-05-24 10:05:19 UTC (released 35 days ago)
wget get.typo3.org/7.6.9 -O typo3_src-7.6.9.tar.gz 1>/dev/null 2>&1
tar xzf typo3_src-7.6.9.tar.gz 1>/dev/null 2>&1 && rm -rf typo3_src-7.6.9.tar.gz 1>/dev/null 2>&1

latest v8 branch: v8.1.2 from 2016-05-24 10:10:34 UTC (released 35 days ago)
wget get.typo3.org/8.1.2 -O typo3_src-8.1.2.tar.gz 1>/dev/null 2>&1
tar xzf typo3_src-8.1.2.tar.gz 1>/dev/null 2>&1 && rm -rf typo3_src-8.1.2.tar.gz 1>/dev/null 2>&1


Latest Typo3 Versions, parsed from https://get.typo3.org/json


```

## Requirements  

- [wget](https://www.gnu.org/software/wget/) (_to get the json-file from typo3 site_)
- [jq](https://stedolan.github.io/jq/) (_to parse the json file_)
