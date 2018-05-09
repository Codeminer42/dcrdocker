#!/bin/bash
set -e

if [[ -f "$DECRED_DATA/dcrd.conf" ]]; then
	chown $USER "$DECRED_DATA/dcrd.conf"
fi

if [[ -f "$DECRED_DATA/dcrwallet.conf" ]]; then
	chown $USER "$DECRED_DATA/dcrwallet.conf"
fi

# ensure correct ownership and linking of data directory
# we do not update group ownership here, in case users want to mount
# a host directory and still retain access to it
chown -R $USER "$DECRED_DATA"
ln -sfn "$DECRED_DATA" $DOTDCRD
ln -sfn "$DECRED_DATA" $DOTDCRWALLET
chown -h $USER $DOTDCRD
chown -h $USER $DOTDCRWALLET

if [[ "$1" == "dcrd" || "$1" == "dcrctl" || "$1" == "dcrwallet" ]]; then
	exec gosu $USER "$@"
fi
