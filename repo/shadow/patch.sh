PKGDIR=./pkg
PATCHDIR=./overlay

echo "Patching useradd behavior"
sed -i 's/yes/no/' $PKGDIR/etc/default/useradd

echo "Patching login.defs behaviour"
for FUNCTION in FAIL_DELAY               \
                FAILLOG_ENAB             \
                LASTLOG_ENAB             \
                MAIL_CHECK_ENAB          \
                OBSCURE_CHECKS_ENAB      \
                PORTTIME_CHECKS_ENAB     \
                QUOTAS_ENAB              \
                CONSOLE MOTD_FILE        \
                FTMP_FILE NOLOGINS_FILE  \
                ENV_HZ PASS_MIN_LEN      \
                SU_WHEEL_ONLY            \
                CRACKLIB_DICTPATH        \
                PASS_CHANGE_TRIES        \
                PASS_ALWAYS_WARN         \
                CHFN_AUTH ENCRYPT_METHOD \
                ENVIRON_FILE
do
    sed -i "s/^${FUNCTION}/# &/" $PKGDIR/etc/login.defs
done

echo "Patching login.access"
[ -f $PKGDIR/etc/login.access ] && mv -v $PKGDIR/etc/login.access{,.NOUSE}

echo "Patching limits"
[ -f $PKGDIR/etc/limits ] && mv -v $PKGDIR/etc/limits{,.NOUSE}

echo "Overlaying"
rsync -a $PATCHDIR/* $PKGDIR/


