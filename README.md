# UDMPRO-samba

Samba server on UDM-Pro using the drive bay.

## Installation

1. Install [on_boot.d](https://github.com/boostchicken/udm-utilities) as well as [CNI plugins](https://github.com/boostchicken-dev/udm-utilities/blob/master/cni-plugins/05-install-cni-plugins.sh) and [CNI bridge](https://github.com/boostchicken-dev/udm-utilities/blob/master/on-boot-script/examples/udm-networking/on_boot.d/05-cni-bridge.sh) scripts using:

    ```bash
    curl -fsL "https://raw.githubusercontent.com/boostchicken/udm-utilities/HEAD/on-boot-script/remote_install.sh" | /bin/sh
    ```

2. Download [20-samba.sh](https://raw.githubusercontent.com/thealpa/UDMPRO-samba/udmsamba-master/20-samba.sh) to your UDM-Pro in `/mnt/data/on_boot.d`:

    ```bash
    curl "https://raw.githubusercontent.com/thealpa/UDMPRO-samba/udmsamba-master/20-samba.sh" -o /mnt/data/on_boot.d/20-samba.sh
    ```

3. (Optional) Adjust any settings if you want:

    ```bash
    vi /mnt/data/on_boot.d/20-samba.sh
    ```
    
    I highly recommend changing the default credentials.  

4. Set permissions to executable:

    ```bash
    chmod +x /mnt/data/on_boot.d/20-samba.sh
    ```

5. Run the script:

    ```bash
    sh /mnt/data/on_boot.d/20-samba.sh
    ```

## Usage

Connect to your UDM-PRO samba server:

`smb://<your_udm_ip>/Shared/`

The defaults credentials are `user` and `password`.
If you need more configuration options please refer to the [dperson/samba](https://hub.docker.com/r/dperson/samba) docker image.

## Issues

`ERRO[0000] unable to get systemd connection to add healthchecks`

Can be ignored. The `--no-healthcheck` option could be used to hide the error when using a newer podman version.

`Error adding network: failed to create bridge "cni0": could not add "cni0": operation not supported`

Make sure to execute the [CNI plugins](https://github.com/boostchicken-dev/udm-utilities/blob/master/cni-plugins/05-install-cni-plugins.sh) and [CNI bridge](https://github.com/boostchicken-dev/udm-utilities/blob/master/on-boot-script/examples/udm-networking/on_boot.d/05-cni-bridge.sh) scripts first.


## ✌️
