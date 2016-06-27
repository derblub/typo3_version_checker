#!/usr/bin/env bash
# ./main.sh 

# Exit on error. Append || true if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

### Variables
##############################################################################
__DATE=`date +"%Y-%m-%d %H:%M"`
__TYPO3_JSON_URL='get.typo3.org/json'

C1="\x1b[35m"
C2="\x1b[32m"
C3="\x1b[34m"
C4="\x1b[33m"
C5="\x1b[31m"
C6="\x1b[1;31m"
C7="\x1b[1;33;41m"
C8="\x1b[1;4;5;33;41m"
C0="\x1b[0m"

__TYPO3_JSON=$(wget -qO- ${__TYPO3_JSON_URL})

### Functions
##############################################################################

function t3_latest () {
    local version=${1}
    echo ${__TYPO3_JSON} | jq --raw-output '.["'${version}'"].latest'
}

function t3_latest_date () {
    local version=${1}
    local version_str=$(t3_latest ${version})
    echo ${__TYPO3_JSON} | jq --raw-output '.["'${version}'"].releases["'${version_str}'"].date'
}

function cleanup_before_exit () {
  #echo "Cleaning up. Done"
  exit 0
}
trap cleanup_before_exit EXIT


### Runtime
##############################################################################

__TYPO3_LATEST_62=$(t3_latest 6.2)
__TYPO3_LATEST_62_DATE=$(t3_latest_date 6.2)

__TYPO3_LATEST_7x=$(t3_latest 7)
__TYPO3_LATEST_7x_DATE=$(t3_latest_date 7)

__TYPO3_LATEST_8x=$(t3_latest 8)
__TYPO3_LATEST_8x_DATE=$(t3_latest_date 8)


echo
__T3_LATEST_LTS=$(echo ${__TYPO3_JSON} | jq --raw-output '.latest_lts')
echo -e "${C2}latest_lts:        ${C0}${C1}v${__T3_LATEST_LTS}${C0}"

__T3_LATEST_STABLE=$(echo ${__TYPO3_JSON} | jq --raw-output '.latest_stable')
echo -e "${C2}latest_stable:     ${C0}${C1}v${__T3_LATEST_STABLE}${C0}"

__T3_LATEST_OLD_LTS=$(echo ${__TYPO3_JSON} | jq --raw-output '.latest_old_lts')
echo -e "${C2}latest_old_lts:    ${C0}${C1}v${__T3_LATEST_OLD_LTS}${C0}"

__T3_LATEST_OLD_STABLE=$(echo ${__TYPO3_JSON} | jq --raw-output '.latest_old_stable')
echo -e "${C2}latest_old_stable: ${C0}${C1}v${__T3_LATEST_OLD_STABLE}${C0}"


echo
echo -e "${C6}latest v6.2 LTS branch:${C0} ${C7}v${__TYPO3_LATEST_62}${C0} ${C6}from${C0} ${C5}${__TYPO3_LATEST_62_DATE}${C0}"
echo -e "${C4}wget get.typo3.org/${__TYPO3_LATEST_62} -O typo3_src-${__TYPO3_LATEST_62}.tar.gz 1>/dev/null 2>&1${C0}"
echo -e "${C4}tar xzf typo3_src-${__TYPO3_LATEST_62}.tar.gz 1>/dev/null 2>&1 && rm -rf typo3_src-${__TYPO3_LATEST_62}.tar.gz 1>/dev/null 2>&1${C0}"
echo
echo -e "${C6}latest v7 LTS branch:${C0} ${C7}v${__TYPO3_LATEST_7x}${C0} ${C6}from${C0} ${C5}${__TYPO3_LATEST_7x_DATE}${C0}"
echo -e "${C4}wget get.typo3.org/${__TYPO3_LATEST_7x} -O typo3_src-${__TYPO3_LATEST_7x}.tar.gz 1>/dev/null 2>&1${C0}"
echo -e "${C4}tar xzf typo3_src-${__TYPO3_LATEST_7x}.tar.gz 1>/dev/null 2>&1 && rm -rf typo3_src-${__TYPO3_LATEST_7x}.tar.gz 1>/dev/null 2>&1${C0}"
echo
echo -e "${C6}latest v8 branch:${C0} ${C7}v${__TYPO3_LATEST_8x}${C0} ${C6}from${C0} ${C5}${__TYPO3_LATEST_8x_DATE}${C0}"
echo -e "${C4}wget get.typo3.org/${__TYPO3_LATEST_8x} -O typo3_src-${__TYPO3_LATEST_8x}.tar.gz 1>/dev/null 2>&1${C0}"
echo -e "${C4}tar xzf typo3_src-${__TYPO3_LATEST_8x}.tar.gz 1>/dev/null 2>&1 && rm -rf typo3_src-${__TYPO3_LATEST_8x}.tar.gz 1>/dev/null 2>&1${C0}"
echo

echo
echo -e "${C2}Latest Typo3 Versions, parsed from https://${C0}${C1}${__TYPO3_JSON_URL}${C0}"
echo