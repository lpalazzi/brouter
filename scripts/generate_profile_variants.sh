#!/bin/sh
cd "$(dirname "$0")"
cd ../misc/profiles2

# preferBikeFriendly & !preferCycleRoutes
sed -e "s/^assign[[:space:]]\+preferBikeFriendly.*\(#.*\)/assign preferBikeFriendly = true \1/" safecycle.brf > safecycle-pbf.brf
sed -e "s/^assign[[:space:]]\+strictUnpaved.*\(#.*\)/assign strictUnpaved = true \1/" safecycle-pbf.brf > safecycle-pbf-stup.brf
sed -e "s/^assign[[:space:]]\+preferUnpaved.*\(#.*\)/assign preferUnpaved = true \1/" safecycle-pbf.brf > safecycle-pbf-prup.brf
sed -e "s/^assign[[:space:]]\+preferPaved.*\(#.*\)/assign preferPaved = true \1/" safecycle-pbf.brf > safecycle-pbf-prp.brf
sed -e "s/^assign[[:space:]]\+strictPaved.*\(#.*\)/assign strictPaved = true \1/" safecycle-pbf.brf > safecycle-pbf-stp.brf


# !preferBikeFriendly & preferCycleRoutes
sed -e "s/^assign[[:space:]]\+preferCycleRoutes.*\(#.*\)/assign preferCycleRoutes = true \1/" safecycle.brf > safecycle-pcr.brf
sed -e "s/^assign[[:space:]]\+strictUnpaved.*\(#.*\)/assign strictUnpaved = true \1/" safecycle-pcr.brf > safecycle-pcr-stup.brf
sed -e "s/^assign[[:space:]]\+preferUnpaved.*\(#.*\)/assign preferUnpaved = true \1/" safecycle-pcr.brf > safecycle-pcr-prup.brf
sed -e "s/^assign[[:space:]]\+preferPaved.*\(#.*\)/assign preferPaved = true \1/" safecycle-pcr.brf > safecycle-pcr-prp.brf
sed -e "s/^assign[[:space:]]\+strictPaved.*\(#.*\)/assign strictPaved = true \1/" safecycle-pcr.brf > safecycle-pcr-stp.brf

# preferBikeFriendly & preferCycleRoutes
sed -e "s/^assign[[:space:]]\+preferCycleRoutes.*\(#.*\)/assign preferCycleRoutes = true \1/" safecycle-pbf.brf > safecycle-pbf-pcr.brf
sed -e "s/^assign[[:space:]]\+strictUnpaved.*\(#.*\)/assign strictUnpaved = true \1/" safecycle-pbf-pcr.brf > safecycle-pbf-pcr-stup.brf
sed -e "s/^assign[[:space:]]\+preferUnpaved.*\(#.*\)/assign preferUnpaved = true \1/" safecycle-pbf-pcr.brf > safecycle-pbf-pcr-prup.brf
sed -e "s/^assign[[:space:]]\+preferPaved.*\(#.*\)/assign preferPaved = true \1/" safecycle-pbf-pcr.brf > safecycle-pbf-pcr-prp.brf
sed -e "s/^assign[[:space:]]\+strictPaved.*\(#.*\)/assign strictPaved = true \1/" safecycle-pbf-pcr.brf > safecycle-pbf-pcr-stp.brf
