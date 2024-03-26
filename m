Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E21E51D
	for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711488148; cv=none; b=sRVUXgdlQqY+xIqI+X+TQnRAyG3NP4njiWbe2Cf9JCnG9oIToTiaLDTuGeShXZWv65CmE3/adS2zvyhvGaPmnXzoTSkKsOBz8Nupc+fkYrPrHnH+i9+AJ7Nv9oTzekIT2KDZkG1oAURZ4k/kNhbuih4r+P7jP2KB2x78mFro7JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711488148; c=relaxed/simple;
	bh=GuAyNmIT9QShSJEsbx7pCES0azlOExcc3mSpxJuxJm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ur3Lq4TteU3voy0qrf/8KgKsY/xnluRJQElJ77cMqU+Es2hKG1AGJvB/sQ4/yYP+G7pJQJGUuz+ixHgrmAVh87Kou2gTzvYle/sIJx1GLXDHepvPq+JfqF7VHSvQUbBm5IfFQHjmAvduZ2+Xzgy7JUPdcrEK1ol+oVGGn2iOftA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=tthUumId; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="tthUumId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711488139; x=1712092939; i=wahrenst@gmx.net;
	bh=7Gf/WNmpP0Tdu2ggtw7JXSGhg1v5E0rhUiMRSKUUTTI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=tthUumIdT1iVpsLK8BiXrefpoELG41HaP+AhascuZ3EH3NjpX5kvKQyO38n5Qe1n
	 d4hGxnzJUiMsiQvHWBIMfvBFvx6rw2nRWJL2GiURtepcRDTCLB84VOLpaObKxcrpo
	 FeXtiW38y1ZlftHBlte9ypV6THYfy5eb5vGAdw85KycJL96lyZ656zs6lWC+OXeLD
	 T3cJg0LkV36WZAIe91BWzl772cGPY80ZK++MlkIOlEvC36X0p/U0wkUEYHS9jpiK1
	 H8ljxAYToOcnpV0H1khTMziIisJfOaatzcasLjlhBj6XGNyGMt3k3hPmapbbgh626
	 gwqxJmFo7QdsIGMzUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72oH-1rw4o80Uhz-008Yop; Tue, 26
 Mar 2024 22:22:19 +0100
Message-ID: <d33aaed9-218e-4154-a3ca-d0d058e83be0@gmx.net>
Date: Tue, 26 Mar 2024 22:22:18 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] staging: vc04_services: vchiq_core: Stop kthreads
 on shutdown
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
 <20240321130737.898154-6-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240321130737.898154-6-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:doGqh5kYVF+ix5SQdfAcSmQePNjcGxvU5oRfbjOkIlGmdd/vaaj
 bA9dst5i5pKRL+HRyop5dmL6MXVzYsGEvYH4qGOI6n8Llclv77LNTwqOCk2Khv/NJPKHjJX
 jpBNYFuzWpBFh5LEcovpGSJQVD1j460z/ARDGaKQz98CcmBvY9YbytHYt6py29eU8tSZDyD
 dgJfcWvPvS+Nyyy9P4f3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1ahOAU8ossA=;A2JFz+cmAv/ldB8wDA77oqCkXja
 Ede4LRM3IeFJM7ELow7CaTeDSdYqKOFJSsvhntVHJRRuxOLGd8wSk9cYb2u9UIklUbcWHRfTH
 3P5CjF0hymHoJSqf7euW7sEw08DUaBuFuT1nIthElxBABp+SXDJHVlzJ0CMidF/T7EH84cPfs
 2rCQTBvDUkKOd7I8qbGMdL/RO+swDmgVLUsU6Pe1JDgmfQKYreA0/GWDG3cMxNid+0qb4CQPl
 0WQBUbbEInv4mA6RPY7E5E8klEdZ04I4yg0mS1ne5U08iDYUFGf6MpvOFuEBYiF9Chec5Ptn1
 JC+0Imrtad79jT1emNUSRZ0QWJMSUSG5B3ymzxHHmKLYQQiHfXqzZ0Uxp96eh7q2EPj9mMMIq
 wCMwV4mkjZ613QuoyQo307UvZyMj9qpJZW4ch93pJotbyBorvdA6U6/wr2Ky6Bo3hXuu2xgYL
 9QlQJceEwPa0EqPixt1vXDszd/QbIqvjTSSYXA81z+fLvb8Jc3ixdbQY+PaTonFx4vtnkW3Xq
 hmzlxQbx3V+F3oQuM6dLOmTlhkFNUiu496Z5D3UaM7yhe9uAaivCwINUGg7k4mtrDSD14zXzr
 M/04csCyD3HV5QGx7tsjRxBxwHhonBL9LkcKi8XuLL4WxwR2E7O8tgbT9nCDbQSzSf7/YjCNg
 mEkYKR9npTaNVq7zivIayxKJQLPXXLwmq4QmvaNhoWG7n8k7nddrqHd/kngdD59H8KL5Vo8b/
 /nvLP5iI4DDJSp2qs/aFNktEXd55qNPcVRbWfGWShcav89iJxPk3tLpL00B8NpVlGJfJh5q0D
 mPmCWkQSM7dTaKC6OYj7xzWf/T8sGap/9b6Qb9DWQ9ABo=

