FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://ip_forward.conf \
    file://sdl-env.conf \
"

PACKAGECONFIG:append = " networkd"
PACKAGECONFIG:append = " iptc"
PACKAGECONFIG:append = " resolved"

SRC_URI:remove:rcar-v4x = " file://add-non-owned-item-for-safe-transitioning.patch"

USERADD_ERROR_DYNAMIC = "warn"

do_install:append() {
    install -m 0644 ${WORKDIR}/ip_forward.conf ${D}${sysconfdir}/tmpfiles.d/
    install -d ${D}${sysconfdir}/systemd/system.conf.d/
    install -m 0644 ${WORKDIR}/sdl-env.conf ${D}${sysconfdir}/systemd/system.conf.d/
}
