Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FAA36AB7B;
	Tue, 17 Feb 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338548; cv=none; b=EStCXQ8fiXfxlTELdIGjBsqsSouUb83SDNNkByhQmqm5cAdNJ9Z0ZeG3J0qW/Yrstl3RKYq1ssz6XaG4nEBdPvogM2YuqU6lftNIElR07RF+ip/xdEFJRUm7zGzgjrHuhRTseZ/5yFCXpsT9FUwnd+9f4LfZ/IHgZTb74L+L8HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338548; c=relaxed/simple;
	bh=6v/RKLQEZSc4kkSCTHnUue75fHm0Kr42u/NWaz1Jkfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iFJL9bcw70ntAA3/tMIDekVlgG424uYGdLLKg6tPLlHbOAnPSXAFL4ONWg1DfuogsAkuyvR2D3YFYguekVHDFkj/SexwICGBLZ+VpUkFMl3TOvavF7qnk/ePiaDiA+fC9sgkY0+XuW+i2gbsVNIhdy88QJVWMT6kBASBjXbDL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ga2Dri/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ga2Dri/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB418C4CEF7;
	Tue, 17 Feb 2026 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771338548;
	bh=6v/RKLQEZSc4kkSCTHnUue75fHm0Kr42u/NWaz1Jkfg=;
	h=Date:From:To:Cc:Subject:From;
	b=ga2Dri/jKDEllqMeTZ7Vn/hGystHFt8kbok4TGiZjFo5cbTdrigEtenL9LNeUyxmk
	 vWzIPZzvOW4ZF1WEeEo7VZiNJLZNCs3g+KWO2P7YA2J0TDdo2smEF5dtUOVAZQScmm
	 KvtULBICZZMYuZ/p9+keerGL2H1cVRCLwVU0V1mI=
Date: Tue, 17 Feb 2026 15:29:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver updates for 7.0-rc1
Message-ID: <aZR7MAE8Cm-Viw5w@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.0-rc1

for you to fetch changes up to 319e3ff5ed7bc16a9932423159b1665418a1a9a0:

  staging: rtl8723bs: refactor ODM_SetIQCbyRFpath to reduce duplication (2026-02-07 15:11:01 +0100)

----------------------------------------------------------------
Staging driver updates for 7.0-rc1

Here is the big set of staging driver updates for 7.0-rc1.  Well, not
that big, just lots of tiny coding style cleanups primarily in one
driver as everyone seems to have glomed onto it for some reason that
escapes me (is there a tutorial out there somewhere pointing people at
this?)

Not much overall, the changes can be summarized as:
  - cleanups for the rtl8723bs driver, so many cleanups...
  - vme_user driver cleanups
  - sm750fb driver cleanups
  - tiny greybus driver cleanups
  - other really small staging driver cleanups

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Adrish Bora (1):
      staging: rtl8723bs: remove dead code in os_intfs.c

Akiyoshi Kurita (1):
      staging: sm750fb: fix typo 'resetted' -> 'reset'

Archit Anant (4):
      staging: rtl8723bs: fix spacing around operators
      staging: rtl8723bs: fix alignment to match open parenthesis
      staging: greybus: remove completed GPIO conversion task from TODO
      staging: rtl8723bs: use unaligned access macros in rtw_security.c

ArchitAnant (1):
      staging: rtl8723bs: remove unnecessary blank lines

Arjun Changla (1):
      staging: rtl8723bs: remove trailing whitespace

Artur Stupa (1):
      staging: vme_user: name function parameters

Bera Yüzlü (1):
      staging: rtl8723bs: refactor ODM_SetIQCbyRFpath to reduce duplication

Chaitanya Mishra (1):
      staging: greybus: lights: avoid NULL deref

Christine Ramacha (1):
      staging: sm750fb: Clean up variable names

Colin Ian King (1):
      staging: rtl8723bs: remove redundant check on status

Diksha Kumari (2):
      staging: rtl8723bs: fix spacing around operators
      staging: rtl8723bs: fix memory leak on failure path

Eric Biggers (1):
      staging: rtl8723bs: select CRYPTO_LIB_UTILS instead of CRYPTO

Ethan Tidmore (12):
      staging: most: dim2: replace macro with static function
      staging: rtl8723bs: rename add_RATid to add_ratid
      staging: rtl8723bs: rename RegEnableTxPowerLimit to reg_enable_tx_power_limit
      staging: rtl8723bs: rename RegEnableTxPowerByRate to reg_enable_tx_power_by_rate
      staging: rtl8723bs: rename RegPowerBase to reg_power_base
      staging: rtl8723bs: rename RegPwrTblSel to reg_pwr_tbl_sel
      staging: rtl8723bs: remove unused variable TxBBSwing_2G
      staging: rtl8723bs: remove unused variable AmplifierType_2G
      staging: rtl8723bs: remove unused variable bEn_RFE
      staging: rtl8723bs: remove unused variable RFE_Type
      staging: rtl8723bs: remove unused private debug counters
      staging: rtl8723bs: fix null dereference in find_network

