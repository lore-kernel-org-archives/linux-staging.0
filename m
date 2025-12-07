Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9129013A244;
	Sun,  7 Dec 2025 00:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765068613; cv=none; b=ubEU+7IryZOEoIY4/q3hVsa0LIYzGmVr+sZ7ScNFLFOpWLK+n1kpbLKcUudiR20MSgmW8kDSYIzP7DHPzEhKWngSe83p/hyLqtba0ufPsQVsvUiy6+ml7bqqgmAaY+/1L8iZXOvB1jz7flegfzsOsU/GuSrCB8xsMgooOTB8c00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765068613; c=relaxed/simple;
	bh=P90ZYnBEwjogpEGEKkKItj3Uw5PHCtpQVXZmimjfyKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjwOGK8WNBqpGdgWZCN3jElOPbG+8e0n5E+LNYK0jgquO1agVgouBQ5uu1IcLhmg4l8Qt+SyFX7eJoV3bayEfojXg83rriupl8GGv2TVKssLeTz83E/gvV4i7Y930tFriZsViQe4jMq+98b70WukgzXJ1xzDjhYUXoyM84H4Mvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z6WZLHpp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z6WZLHpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A0CC4CEF5;
	Sun,  7 Dec 2025 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765068613;
	bh=P90ZYnBEwjogpEGEKkKItj3Uw5PHCtpQVXZmimjfyKQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Z6WZLHppKhmeDqQyXEbRp0CONjP7qC7lcg3waO2hMAq+cY/KuLcXCWPYSNlPBhiF5
	 Vfk5Epy++4PvGEjlni/nlqGS0YyW/EXO/lkobKjUNBK+RKFFPhcXVIxPEJSQ2sNEfn
	 zdkaf98HE5v0Jlz3Q+xFGstWI+JY6FgengheUEAI=
Date: Sun, 7 Dec 2025 09:50:10 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver updates for 6.19-rc1
Message-ID: <aTTPQvLHK-amzrEA@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.19-rc1

for you to fetch changes up to 502ddcc405b69fa92e0add6c1714d654504f6fd7:

  staging: rtl8723bs: fix out-of-bounds read in OnBeacon ESR IE parsing (2025-11-27 15:16:37 +0100)

----------------------------------------------------------------
Staging driver updates for 6.19-rc1

Here is the big set of staging driver updates for 6.19-rc1.  Only thing
"major" in here is that two subsystems, gpib and vc04 have moved out of
the staging tree into the "real" portion of the kernel, which is great
to see.  Other than that, the rest of the changes are just tiny coding
style cleanups, nothing earth-shattering.

All of these have been in linux-next for a while with no reported
problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Adam Quandour (1):
      staging: gpib: Clean-up commented-out code

Ahmet Sezgin Duran (1):
      staging: sm750fb: rename camel case identifiers

Akiyoshi Kurita (2):
      staging: rtl8723bs: sdio: clarify OQT free page comment
      staging: gpib: tms9914: Fix typo in comment

Artur Stupa (2):
      staging: rtl8723bs: core: fix block comment style issues
      staging: rtl8723bs: core: delete commented-out code

Bryant Boatright (1):
      staging: rtl8723bs: Rename camel case functions.

Cristian Del Gobbo (2):
      staging: sm750fb: align sm750_hw_cursor_set_size() arguments
      staging: sm750fb: avoid chained assignment in setcolreg()

Dan Carpenter (1):
      staging: vchiq_arm: delete unnecessary check

Dave Penkler (4):
      staging: gpib: Change // comments in uapi header file
      staging: gpib: Update TODO file
      staging: gpib: Fix SPDX license for gpib headers
      staging: gpib: Destage gpib

Dharanitharan R (1):
      staging: rtl8723bs: use ether_addr_copy() for MAC address copying

Emre Cecanpunar (1):
      staging: nvec: remove NVEC_PS2_DEBUG and dead debug macro

