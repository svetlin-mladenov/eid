FROM ubuntu:14.04

CMD service pcscd start && firefox

ADD "libidprimepkcs11_1.2.3_amd64.deb" /root/
RUN apt-get update && (dpkg -i /root/libidprimepkcs11_1.2.3_amd64.deb; apt-get install --fix-broken --yes)
# Debugging tools
RUN apt-get install --yes pcsc-tools wget unzip

# RUN wget "https://freefr.dl.sourceforge.net/project/ubuntuzilla/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_51.0.1-0ubuntu1_amd64.deb"
# RUN wget "https://kent.dl.sourceforge.net/project/ubuntuzilla/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_49.0-0ubuntu1_amd64.deb"
# RUN dpkg -i firefox-mozilla-build_*.deb; apt-get install --fix-broken --yes
RUN apt-get install --yes firefox icedtea-7-plugin xvfb
RUN echo 'pref("plugin.load_flash_only", false);' >> /usr/lib/firefox/browser/defaults/preferences/syspref.js

COPY install-firefox-extension.sh /root
RUN /root/install-firefox-extension.sh "https://www.b-trust.org/web/files/richeditor/filemanager/Downloads/b_trust_tool_new.xpi"
RUN /root/install-firefox-extension.sh "https://addons.mozilla.org/firefox/downloads/latest/signtextjs/platform:2/addon-561802-latest.xpi"
# RUN /root/install-firefox-extension.sh "https://addons.mozilla.org/firefox/downloads/latest/signtextjs-plus/addon-698172-latest.xpi"

# The sign-text plugin is so buggy that requires FF to be started and restarted atleast once
RUN (xvfb-run firefox & (sleep 3; killall firefox)); exit 0