Hi Umang,

Am 21.03.24 um 14:07 schrieb Umang Jain:
> The various kthreads thread functions (slot_handler_func, sync_func,
> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
> vchiq_arm should be stopped on vchiq_shutdown().
>
> This also address the following TODO item:
>   * Fix kernel module support
>
> hence drop it from the TODO item list.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

i applied this series on top of Linux 6.9-rc1 and it seems to corrupt
the VideoCore firmware (at least on Raspberry Pi 3 B+ /
multi_v7_defconfig + all VCHIQ modules) so badly that X on Raspberry Pi
OS (32 bit, Bullseye) doesn't start:

[   10.670310] vchiq: module is from the staging directory, the quality
is unknown, you have been warned.
[   10.983666] usbcore: registered new device driver onboard-usb-hub
[   10.983915] usb 1-1.1: USB disconnect, device number 3
[   10.983931] usb 1-1.1.1: USB disconnect, device number 6
[   10.988341] Bluetooth: Core ver 2.22
[   10.988469] NET: Registered PF_BLUETOOTH protocol family
[   10.988479] Bluetooth: HCI device and connection manager initialized
[   10.988501] Bluetooth: HCI socket layer initialized
[   10.988513] Bluetooth: L2CAP socket layer initialized
[   10.988530] Bluetooth: SCO socket layer initialized
[   11.038416] Bluetooth: HCI UART driver ver 2.3
[   11.038447] Bluetooth: HCI UART protocol H4 registered
[   11.038833] Bluetooth: HCI UART protocol Broadcom registered
[   11.040011] hci_uart_bcm serial0-0: supply vbat not found, using
dummy regulator
[   11.040155] hci_uart_bcm serial0-0: supply vddio not found, using
dummy regulator
[   11.120024] usb 1-1.1.2: USB disconnect, device number 5
[   11.136892] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[   11.160172] usb 1-1.3: USB disconnect, device number 4
[   11.331526] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   11.333122] Loaded X.509 cert 'wens:
61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   11.384304] brcmfmac: brcmf_fw_alloc_request: using
brcm/brcmfmac43455-sdio for chip BCM4345/6
[   11.418684] Bluetooth: hci0: BCM: chip id 107
[   11.418993] Bluetooth: hci0: BCM: features 0x2f
[   11.420509] Bluetooth: hci0: BCM4345C0
[   11.420533] Bluetooth: hci0: BCM4345C0 (003.001.025) build 0000
[   11.424274] Console: switching to colour dummy device 80x30
[   11.437793] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
[   11.441693] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4=
])
[   11.441938] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
[   11.442151] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
[   11.442330] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops
vc4_crtc_ops [vc4])
[   11.442509] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops
vc4_crtc_ops [vc4])
[   11.442681] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops
vc4_crtc_ops [vc4])
[   11.442826] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
[   11.446831] cfg80211: loaded regulatory.db is malformed or signature
is missing/invalid
[   11.448067] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
[   11.461177] Bluetooth: hci0: BCM4345C0
'brcm/BCM4345C0.raspberrypi,3-model-b-plus.hcd' Patch
[   11.554003] Console: switching to colour frame buffer device 240x75
[   11.586937] vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
[   11.690580] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob
available (err=3D-2)
[   11.691029] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0:
Nov  1 2021 00:37:25 version 7.45.241 (1a2f2fa CY) FWID 01-703fd60
[   11.851054] hub 1-1:1.0: USB hub found
[   11.851192] hub 1-1:1.0: 4 ports detected
[   11.854947] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
found, using dummy regulator
[   11.866465] hub 1-1:1.0: USB hub found
[   11.867729] hub 1-1:1.0: 4 ports detected
[   11.880932] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1:
supply vdd not found, using dummy regulator
[   12.198004] usb 1-1.1: new high-speed USB device number 7 using dwc2
[   12.413343] hub 1-1.1:1.0: USB hub found
[   12.417836] hub 1-1.1:1.0: 3 ports detected
[   12.521956] Bluetooth: hci0: BCM: features 0x2f
[   12.523795] Bluetooth: hci0: BCM43455 37.4MHz Raspberry Pi 3+-0190
[   12.523821] Bluetooth: hci0: BCM4345C0 (003.001.025) build 0382
[   12.708052] usb 1-1.3: new low-speed USB device number 8 using dwc2
[   12.870179] input: HID 046a:0011 as
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011=
.0003/input/input2
[   12.940173] hid-generic 0003:046A:0011.0003: input: USB HID v1.11
Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
[   12.948025] usb 1-1.1.2: new low-speed USB device number 9 using dwc2
[   13.095578] input: PixArt Microsoft USB Optical Mouse as
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003=
:045E:00CB.0004/input/input3
[   13.095764] hid-generic 0003:045E:00CB.0004: input: USB HID v1.11
Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input=
0
[   13.388013] usb 1-1.1.1: new high-speed USB device number 10 using dwc2
[   13.497783] snd_bcm2835: module is from the staging directory, the
quality is unknown, you have been warned.
[   13.505953] bcm2835-audio bcm2835-audio: card created with 8 channels
[   13.806061] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized):
No External EEPROM. Setting MAC Speed
[   15.033962] mc: Linux media interface: v0.10
[   16.894910] videodev: Linux video capture interface: v2.00
[   17.061120] bcm2835_mmal_vchiq: module is from the staging directory,
the quality is unknown, you have been warned.
[   17.214469] bcm2835_v4l2: module is from the staging directory, the
quality is unknown, you have been warned.
[   17.222047] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf
unexpected msgid 0@58908716,0