Geet Singhi (1):
      staging: axis-fifo: Fix indentation

Haroen Tmimi (1):
      staging: rtl8723bs: remove stale TODO item regarding %pM

Holden Hsu (2):
      staging: greybus: arche-platform: clarify TODO comment
      staging: greybus: arche-platform: fix spelling mistake in comment

Jennifer Guo (1):
      staging: rtl8723bs: fix block comment whitespace

Johan Hovold (3):
      staging: greybus: arche-platform: fix coldboot probe error path
      staging: greybus: arche-platform: fix memleak on probe failure
      staging: greybus: arche-platform: fix OF populate on driver rebind

Julio Cesar Carvalho de Paula Souza (1):
      staging: greybus: arche-apb-ctrl: switch to device_property_read_bool

Karthikey D Kadati (1):
      staging: rtl8723bs: fix missing transmission lock in rtw_xmit

Khushal Chitturi (1):
      staging: rtl8723bs: fix operator and type cast spacing

Liang Jie (1):
      staging: rtl8723bs: fix missing status update on sdio_alloc_irq() failure

Louis Lesniak (1):
      staging: rtl8723bs: remove unnecessary braces

Luka Gejak (4):
      staging: rtl8723bs: rename u1bTmp to val
      staging: rtl8723bs: fix spacing around operators
      staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
      staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c

Madhumitha Sundar (1):
      staging: sm750fb: rename initParm to init_parm

Mahad Ibrahim (10):
      staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_MAC.c
      staging: rtl8723bs: Fix spaces around operator checks in HalHWImg8723B_MAC.c
      staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_BB.c
      staging: rtl8723bs: Fix spacing coding style issues in HalHWImg8723B_BB.c
      staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_RF.c
      staging: rtl8723bs: fix open parenthesis alignment
      staging: rtl8723bs: fix multiple blank line check
      staging: rtl8723bs: fix missing blank line after declaration
      staging: rtl8723bs: fix line length check
      staging: rtl8723bs: standardize comment style in HAL

Marc Dietrich (1):
      staging: nvec: apply udelay only after the first byte has been sent

Marco Crivellari (1):
      staging: greybus: add WQ_PERCPU to alloc_workqueue users

Matous Jarolim (1):
      staging: rtl8723bs: Rename supportRate and SupportRateNum to snake_case

Michael Huang (8):
      staging: rtl8723bs: use continue statements to reduce indentation
      staging: rtl8723bs: refactor comments to fix the line length warning for exceeding 100 columns
      staging: rtl8723bs: remove unnecessary new lines
      staging: rtl8723bs: Fix the line length exceeding 100 columns warning in the code
      staging: rtl8723bs: add missing space around operators
      staging: rtl8723bs: remove unnecessary braces
      staging: rtl8723bs: use !ptr instead of ptr == NULL
      staging: rtl8723bs: remove unnecessary boolean comparisons

Minu Jin (10):
      staging: rtl8723bs: use PTR_ALIGN for buffer alignment
      staging: rtl8723bs: update _rtw_pktfile_read() to return error codes
      staging: rtl8723bs: clean up _rtw_pktfile_read()
      staging: most: video: fix potential race in list iteration
      staging: rtl8723bs: fix potential race in expire_timeout_chk
      staging: rtl8723bs: introduce kmemdup() where applicable
      staging: rtl8723bs: replace rtw_malloc() with kmalloc()
      staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()
      staging: rtl8723bs: use standard skb allocation APIs
      staging: rtl8723bs: remove unused allocation wrapper functions

Nayana Mariyappa (4):
      staging: rtl8723bs: fix block comment style
      staging: rtl8723bs: remove extra blank lines
      staging: rtl8723bs: add blank lines after declarations
      staging: rtl8723bs: expand multiple assignment into separate statements

Nazar Kletskii (1):
      staging: rtl8723bs: Remove unnecessary parentheses

Ofir Mirovsky (1):
      staging: rtl8723bs: remove unnecessary blank lines

Omer El Idrissi (1):
      staging: rtl8723bs: replace uint with unsigned int

Ovidiu Panait (9):
      staging: axis-fifo: Remove read/write timeout module parameters
      staging: axis-fifo: Add poll() support
      staging: axis-fifo: Use devm_kasprintf for device name allocation
      staging: axis-fifo: Drop unneeded release callback
      staging: axis-fifo: Remove unnecessary casts from file->private_data
      staging: axis-fifo: Remove unnecessary zero-length packet check
      staging: axis-fifo: Remove noisy error messages for user errors
      staging: axis-fifo: Remove redundant comments
      staging: axis-fifo: Clean up register and mask definitions

Philip Thayer (1):
      staging: rtl8723bs: fix spacing around arithmetic operators

Rupesh Majhi (2):
      staging: rtl8723bs: rename shortGIrate to short_gi_rate
      staging: rtl8723bs: rename shortGIrate to short_gi_rate

