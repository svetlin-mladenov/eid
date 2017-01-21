Easy use of digital signature

### How to use

 * Download `libidprimepkcs11_1.2.3_amd64.deb` from your digital signature provider and place it next to `start.sh`
 * Insert your secure card
 * Run


    ./start.sh

The first time you run the command it's going to take a while. After that `./start.sh` runs very quickly

### Dependancies

* docker
* lsusb
* bash

### Features

* The container is ephimeric. After you close the browser window it will self-destruct.
* No `privileged` containers
* No need to do anything manually