I also noticed that not all vchiq kthreads are functional and a vcgencmd
command from the startup is hanging endlessly:

   PID TTY      STAT   TIME COMMAND
     1 ?        Ss     0:05 /sbin/init splash
     2 ?        S      0:00 [kthreadd]
     3 ?        S      0:00 [pool_workqueue_release]
     4 ?        I<     0:00 [kworker/R-rcu_g]
     5 ?        I<     0:00 [kworker/R-slub_]
     6 ?        I      0:00 [kworker/0:0-events_freezable]
     8 ?        I      0:00 [kworker/0:1-cgroup_destroy]
     9 ?        I      0:00 [kworker/u16:0-ipv6_addrconf]
    10 ?        I<     0:00 [kworker/R-mm_pe]
    11 ?        S      0:00 [ksoftirqd/0]
    12 ?        I      0:00 [rcu_sched]
    13 ?        S      0:00 [rcu_exp_par_gp_kthread_worker/0]
    14 ?        S      0:00 [rcu_exp_gp_kthread_worker]
    15 ?        S      0:00 [migration/0]
    16 ?        S      0:00 [cpuhp/0]
    17 ?        S      0:00 [cpuhp/1]
    18 ?        S      0:00 [migration/1]
    19 ?        S      0:00 [ksoftirqd/1]
    20 ?        I      0:00 [kworker/1:0-pm]
    22 ?        S      0:00 [cpuhp/2]
    23 ?        S      0:00 [migration/2]
    24 ?        S      0:00 [ksoftirqd/2]
    26 ?        I<     0:00 [kworker/2:0H-kblockd]
    27 ?        S      0:00 [cpuhp/3]
    28 ?        S      0:00 [migration/3]
    29 ?        S      0:00 [ksoftirqd/3]
    30 ?        I      0:00 [kworker/3:0-events]
    32 ?        I      0:01 [kworker/u17:0-async]
    33 ?        I      0:00 [kworker/u18:0-events_unbound]
    34 ?        I      0:00 [kworker/u19:0-events_unbound]
    35 ?        I      0:00 [kworker/u20:0-writeback]
    36 ?        S      0:00 [kdevtmpfs]
    37 ?        I<     0:00 [kworker/R-inet_]
    38 ?        I      0:00 [kworker/u17:1-events_unbound]
    39 ?        S      0:00 [oom_reaper]
    40 ?        I<     0:00 [kworker/R-write]
    41 ?        S      0:00 [kcompactd0]
    42 ?        I<     0:00 [kworker/R-kbloc]
    43 ?        I<     0:00 [kworker/R-ata_s]
    44 ?        I<     0:00 [kworker/R-edac-]
    45 ?        I<     0:00 [kworker/R-devfr]
    46 ?        I      0:00 [kworker/3:1-mm_percpu_wq]
    47 ?        S      0:00 [watchdogd]
    48 ?        I      0:00 [kworker/u20:1-writeback]
    49 ?        I      0:00 [kworker/1:1-events_power_efficient]
    50 ?        I<     0:00 [kworker/R-rpcio]
    51 ?        I<     0:00 [kworker/1:1H-kblockd]
    52 ?        I<     0:00 [kworker/R-xprti]
    53 ?        S      0:00 [kswapd0]
    54 ?        I      0:00 [kworker/u18:1-events_unbound]
    55 ?        I<     0:00 [kworker/R-nfsio]
    56 ?        I      0:00 [kworker/u17:2-events_unbound]
    58 ?        S      0:00 [hwrng]
    61 ?        S      0:00 [irq/113-mmc0]
    62 ?        I<     0:00 [kworker/R-mld]
    63 ?        I<     0:00 [kworker/R-ipv6_]
    64 ?        I      0:00 [kworker/u16:1]
    65 ?        I<     0:00 [kworker/R-mmc_c]
    67 ?        I<     0:00 [kworker/0:1H-kblockd]
    68 ?        I      0:00 [kworker/1:2-events]
    69 ?        I<     0:00 [kworker/u21:0-hci0]
    70 ?        I<     0:00 [kworker/u22:0]
    71 ?        I<     0:00 [kworker/u23:0]
    72 ?        I<     0:00 [kworker/u24:0]
    73 ?        I<     0:00 [kworker/u25:0]
    74 ?        I<     0:00 [kworker/R-sdhci]
    75 ?        S      0:00 [irq/119-mmc1]
    77 ?        I      0:00 [kworker/2:2-events]
    79 ?        I      0:00 [kworker/2:4-events]
    80 ?        I      0:00 [kworker/0:2-events]
    81 ?        S      0:00 [jbd2/mmcblk0p2-8]
    82 ?        I<     0:00 [kworker/R-ext4-]
    91 ?        I<     0:00 [kworker/0:2H-kblockd]
    97 ?        I<     0:00 [kworker/3:1H-mmc_complete]
    98 ?        I<     0:00 [kworker/3:2H]
   124 ?        Ss     0:00 /lib/systemd/systemd-journald
   131 ?        I      0:00 [kworker/3:2-events]
   138 ?        I      0:00 [kworker/u19:1-writeback]
   145 ?        I<     0:00 [kworker/2:2H-kblockd]
   146 ?        I      0:00 [kworker/u20:2-events_unbound]
   149 ?        Ss     0:04 /lib/systemd/systemd-udevd
   150 ?        I<     0:00 [kworker/1:2H-kblockd]
   151 ?        S      0:00 /lib/systemd/systemd-udevd
   152 ?        S      0:01 /lib/systemd/systemd-udevd
   153 ?        S      0:01 /lib/systemd/systemd-udevd
   154 ?        S      0:01 /lib/systemd/systemd-udevd
   156 ?        S      0:00 /lib/systemd/systemd-udevd
   157 ?        S      0:00 /lib/systemd/systemd-udevd
   158 ?        S      0:00 /lib/systemd/systemd-udevd
   159 ?        S      0:01 /lib/systemd/systemd-udevd
   160 ?        D      0:01 /lib/systemd/systemd-udevd
   161 ?        S      0:01 /lib/systemd/systemd-udevd
   211 ?        I<     0:00 [kworker/R-cfg80]
   212 ?        I<     0:00 [kworker/R-brcmf]
   213 ?        S      0:00 [brcmf_wdog/mmc1:0001:1]
   214 ?        S      0:00 [card0-crtc0]
   215 ?        S      0:00 [card0-crtc1]
   216 ?        S      0:00 [card0-crtc2]
   217 ?        S      0:00 [card0-crtc3]
   220 ?        I      0:00 [kworker/0:3-pm]
   221 ?        I<     0:00 [kworker/u21:3-hci0]
   223 ?        I      0:00 [kworker/u19:2-events_unbound]
   253 ?        D      0:00 [vchiq-keep/0]
   269 ?        S      0:00 [irq/126-usb-001:010:01]
   298 ?        I      0:00 [kworker/3:3-events]
   302 ?        Ssl    0:00 /lib/systemd/systemd-timesyncd
   307 ?        I<     0:00 [kworker/R-mmal-]
   346 ?        Ss     0:00 avahi-daemon: running [raspberrypi.local]
   347 ?        Ss     0:00 /usr/sbin/cron -f
   348 ?        Ss     0:00 /usr/bin/dbus-daemon --system