Samasth Norway Ananda (2):
      staging: rtl8723bs: fix firmware memory leak on error
      staging: rtl8723bs: remove thread wraper functions and add IS_ERR() check

Sammy Malik (1):
      staging: greybus: Remove completed PWM TODO item.

Sanghyeon Lee (2):
      staging: rtl8723bs: remove unnecessary braces
      staging: rtl8723bs: remove unnecessary else block

SeungJu Cheon (1):
      Staging: rtl8723bs: fix space before tab in rtl8723bs_xmit.c

Siwanan Bungtong (1):
      staging: rtl8723bs: remove unnecessary parentheses

Sun Jian (1):
      staging: rtl8723bs: fix missing blank line warning

Tan Kai Zhe (2):
      staging: rtl8723bs: remove unnecessary blank lines in rtw_io.c
      staging: rtl8723bs: rename CamelCase function Set_MSR to set_msr

Tanjim Kamal (1):
      staging: rtl8723bs: constify _action_public_str array

Tim Wassink (1):
      staging: sm750fb: Rename CamelCase variable fixId to fix_id

Vivek BalachandharTN (1):
      staging: rtl8723bs: fix spacing around operators

Vo Thanh Cong (1):
      staging: rtl8723bs: remove unnecessary else after break

William Hansen-Baird (6):
      staging/sm750fb: remove outdated TODO lines
      staging: rtl8723bs: core: remove empty if-statements
      staging: rtl8723bs: core: remove unnecessary else-statements
      staging: rtl8723bs: core: move constants to right side in comparison
      staging: rtl8723bs: core/rtw_mlme_ext.c: flatten control flow in OnAssocReq()
      staging: rtl8723bs: core/rtw_mlme_ext.c: flatten indentation with early loop continue in OnAssocReq()

Yuvraj Singh Chauhan (1):
      staging: rtl8723bs: Remove redundant MAC_ARG macro

Zhan Xusheng (2):
      staging: greybus: gb-camera: use BIT() macro for flags
      staging: greybus: gb-camera: fix configure_streams indentation

 drivers/staging/axis-fifo/axis-fifo.c             | 290 ++++------------
 drivers/staging/greybus/TODO                      |   5 -
 drivers/staging/greybus/arche-apb-ctrl.c          |  13 +-
 drivers/staging/greybus/arche-platform.c          |  27 +-
 drivers/staging/greybus/gb-camera.h               |   9 +-
 drivers/staging/greybus/light.c                   |   8 +-
 drivers/staging/greybus/sdio.c                    |   2 +-
 drivers/staging/most/dim2/dim2.c                  |  12 +-
 drivers/staging/most/video/video.c                |  24 +-
 drivers/staging/nvec/nvec.c                       |   4 +-
 drivers/staging/rtl8723bs/Kconfig                 |   2 +-
 drivers/staging/rtl8723bs/TODO                    |   1 -
 drivers/staging/rtl8723bs/core/rtw_ap.c           |  76 ++---
 drivers/staging/rtl8723bs/core/rtw_cmd.c          | 142 ++++----
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    |   6 +-
 drivers/staging/rtl8723bs/core/rtw_io.c           |  15 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 157 ++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 397 +++++++++++-----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      |   6 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c         |  33 +-
 drivers/staging/rtl8723bs/core/rtw_security.c     |  37 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      | 149 ++++----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    |  19 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 148 ++++----
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 119 ++++---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.h  |  21 +-
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c |  72 ++--
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  27 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  30 +-
 drivers/staging/rtl8723bs/hal/hal_com.c           |  13 -
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c    |  14 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c          |  13 +-
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c   |  17 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  69 ++--
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  31 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  11 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   8 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      |  40 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c          |  29 +-
 drivers/staging/rtl8723bs/include/drv_types.h     |  53 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      |   3 -
 drivers/staging/rtl8723bs/include/ieee80211.h     |   1 -
 drivers/staging/rtl8723bs/include/osdep_service.h |  15 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  |   3 -
 drivers/staging/rtl8723bs/include/rtw_ap.h        |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 drivers/staging/rtl8723bs/include/xmit_osdep.h    |   2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  32 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c       |  54 ++-
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  |  46 +--
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      |  48 +--
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c |  28 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c     |  26 +-
 drivers/staging/sm750fb/TODO                      |   2 -
 drivers/staging/sm750fb/ddk750_chip.c             |   2 +-
 drivers/staging/sm750fb/sm750.c                   |  16 +-
 drivers/staging/sm750fb/sm750.h                   |   2 +-
 drivers/staging/sm750fb/sm750_accel.c             | 116 +++----
 drivers/staging/sm750fb/sm750_hw.c                |   4 +-
 drivers/staging/vme_user/vme.c                    |   2 +-
 drivers/staging/vme_user/vme.h                    |  97 +++---
 drivers/staging/vme_user/vme_bridge.h             |  10 +-
 drivers/staging/vme_user/vme_user.c               |   2 +-
 63 files changed, 1133 insertions(+), 1531 deletions(-)