Greg Kroah-Hartman (1):
      Merge 6.18-rc3 into staging-next

Jai Luthra (6):
      staging: vc04_services: Drop bcm2835-camera driver
      staging: vchiq_arm: Remove bcm2835_camera from vchiq
      include: linux: Destage VCHIQ interface headers
      staging: vc04_services: Cleanup VCHIQ TODO entries
      platform/raspberrypi: Destage VCHIQ interface
      platform/raspberrypi: Destage VCHIQ MMAL driver

Jianglei Nie (1):
      staging: fbtft: core: fix potential memory leak in fbtft_probe_common()

Johan Hovold (1):
      staging: most: remove broken i2c driver

Josephine Pfeiffer (1):
      staging: rtl8723bs: Add missing MODULE_DESCRIPTION()

Michael Straube (2):
      staging: rtl8723bs: rtw_hal_set_def_var is not used
      staging: rtl8723bs: fall back to random mac address

Navaneeth K (8):
      staging: rtl8723bs: remove unused registry and BSSID offset macros
      staging: rtl8723bs: use standard offsetof in cfg80211 operations
      staging: rtl8723bs: remove dead commented code from odm.c
      staging: rtl8723bs: replace FIELD_OFFSET usage with offsetof in rtw_mlme_ext.c
      staging: rtl8723bs: remove custom FIELD_OFFSET macro
      staging: rtl8723bs: fix out-of-bounds read in rtw_get_ie() parser
      staging: rtl8723bs: fix stack buffer overflow in OnAssocReq IE parsing
      staging: rtl8723bs: fix out-of-bounds read in OnBeacon ESR IE parsing

Nirbhay Sharma (1):
      staging: greybus: uart: check return values during probe

Ovidiu Panait (6):
      staging: axis-fifo: add compatible strings for v4.2 and v4.3
      staging: axis-fifo: simplify interrupt handling
      staging: axis-fifo: remove unneeded irq field from struct axis_fifo
      staging: axis-fifo: remove get_dts_property() helper
      staging: axis-fifo: drop redundant read/write_flags from axis_fifo
      staging: axis-fifo: drop debug print of remapped base address

Phil Elwell (1):
      staging: vchiq_arm: Improve inline documentation

Rodrigo Gobbi (3):
      staging: rtl8723bs: Remove commented ifdef CONFIG_WAPI_SUPPORT
      staging: rtl8723bs: Remove unsupported PALTFORM_OS_WINCE ifdef
      staging: rtl8723bs: remove todo/note and duplicated EFUSE_CTRL macro

Rohan Tripathi (6):
      staging: rtl8723bs: remove unnecessary blank lines in rtw_ap.c
      staging: rtl8723bs: add missing blank line in rtw_ap.c
      staging: rtl8723bs: remove dead code in rtw_ap.c
      staging: rtl8723bs: fix lines starting with '(' in rtw_ap.c
      staging: rtl8723bs: add spaces around '+' operator in rtw_ap.c
      staging: rtl8723bs: wrap long comments in rtw_ap.c