=2D-address=3Dsystemd: --nofork --nopidfile --systemd-activation --syslog-=
only
   354 ?        Ssl    0:00 /usr/libexec/polkitd --no-debug
   363 ?        Ssl    0:00 /usr/sbin/rsyslogd -n -iNONE
   364 ?        Ss     0:00 /lib/systemd/systemd-logind
   365 ?        Ss     0:00 /usr/sbin/thd --triggers
/etc/triggerhappy/triggers.d/ --socket /run/thd.socket --user nobody
=2D-deviceglob /dev/input/event*
   366 ?        Ssl    0:00 /usr/libexec/udisks2/udisksd
   367 ?        Ss     0:00 /sbin/wpa_supplicant -u -s -O
/run/wpa_supplicant
   391 ?        Ss     0:00 /usr/sbin/dhcpcd -b -q
   394 ?        S      0:00 avahi-daemon: chroot helper
   424 ?        Ss     0:00 /usr/libexec/bluetooth/bluetoothd
   466 ?        SLsl   0:00 /usr/sbin/rngd -r /dev/hwrng
   486 ?        Ss     0:00 /usr/sbin/cupsd -l
   489 ?        Ss     0:00 wpa_supplicant -B
-c/etc/wpa_supplicant/wpa_supplicant.conf -iwlan0
   498 ?        Ssl    0:00 /usr/sbin/lightdm
   506 ?        I      0:00 [kworker/3:4]
   507 ?        Ssl    0:00 /usr/sbin/ModemManager
   515 ?        Ss     0:00 sshd: /usr/sbin/sshd -D [listener] 0 of
