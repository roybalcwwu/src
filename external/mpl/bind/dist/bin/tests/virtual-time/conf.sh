#!/bin/sh
#
# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# See the COPYRIGHT file distributed with this work for additional
# information regarding copyright ownership.

#
# Common configuration data for system tests, to be sourced into
# other shell scripts.
#

# Find the top of the BIND9 tree.
TOP=${SYSTEMTESTTOP:=.}/../../..

# Make it absolute so that it continues to work after we cd.
TOP=`cd $TOP && pwd`

NAMED=$TOP/bin/named/named
DIG=$TOP/bin/dig/dig
RNDC=$TOP/bin/rndc/rndc
NSUPDATE=$TOP/bin/nsupdate/nsupdate
DDNSCONFGEN=$TOP/bin/confgen/ddns-confgen
KEYGEN=$TOP/bin/dnssec/dnssec-keygen
SIGNER=$TOP/bin/dnssec/dnssec-signzone
REVOKE=$TOP/bin/dnssec/dnssec-revoke
SETTIME=$TOP/bin/dnssec/dnssec-settime
DSFROMKEY=$TOP/bin/dnssec/dnssec-dsfromkey
CHECKZONE=$TOP/bin/check/named-checkzone
CHECKCONF=$TOP/bin/check/named-checkconf

SUBDIRS="slave autosign-zsk autosign-ksk"

# PERL will be an empty string if no perl interpreter was found.
PERL=/usr/pkg/bin/perl

export NAMED DIG NSUPDATE KEYGEN SIGNER KEYSIGNER KEYSETTOOL PERL \
    SUBDIRS RNDC CHECKZONE