Sameeksha Sankpal (1):
      staging: rtl8723bs: Fix operator spacing in rtw_security.c

 MAINTAINERS                                        |    6 +-
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/{staging => }/gpib/Kconfig                 |    8 +-
 drivers/{staging => }/gpib/Makefile                |    2 +-
 drivers/{staging => }/gpib/TODO                    |   14 -
 drivers/{staging => }/gpib/agilent_82350b/Makefile |    0
 .../gpib/agilent_82350b/agilent_82350b.c           |    0
 .../gpib/agilent_82350b/agilent_82350b.h           |    0
 drivers/{staging => }/gpib/agilent_82357a/Makefile |    0
 .../gpib/agilent_82357a/agilent_82357a.c           |    0
 .../gpib/agilent_82357a/agilent_82357a.h           |    0
 drivers/{staging => }/gpib/cb7210/Makefile         |    0
 drivers/{staging => }/gpib/cb7210/cb7210.c         |   12 -
 drivers/{staging => }/gpib/cb7210/cb7210.h         |    0
 drivers/{staging => }/gpib/cec/Makefile            |    0
 drivers/{staging => }/gpib/cec/cec.h               |    0
 drivers/{staging => }/gpib/cec/cec_gpib.c          |    0
 drivers/{staging => }/gpib/common/Makefile         |    0
 drivers/{staging => }/gpib/common/gpib_os.c        |    0
 drivers/{staging => }/gpib/common/iblib.c          |    0
 drivers/{staging => }/gpib/common/ibsys.h          |    0
 drivers/{staging => }/gpib/eastwood/Makefile       |    0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.c   |    0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.h   |    0
 drivers/{staging => }/gpib/fmh_gpib/Makefile       |    0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c     |    0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h     |    0
 drivers/{staging => }/gpib/gpio/Makefile           |    0
 drivers/{staging => }/gpib/gpio/gpib_bitbang.c     |    0
 drivers/{staging => }/gpib/hp_82335/Makefile       |    0
 drivers/{staging => }/gpib/hp_82335/hp82335.c      |    0
 drivers/{staging => }/gpib/hp_82335/hp82335.h      |    0
 drivers/{staging => }/gpib/hp_82341/Makefile       |    0
 drivers/{staging => }/gpib/hp_82341/hp_82341.c     |    0
 drivers/{staging => }/gpib/hp_82341/hp_82341.h     |    0
 drivers/{staging => }/gpib/include/amcc5920.h      |    0
 drivers/{staging => }/gpib/include/amccs5933.h     |    0
 drivers/{staging => }/gpib/include/gpibP.h         |    4 +-
 drivers/{staging => }/gpib/include/gpib_cmd.h      |    0
 drivers/{staging => }/gpib/include/gpib_pci_ids.h  |    0
 drivers/{staging => }/gpib/include/gpib_proto.h    |    0
 .../gpib/include/gpib_state_machines.h             |    0
 drivers/{staging => }/gpib/include/gpib_types.h    |    2 +-
 drivers/{staging => }/gpib/include/nec7210.h       |    0
 .../{staging => }/gpib/include/nec7210_registers.h |    0
 drivers/{staging => }/gpib/include/plx9050.h       |    0
 drivers/{staging => }/gpib/include/quancom_pci.h   |    0
 drivers/{staging => }/gpib/include/tms9914.h       |    0
 .../{staging => }/gpib/include/tnt4882_registers.h |    0
 drivers/{staging => }/gpib/ines/Makefile           |    0
 drivers/{staging => }/gpib/ines/ines.h             |    0
 drivers/{staging => }/gpib/ines/ines_gpib.c        |    0
 drivers/{staging => }/gpib/lpvo_usb_gpib/Makefile  |    0
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c             |    0
 drivers/{staging => }/gpib/nec7210/Makefile        |    0
 drivers/{staging => }/gpib/nec7210/board.h         |    0
 drivers/{staging => }/gpib/nec7210/nec7210.c       |    0
 drivers/{staging => }/gpib/ni_usb/Makefile         |    0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c    |    0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h    |    0
 drivers/{staging => }/gpib/pc2/Makefile            |    0
 drivers/{staging => }/gpib/pc2/pc2_gpib.c          |    0
 drivers/{staging => }/gpib/tms9914/Makefile        |    0
 drivers/{staging => }/gpib/tms9914/tms9914.c       |    2 +-
 drivers/{staging => }/gpib/tnt4882/Makefile        |    0
 drivers/{staging => }/gpib/tnt4882/mite.c          |    0
 drivers/{staging => }/gpib/tnt4882/mite.h          |    0
 drivers/{staging => }/gpib/tnt4882/tnt4882_gpib.c  |    0
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/raspberrypi/Kconfig               |   52 +
 drivers/platform/raspberrypi/Makefile              |   15 +
 .../raspberrypi/vchiq-interface}/TESTING           |    0
 drivers/platform/raspberrypi/vchiq-interface/TODO  |    4 +
 .../raspberrypi/vchiq-interface}/vchiq_arm.c       |   20 +-
 .../raspberrypi/vchiq-interface}/vchiq_bus.c       |    4 +-
 .../raspberrypi/vchiq-interface}/vchiq_core.c      |    9 +-
 .../raspberrypi/vchiq-interface}/vchiq_debugfs.c   |    6 +-
 .../raspberrypi/vchiq-interface}/vchiq_dev.c       |    7 +-
 .../raspberrypi/vchiq-interface}/vchiq_ioctl.h     |    3 +-
 .../raspberrypi}/vchiq-mmal/Kconfig                |    0
 .../raspberrypi}/vchiq-mmal/Makefile               |    0
 .../raspberrypi}/vchiq-mmal/mmal-common.h          |    0
 .../raspberrypi}/vchiq-mmal/mmal-encodings.h       |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg-common.h      |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg-format.h      |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg-port.h        |    0
 .../raspberrypi}/vchiq-mmal/mmal-msg.h             |    0
 .../raspberrypi}/vchiq-mmal/mmal-parameters.h      |    0
 .../raspberrypi}/vchiq-mmal/mmal-vchiq.c           |    5 +-
 .../raspberrypi}/vchiq-mmal/mmal-vchiq.h           |    0
 drivers/staging/Kconfig                            |    2 -
 drivers/staging/Makefile                           |    1 -
 drivers/staging/axis-fifo/axis-fifo.c              |  214 +--
 drivers/staging/axis-fifo/axis-fifo.txt            |    5 +-
 drivers/staging/fbtft/fbtft-core.c                 |    4 +-
 drivers/staging/greybus/uart.c                     |    8 +-
 drivers/staging/most/Kconfig                       |    2 -
 drivers/staging/most/Makefile                      |    1 -
 drivers/staging/most/i2c/Kconfig                   |   13 -
 drivers/staging/most/i2c/Makefile                  |    4 -
 drivers/staging/most/i2c/i2c.c                     |  374 ----
 drivers/staging/nvec/nvec_ps2.c                    |   12 -
 drivers/staging/rtl8723bs/core/rtw_ap.c            |  312 ++-
 drivers/staging/rtl8723bs/core/rtw_efuse.c         |    3 -
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c     |   38 +-
 drivers/staging/rtl8723bs/core/rtw_io.c            |   48 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c          |   76 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |   80 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |   10 +-
 drivers/staging/rtl8723bs/core/rtw_security.c      |  235 ++-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c       |    6 -
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c     |   19 +-
 drivers/staging/rtl8723bs/hal/hal_com.c            |   65 -
 drivers/staging/rtl8723bs/hal/hal_intf.c           |    5 -
 drivers/staging/rtl8723bs/hal/odm.c                |   13 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c       |   33 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c  |   16 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c       |   15 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c           |    5 +-
 drivers/staging/rtl8723bs/include/basic_types.h    |    3 +-
 drivers/staging/rtl8723bs/include/drv_types.h      |    7 -
 drivers/staging/rtl8723bs/include/hal_com.h        |    2 -
 drivers/staging/rtl8723bs/include/hal_com_reg.h    |    4 -
 drivers/staging/rtl8723bs/include/hal_intf.h       |    2 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h   |    2 -
 drivers/staging/rtl8723bs/include/rtw_mlme.h       |    4 -
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h   |    4 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  |    3 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c       |    2 +
 drivers/staging/sm750fb/sm750.c                    |   13 +-
 drivers/staging/sm750fb/sm750_accel.c              |   10 +-
 drivers/staging/vc04_services/Kconfig              |   49 -
 drivers/staging/vc04_services/Makefile             |   14 -
 .../vc04_services/bcm2835-audio/bcm2835-vchiq.c    |    5 +-
 .../staging/vc04_services/bcm2835-audio/bcm2835.c  |    3 +-
 .../staging/vc04_services/bcm2835-audio/bcm2835.h  |    3 +-
 .../staging/vc04_services/bcm2835-camera/Kconfig   |   13 -
 .../staging/vc04_services/bcm2835-camera/Makefile  |    6 -
 drivers/staging/vc04_services/bcm2835-camera/TODO  |   17 -
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 2011 --------------------
 .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  142 --
 .../vc04_services/bcm2835-camera/controls.c        | 1399 --------------
 drivers/staging/vc04_services/interface/TODO       |   28 -
 .../include => include}/linux/raspberrypi/vchiq.h  |    0
 .../linux/raspberrypi}/vchiq_arm.h                 |    0
 .../linux/raspberrypi}/vchiq_bus.h                 |    0
 .../linux/raspberrypi}/vchiq_cfg.h                 |    0
 .../linux/raspberrypi}/vchiq_core.h                |   58 +-
 .../linux/raspberrypi}/vchiq_debugfs.h             |    0
 .../gpib/uapi => include/uapi/linux}/gpib.h        |    2 +-
 .../gpib/uapi => include/uapi/linux}/gpib_ioctl.h  |   16 +-
 153 files changed, 660 insertions(+), 4962 deletions(-)
 rename drivers/{staging => }/gpib/Kconfig (97%)
 rename drivers/{staging => }/gpib/Makefile (92%)
 rename drivers/{staging => }/gpib/TODO (56%)
 rename drivers/{staging => }/gpib/agilent_82350b/Makefile (100%)
 rename drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.c (100%)
 rename drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.h (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/Makefile (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.c (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.h (100%)
 rename drivers/{staging => }/gpib/cb7210/Makefile (100%)
 rename drivers/{staging => }/gpib/cb7210/cb7210.c (99%)
 rename drivers/{staging => }/gpib/cb7210/cb7210.h (100%)
 rename drivers/{staging => }/gpib/cec/Makefile (100%)
 rename drivers/{staging => }/gpib/cec/cec.h (100%)
 rename drivers/{staging => }/gpib/cec/cec_gpib.c (100%)
 rename drivers/{staging => }/gpib/common/Makefile (100%)
 rename drivers/{staging => }/gpib/common/gpib_os.c (100%)
 rename drivers/{staging => }/gpib/common/iblib.c (100%)
 rename drivers/{staging => }/gpib/common/ibsys.h (100%)
 rename drivers/{staging => }/gpib/eastwood/Makefile (100%)
 rename drivers/{staging => }/gpib/eastwood/fluke_gpib.c (100%)
 rename drivers/{staging => }/gpib/eastwood/fluke_gpib.h (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/Makefile (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h (100%)
 rename drivers/{staging => }/gpib/gpio/Makefile (100%)
 rename drivers/{staging => }/gpib/gpio/gpib_bitbang.c (100%)
 rename drivers/{staging => }/gpib/hp_82335/Makefile (100%)
 rename drivers/{staging => }/gpib/hp_82335/hp82335.c (100%)
 rename drivers/{staging => }/gpib/hp_82335/hp82335.h (100%)
 rename drivers/{staging => }/gpib/hp_82341/Makefile (100%)
 rename drivers/{staging => }/gpib/hp_82341/hp_82341.c (100%)
 rename drivers/{staging => }/gpib/hp_82341/hp_82341.h (100%)
 rename drivers/{staging => }/gpib/include/amcc5920.h (100%)
 rename drivers/{staging => }/gpib/include/amccs5933.h (100%)
 rename drivers/{staging => }/gpib/include/gpibP.h (96%)
 rename drivers/{staging => }/gpib/include/gpib_cmd.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_pci_ids.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_proto.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_state_machines.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_types.h (99%)
 rename drivers/{staging => }/gpib/include/nec7210.h (100%)
 rename drivers/{staging => }/gpib/include/nec7210_registers.h (100%)
 rename drivers/{staging => }/gpib/include/plx9050.h (100%)
 rename drivers/{staging => }/gpib/include/quancom_pci.h (100%)
 rename drivers/{staging => }/gpib/include/tms9914.h (100%)
 rename drivers/{staging => }/gpib/include/tnt4882_registers.h (100%)
 rename drivers/{staging => }/gpib/ines/Makefile (100%)
 rename drivers/{staging => }/gpib/ines/ines.h (100%)
 rename drivers/{staging => }/gpib/ines/ines_gpib.c (100%)
 rename drivers/{staging => }/gpib/lpvo_usb_gpib/Makefile (100%)
 rename drivers/{staging => }/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c (100%)
 rename drivers/{staging => }/gpib/nec7210/Makefile (100%)
 rename drivers/{staging => }/gpib/nec7210/board.h (100%)
 rename drivers/{staging => }/gpib/nec7210/nec7210.c (100%)
 rename drivers/{staging => }/gpib/ni_usb/Makefile (100%)
 rename drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c (100%)
 rename drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h (100%)
 rename drivers/{staging => }/gpib/pc2/Makefile (100%)
 rename drivers/{staging => }/gpib/pc2/pc2_gpib.c (100%)
 rename drivers/{staging => }/gpib/tms9914/Makefile (100%)
 rename drivers/{staging => }/gpib/tms9914/tms9914.c (99%)
 rename drivers/{staging => }/gpib/tnt4882/Makefile (100%)
 rename drivers/{staging => }/gpib/tnt4882/mite.c (100%)
 rename drivers/{staging => }/gpib/tnt4882/mite.h (100%)
 rename drivers/{staging => }/gpib/tnt4882/tnt4882_gpib.c (100%)
 create mode 100644 drivers/platform/raspberrypi/Kconfig
 create mode 100644 drivers/platform/raspberrypi/Makefile
 rename drivers/{staging/vc04_services/interface => platform/raspberrypi/vchiq-interface}/TESTING (100%)
 create mode 100644 drivers/platform/raspberrypi/vchiq-interface/TODO
 rename drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_arm.c (98%)
 rename drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_bus.c (96%)
 rename drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_core.c (99%)
 rename drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_debugfs.c (96%)
 rename drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_dev.c (99%)
 rename drivers/{staging/vc04_services/interface/vchiq_arm => platform/raspberrypi/vchiq-interface}/vchiq_ioctl.h (98%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Kconfig (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Makefile (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-common.h (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-encodings.h (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-common.h (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-format.h (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-port.h (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg.h (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-parameters.h (100%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.c (99%)
 rename drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.h (100%)
 delete mode 100644 drivers/staging/most/i2c/Kconfig
 delete mode 100644 drivers/staging/most/i2c/Makefile
 delete mode 100644 drivers/staging/most/i2c/i2c.c
 delete mode 100644 drivers/staging/vc04_services/bcm2835-camera/Kconfig
 delete mode 100644 drivers/staging/vc04_services/bcm2835-camera/Makefile
 delete mode 100644 drivers/staging/vc04_services/bcm2835-camera/TODO
 delete mode 100644 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
 delete mode 100644 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
 delete mode 100644 drivers/staging/vc04_services/bcm2835-camera/controls.c
 delete mode 100644 drivers/staging/vc04_services/interface/TODO
 rename {drivers/staging/vc04_services/include => include}/linux/raspberrypi/vchiq.h (100%)
 rename {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_arm.h (100%)
 rename {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_bus.h (100%)
 rename {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_cfg.h (100%)
 rename {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_core.h (86%)
 rename {drivers/staging/vc04_services/interface/vchiq_arm => include/linux/raspberrypi}/vchiq_debugfs.h (100%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h (97%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h (90%)