10-100 startups
   520 ?        I<     0:00 [kworker/R-crypt]
   521 tty7     Ssl+   0:00 /usr/lib/xorg/Xorg :0 -seat seat0 -auth
/var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch
   522 tty1     Ss     0:00 /bin/login -f
   527 ttyS1    Ss     0:00 /bin/login -p --
   533 ?        S      0:00 /usr/lib/cups/notifier/dbus dbus://
   534 ?        S      0:00 /usr/lib/cups/notifier/dbus dbus://
   535 ?        Ssl    0:00 /usr/sbin/cups-browsed
   544 ?        I      0:00 [kworker/u19:3]
   553 ?        Ss     0:01 /lib/systemd/systemd --user
   557 ?        S      0:00 (sd-pam)
   594 ?        I      0:00 [kworker/u20:3]
   596 ?        Sl     0:00 lightdm --session-child 14 17
   597 ?        S<sl   0:00 /usr/bin/pipewire
   604 ?        S<sl   0:00 /usr/bin/pulseaudio --daemonize=3Dno
=2D-log-target=3Djournal
   606 ?        SNsl   0:00 /usr/libexec/rtkit-daemon
   612 tty1     S+     0:00 -bash
   615 ?        Ss     0:00 /bin/sh /usr/bin/x-session-manager
   626 ?        Ss     0:00 /usr/bin/dbus-daemon --session
=2D-address=3Dsystemd: --nofork --nopidfile --systemd-activation --syslog-=
only
   640 ?        S<l    0:00 /usr/bin/pipewire-media-session
   645 ?        I      0:00 [kworker/u17:3-events_unbound]
   684 ?        Ss     0:00 /usr/bin/ssh-agent x-session-manager
   703 ?        S      0:00 /bin/sh /usr/bin/x-session-manager
   704 ?        D      0:00 vcgencmd get_config total_mem
   705 ?        S      0:00 cut -d=3D -f2
   706 ?        I      0:00 [kworker/0:4]
   732 ttyS1    S      0:00 -bash
   751 ttyS1    R+     0:00 ps ax

All patches of this series before this one are fine. Just this one is bad.

Regards
