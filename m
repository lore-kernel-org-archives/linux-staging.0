Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95C5345CBF;
	Mon, 22 Jun 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135667; cv=none; b=bJymtEAypKKTpt0FYIC0GxXoLV4JUpHXUqQ0Ct69+lLZkjWjdG9C/RaATX7fBARpAC13LkQT9kBqwcr2O9zibTRTEkIFcBqhbC/a85S+W7VmOU4IeXRCjFit9feVDMb3HGbIRT4/e5QJCHjb7SApdqc71t+hdjh05/CyJADK7tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135667; c=relaxed/simple;
	bh=rrpBMXBCXimjtbvkZn0qjvacOT3u9CzjXp9+zlU38ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oyldu6+cFVfb7p85rRIqCEdk1+qBh0klGjo51Bq1mWjncuhtY24j97U/gQ/URsjbK01rTgiPb3Wrkb/jtqlGjxGjkznN8ia99Jex5XPENuamWTL64LdOXeL8q/tQTLFqS3q29n8mMPKJbQV6cu/xJD12UYRt1Rx0ida6b8IhAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P+hERKdX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P+hERKdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C018E1F000E9;
	Mon, 22 Jun 2026 13:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782135665;
	bh=+BRVjCaAV0Jrw+1DThy6h9X/MWX/ADM0TvZdVQL5tMg=;
	h=Date:From:To:Cc:Subject;
	b=P+hERKdXJGqSV3LA4mXT15RyxvmzrlJ3j5zhI328okIaiyjpRpupCGaec8ZgIdOku
	 5lIbXVTi/rs04YbCZJtZ0Ek1X/ilNalwmKOawoYWrEhRuHhKam5/k+iNagE5+lWuue
	 9ZxDxEa+N6ddc5gekqax0HGKtKb6coo3UY/ZzZo4=
Date: Mon, 22 Jun 2026 15:41:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver changes for 7.2-rc1
Message-ID: <ajk7ca-9XOfMAZTC@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc1

for you to fetch changes up to 7cb1c5b32a2bfde961fff8d5204526b609bcb30a:

  staging: most: video: avoid double free on video register failure (2026-05-21 12:42:38 +0200)

----------------------------------------------------------------
Staging driver updates for 7.2-rc1

Here is the big set of staging driver updates for 7.2-rc1.

Nothing major in here, just constant grind of tiny cleanups and coding
style fixes and wrapper removals.  Overall more code was removed than
added, always a nice sign that things are progressing forward.

Changes outside of drivers/staging/ was due to the octeon driver
changes, which for some reason also lives partially in the mips
subsystem, someday that all will be untangled and cleaned up, or just
removed entirely, it's hard to tell which is going to be its fate.

Other than octeon driver cleanups, in here are the usual:
  - rtl8723bs driver reworking and cleanups, being the bulk of this
    merge window given all of the issues and wrappers involved in that
    beast of a driver.
  - most driver cleanups
  - sm750fb driver cleanups (which might be done, as this really should
    be moved to the drm layer one of these days...)
  - other tiny staging driver cleanups and fixes

All of these have been in linux-next for many weeks with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Aadarsh Mandal (1):
      staging: rtl8723bs: remove commented-out code

Abhai Kollara (1):
      staging: rtl8723bs: simplify NULL pointer comparisons in rtw_recv.h

Ahmet Sezgin Duran (8):
      staging: sm750fb: fix off-by-one in lynxfb_ops_setcolreg
      staging: sm750fb: remove double space in fb_ops entries
      staging: sm750fb: remove unnecessary initializations
      staging: sm750fb: remove unnecessary initializations
      staging: sm750fb: remove unused includes
      staging: sm750fb: use early returns in frequency checks
      staging: sm750fb: remove unnecessary initialization
      staging: sm750fb: remove double space in assignment

Aidan Russell (2):
      staging: rtl8723bs: Fix spelling mistakes in comments
      staging: rtl8723bs: Replace uint with unsigned int in core

Alexandru Hossu (2):
      staging: nvec: fix use-after-free in nvec_rx_completed()
      staging: nvec: fix unconditional pm_power_off teardown

Andrei Khomenkov (19):
      staging: rtl8723bs: core: simplify boolean comparisons
      staging: rtl8723bs: hal: simplify boolean comparisons
      staging: rtl8723bs: os_dep: simplify boolean comparisons
      staging: rtl8723bs: add spaces around bitwise OR operators
      staging: rtl8723bs: remove redundant braces for single-statement block
      staging: rtl8723bs: move logical operators to previous line
      staging: rtl8723bs: fix alignment of continued conditions
      staging: rtl8723bs: wrap lines exceeding 100 characters
      staging: rtl8723bs: remove unused DBG_FIXED_CHAN code
      staging: rtl8723bs: remove unused DBG_RX_DUMP_EAP code
      staging: rtl8723bs: remove unused CONSISTENT_PN_ORDER code
      staging: rtl8723bs: remove unused DBG_CH_SWITCH code
      staging: rtl8723bs: remove unused REMOVE_PACK code
      staging: rtl8723bs: remove unused RTW_DVOBJ_CHIP_HW_TYPE code
      staging: rtl8723bs: remove unused RTW_MLME_EXT_C_ code
      staging: rtl8723bs: remove commented out code in rtw_mlme_ext.c
      staging: rtl8723bs: simplify if-else blocks in rtw_mlme_ext.c
      staging: rtl8723bs: remove unused DBG_XMIT_BUF and DBG_XMIT_BUF_EXT code
      staging: rtl8723bs: remove unused TXDESC_64_BYTES code

Ayush Mukkanwar (3):
      staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free functions
      staging: octeon: ethernet: replace pr_err and pr_info with dev_err and netdev_err
      staging: octeon: replace pr_warn with dev_warn in fill and rx paths

Ayushman Rout (2):
      staging: rtl8723bs: fix line lengths in rtw_cmd.c
      staging: rtl8723bs: fix CamelCase of DelayLPSLastTimeStamp

Bera Yüzlü (1):
      staging: rtl8723bs: remove unused function pointers

Eric Wu (7):
      staging: octeon: convert cvmx_spi_mode_t from typedef to plain enum
      staging: octeon: convert cvmx_helper_interface_mode_t from typedef to plain enum
      staging: octeon: convert cvmx_pow_wait_t from typedef to plain enum
      staging: octeon: convert cvmx_pko_lock_t from typedef to plain enum
      staging: octeon: convert cvmx_pko_status_t from typedef to plain enum
      staging: octeon: convert cvmx_pko_port_status_t from typedef to plain struct
      staging: octeon: convert cvmx_pip_port_status_t from typedef to plain struct

Ethan Tidmore (2):
      staging: rtl8723bs: Remove dead code
      staging: rtl8723bs: Rename pHT_info_ie to ht_info_ie

Francisco Maestre (1):
      staging: rtl8723bs: fix block comment alignment in hal_pwr_seq.c

Gabriel Rondon (3):
      staging: most: dim2: remove unnecessary NULL check in service_done_flag()
      staging: most: dim2: remove unnecessary NULL check in try_start_dim_transfer()
      staging: most: video: remove redundant cleanup in comp_exit()

Greg Kroah-Hartman (1):
      Merge tag 'v7.1-rc3' into staging-next

Guangshuo Li (1):
      staging: most: video: avoid double free on video register failure

Hadi Chokr (1):
      staging: most/net: remove dead code from skb_to_mamac() and skb_to_mep()

Henrique Cazarim (1):
      staging: rtl8723bs: add spaces arround |

Hungyu Lin (23):
      staging: sm750fb: constify fix_id array
      staging: rtl8723bs: remove unnecessary parentheses in os_intfs.c
      staging: rtl8723bs: simplify _rtw_init_xmit_priv control flow
      staging: rtl8723bs: make rtw_alloc_hwxmits static
      staging: rtl8723bs: convert rtw_alloc_hwxmits to return errno
      staging: rtl8723bs: move rtw_os_xmit_resource_alloc to rtw_xmit.c
      staging: rtl8723bs: convert rtw_os_xmit_resource_alloc to return errno
      staging: rtl8723bs: convert _rtw_init_xmit_priv to return errno
      staging: rtl8723bs: remove redundant returns in rtw_mlme_ext.c
      staging: rtl8723bs: remove redundant return in report_join_res()
      staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
      staging: sm750fb: propagate error codes from de_wait()
      staging: sm750fb: fix typo in comment
      staging: fbtft: remove unused function fbtft_write_gpio16_wr_latched
      staging: rtl8723bs: simplify _rtw_enqueue_cmd control flow
      staging: rtl8723bs: make _rtw_enqueue_cmd static
      staging: rtl8723bs: simplify rtw_enqueue_cmd control flow
      staging: rtl8723bs: make _rtw_enqueue_cmd return 0 on success
      staging: rtl8723bs: simplify rtw_xmit_classifier control flow
      staging: rtl8723bs: make rtw_xmit_classifier static
      staging: rtl8723bs: convert rtw_xmit_classifier to return errno
      staging: rtl8723bs: propagate errno through xmit enqueue path
      staging: rtl8723bs: propagate errno through hal xmit path

Jennifer Guo (17):
      staging: sm750fb: rename CamelCase variable and drop prefix
      staging: sm750fb: change 2 CamelCase variables to snake_case
      staging: rtl8723bs: remove unnecessary block comment
      staging: rtl8723bs: remove commented out enum values from odm_types.h
      staging: rtl8723bs: fix block comment alignment in hal/ header files
      staging: rtl8723bs: fix block comment alignment in hal/ source files
      staging: rtl8723bs: move block comment terminator to new line
      staging: rtl8723bs: remove commented out code from odm.c
      staging: rtl8723bs: remove unnecessary blank lines in rtw_recv.c
      staging: rtl8723bs: remove unnecessary blank lines in rtw_mlme_ext.c
      staging: rtl8723bs: remove unnecessary blank lines in rtw_security.c
      staging: rtl8723bs: fix unbalanced braces in rtw_recv.c
      staging: rtl8723bs: fix unbalanced braces in 3 files
      staging: rtl8723bs: fix multiple blank lines in hal/ files
      staging: rtl8723bs: fix multiple blank lines in hal/Hal* files
      staging: rtl8723bs: fix multiple blank lines in more hal/ files
      staging: rtl8723bs: delete superfluous switch statement

Jinemon Tama (4):
      staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
      staging: rtl8723bs: remove space after type cast
      staging: rtl8723bs: wrap long lines in rtl8723b_phycfg.c
      staging: rtl8723bs: remove unnecessary blank lines in rtl8723b_phycfg.c

Josh Hesketh (2):
      staging: rtl8723bs: fix whitespace issues in sdio_halinit.c
      staging: rtl8723bs: remove unnecessary else after return in sdio_halinit.c

Kenet Jovan Sokoli (2):
      staging: sm750fb: remove unused functions
      staging: rtl8723bs: remove unused struct rtw_regulatory

Kosugi Souta (1):
      staging: greybus: fix alignment to match open parenthesis

Len Bao (1):
      staging: sm750fb: Mark g_noaccel, g_nomtrr and g_dualview as __ro_after_init

Linus Probert (16):
      staging: rtl8723bs: remove multiple blank lines in rtw_btcoex.c
      staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
      staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
      staging: rtl8723bs: rename EFUSE_Read1Byte() to rtw_efuse_read_1_byte()
      staging: rtl8723bs: EFUSE_ShadowMapUpdate -> rtw_efuse_shadow_map_update
      staging: rtl8723bs: rename EFUSE_ShadowRead() to rtw_efuse_shadow_read()
      staging: rtl8723bs: remove two unused function prototypes
      staging: rtl8723bs: remove space before tab
      staging: rtl8723bs: remove blank line in rtw_btcoex.h
      staging: rtl8723bs: add function definition arg names to rtw_btcoex.h
      staging: rtl8723bs: rename rtw_btcoex_MediaStatusNotify()
      staging: rtl8723bs: rename rtw_btcoex_media_status_notify definition arg
      staging: rtl8723bs: rtw_btcoex_HaltNotify() -> rtw_btcoex_halt_notify()
      staging: rtl8723bs: rename rtw_btcoex_RejectApAggregatedPacket()
      staging: rtl8723bs: rtw_btcoex_LPS_Enter() -> rtw_btcoex_lps_enter()
      staging: rtl8723bs: rename rtw_btcoex_LPS_Leave to rtw_btcoex_lps_leave

Luka Gejak (1):
      staging: rtl8723bs: clean up memcpy() in rtw_check_bcn_info

Maha Maryam Javaid (3):
      staging: greybus: fix typo in sysfs-bus-greybus
      staging: rtl8723bs: fix typo in rtw_pwrctrl.c
      staging: most: net: replace pr_err with netdev_err

Mahad Ibrahim (1):
      staging: fbtft: Use %pe format specifier for error pointers

Maksym Pikhotskyi (2):
      staging: rtl8723bs: fix stainfo check in rtw_aes_decrypt
      staging: rtl8723bs: reduce nesting in rtw_security.c

Michael Steinmötzger (2):
      staging: rtl8723bs: replace non-standard BITn macros with BIT(n)
      staging: rtl8723bs: fix type issue in DYNAMIC_BB_DYNAMIC_TXPWR

Michael Straube (1):
      staging: rtl8723bs: remove READ_AND_CONFIG_MP macro

Miguel Cyrineu Vale (1):
      staging: rtl8723bs: replace NULL comparison with NOT operator

Mohammed Rizwan Kaniyate (1):
      staging: rtl8723bs: remove multiple blank lines in core/

Moksh Panicker (3):
      staging: rtl8723bs: Remove unnecessary braces in rtl8723bs_xmit.c
      staging: rtl8723bs: Remove commented-out dead code in hal_btcoex.c
      staging: rtl8723bs: remove blank line after open brace in hal_com.c

Nikolay Kulikov (34):
      staging: rtl8723bs: remove dead code in rtw_io.c
      staging: rtl8723bs: replace tabs used as separators with spaces
      staging: rtl8723bs: remove unnecessary rtw_bug_check() function
      staging: rtl8723bs: remove unused _rtw_init_queue() function header
      staging: rtl8723bs: remove the header of non-existent _kfree() function
      staging: rtl8723bs: remove unused rtw_sprintf() macro
      staging: rtl8723bs: remove the rtw_warn_on() macro
      staging: rtl8723bs: remove unused BIT33..BIT36 macros
      staging: rtl8723bs: remove dump_chip_info() function
      staging: rtl8723bs: remove wrapper rtw_hal_chip_configure()
      staging: rtl8723bs: remove wrapper rtw_hal_read_chip_info()
      staging: rtl8723bs: remove wrapper rtw_hal_read_chip_version()
      staging: rtl8723bs: remove wrapper rtw_hal_def_value_init()
      staging: rtl8723bs: remove wrapper rtw_hal_free_data()
      staging: rtl8723bs: remove wrapper rtw_hal_dm_init()
      staging: rtl8723bs: remove wrapper rtw_hal_enable_interrupt()
      staging: rtl8723bs: rename ReadAdapterInfo8723BS() to snake_case
      staging: rtl8723bs: rename EnableInterrupt8723BSdio() to snake_case
      staging: rtl8723bs: remove wrapper rtw_hal_disable_interrupt()
      staging: rtl8723bs: rename DisableInterrupt8723BSdio() to snake_case
      staging: rtl8723bs: rename ChipType of struct hal_version to snake_case
      staging: rtl8723bs: replace type and rename the chip_type field
      staging: rtl8723bs: remove unused macros from include/HalVerDef.h
      staging: rtl8723bs: remove unused ICType from struct hal_version
      staging: rtl8723bs: remove unused VendorType from struct hal_version
      staging: rtl8723bs: remove unused CUTVersion from struct hal_version
      staging: rtl8723bs: remove unused ROMVer from struct hal_version
      staging: rtl8723bs: move normal_chip field to struct hal_com_data
      staging: rtl8723bs: remove struct hal_version from include/HalVerDef.h
      staging: rtl8723bs: remove include/HalVerDef.h file
      staging: rtl8723bs: remove unused SysIntrMask from struct hal_com_data
      staging: rtl8723bs: remove empty InitSysInterrupt8723BSdio()
      staging: rtl8723bs: remove overwriting of current IMR settings
      staging: rtl8723bs: remove unused SysIntrStatus from struct hal_com_data

Paarth Mahadik (1):
      staging: rtl8723bs: fix logical continuation style

Pramod Maurya (5):
      staging: rtl8723bs: Replace __attribute__((packed)) with __packed in wifi.h
      staging: rtl8723bs: Replace __attribute__((__packed__)) with __packed in rtl8723b_hal.h
      staging: rtl8723bs: Remove multiple blank lines in include headers
      staging: rtl8723bs: Replace __attribute__((packed)) with __packed in ieee80211.h
      staging: rtl8723bs: Fix block comment style in ieee80211.h

Prithvi Tambewagh (5):
      staging: rtl8723bs: move constant to right side of test in comparison
      staging: rtl8723bs: remove empty if statement block
      staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
      staging: rtl8723bs: use read_poll_timeout_atomic in _is_fw_read_cmd_down
      staging: rtl8723bs: remove duplicate rate checks in PHY_GetTxPowerIndexBase()

Robertus Diawan Chris (1):
      staging: rtl8723bs: remove unused offset in phase 2 _BlockWrite()

Rupesh Majhi (1):
      staging: sm750: rename CamelCase variable Bpp to bpp

Salman Alghamdi (2):
      staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
      staging: rtl8723bs: rtw_mlme: add blank line for readability

Shivam Gupta (1):
      staging: rtl8723bs: remove unnecessary braces

Shubham Chakraborty (1):
      staging: sm750fb: Rename sm750_pnltype enum values to upper case

Shyam Sunder Reddy Padira (7):
      staging: most: net: remove filename from top-of-file comment
      staging: rtl8723bs: os_dep: remove unnecessary braces for single statement
      staging: rtl8723bs: os_dep: remove redundant else in rtw_dev_unload
      staging: most: video: remove filename from the top-of-file comment
      staging: most: dim2: remove filename from comment blocks
      staging: vme_user: remove unnecessary NULL initialization before list iteration
      staging: vme_user: simplify boolean comparisons

Siwanan Bungtong (2):
      staging: rtl8723bs: add braces to if/else arms in HalBtc8723b1Ant.c
      staging: rtl8723bs: fix unbalanced braces in if/else statements

Stepan Ionichev (2):
      staging: rtl8723bs: remove unnecessary blank lines in rtw_ioctl_set.c
      staging: rtl8723bs: drop blank line before close brace in rtw_ieee80211.c

Xiyuan Guo (1):
      staging: rtl8723bs: fix include guard comment in rtw_cmd.h

 .../cavium-octeon/executive/cvmx-helper-util.c     |   2 +-
 arch/mips/cavium-octeon/executive/cvmx-helper.c    |   8 +-
 arch/mips/cavium-octeon/executive/cvmx-pko.c       |   6 +-
 arch/mips/cavium-octeon/executive/cvmx-spi.c       |  16 +-
 arch/mips/include/asm/octeon/cvmx-helper-util.h    |   2 +-
 arch/mips/include/asm/octeon/cvmx-helper.h         |   6 +-
 arch/mips/include/asm/octeon/cvmx-pip.h            |   6 +-
 arch/mips/include/asm/octeon/cvmx-pko.h            |  26 +-
 arch/mips/include/asm/octeon/cvmx-pow.h            |  12 +-
 arch/mips/include/asm/octeon/cvmx-spi.h            |  38 +--
 drivers/staging/fbtft/fb_ssd1351.c                 |   3 +-
 drivers/staging/fbtft/fbtft-core.c                 |   3 +-
 drivers/staging/fbtft/fbtft-io.c                   |   7 -
 drivers/staging/fbtft/fbtft.h                      |   1 -
 .../greybus/Documentation/firmware/authenticate.c  |   2 +-
 .../greybus/Documentation/sysfs-bus-greybus        |   2 +-
 drivers/staging/most/dim2/dim2.c                   |   6 +-
 drivers/staging/most/dim2/errors.h                 |   2 +-
 drivers/staging/most/dim2/hal.c                    |   2 +-
 drivers/staging/most/dim2/hal.h                    |   2 +-
 drivers/staging/most/dim2/reg.h                    |   2 +-
 drivers/staging/most/dim2/sysfs.h                  |   2 +-
 drivers/staging/most/net/net.c                     |  18 +-
 drivers/staging/most/video/video.c                 |  30 +--
 drivers/staging/nvec/nvec.c                        |   8 +-
 drivers/staging/octeon/ethernet-mem.c              |  43 ++--
 drivers/staging/octeon/ethernet-mem.h              |   8 +-
 drivers/staging/octeon/ethernet-rx.c               |  49 ++--
 drivers/staging/octeon/ethernet-rx.h               |  13 +-
 drivers/staging/octeon/ethernet.c                  |  69 ++---
 drivers/staging/octeon/octeon-ethernet.h           |  14 ++
 drivers/staging/octeon/octeon-stubs.h              |  48 ++--
 drivers/staging/rtl8723bs/core/rtw_ap.c            |  90 +------
 drivers/staging/rtl8723bs/core/rtw_btcoex.c        |  15 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c           |  48 ++--
 drivers/staging/rtl8723bs/core/rtw_efuse.c         |  29 ++-
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c     |   3 +-
 drivers/staging/rtl8723bs/core/rtw_io.c            |  20 +-
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c     |  58 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme.c          |  68 +++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      | 172 ++-----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |   4 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c          | 186 +++++---------
 drivers/staging/rtl8723bs/core/rtw_security.c      | 223 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c       |   3 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c     |  57 ++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c          | 277 ++++++++++-----------
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c    | 105 +++-----
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h    |  18 +-
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  32 +--
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h    |  16 +-
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h       |  10 +-
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c   |  30 +--
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c  |  24 +-
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h  |  13 +-
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c   |  25 +-
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h   |  21 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c           |   1 -
 drivers/staging/rtl8723bs/hal/HalPhyRf.h           |   1 -
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c     |  59 ++---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h     |   2 -
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c       |   1 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c         |  52 +---
 drivers/staging/rtl8723bs/hal/hal_com.c            |  86 ++-----
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     |  22 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c           |  53 +---
 drivers/staging/rtl8723bs/hal/hal_pwr_seq.c        |  18 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c           |   1 -
 drivers/staging/rtl8723bs/hal/odm.c                |  82 ++----
 drivers/staging/rtl8723bs/hal/odm.h                |  56 ++---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c    |   2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c            |  64 ++---
 drivers/staging/rtl8723bs/hal/odm_DIG.h            |   4 +-
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c       |  12 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c       |  22 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h       |   1 -
 drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c |   1 -
 drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h   |   6 +-
 drivers/staging/rtl8723bs/hal/odm_interface.h      |  11 -
 drivers/staging/rtl8723bs/hal/odm_types.h          |   7 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c       |  38 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c        |  19 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 124 ++++-----
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    |  67 ++---
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c    |  12 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c    |   1 -
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c     |   3 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c     |  29 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c       |  96 ++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c           | 174 ++-----------
 drivers/staging/rtl8723bs/include/HalVerDef.h      |  85 -------
 drivers/staging/rtl8723bs/include/cmd_osdep.h      |   2 -
 drivers/staging/rtl8723bs/include/drv_types.h      |   9 +-
 drivers/staging/rtl8723bs/include/hal_com.h        |   3 -
 drivers/staging/rtl8723bs/include/hal_com_reg.h    | 104 ++++----
 drivers/staging/rtl8723bs/include/hal_data.h       |   8 +-
 drivers/staging/rtl8723bs/include/hal_intf.h       |  31 +--
 drivers/staging/rtl8723bs/include/hal_phy.h        |   4 +-
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h    | 182 +++++++-------
 drivers/staging/rtl8723bs/include/ieee80211.h      |  54 ++--
 drivers/staging/rtl8723bs/include/osdep_service.h  |  56 -----
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h  |   1 -
 drivers/staging/rtl8723bs/include/rtl8723b_dm.h    |   1 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h   |   3 +-
 drivers/staging/rtl8723bs/include/rtl8723b_recv.h  |   2 +-
 drivers/staging/rtl8723bs/include/rtl8723b_spec.h  |  88 +++----
 drivers/staging/rtl8723bs/include/rtw_btcoex.h     |  11 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h        |   6 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h      |  14 +-
 drivers/staging/rtl8723bs/include/rtw_ht.h         |  16 +-
 drivers/staging/rtl8723bs/include/rtw_io.h         |  16 --
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  |   1 -
 drivers/staging/rtl8723bs/include/rtw_mlme.h       |   6 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h   |  17 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h    |   6 +-
 drivers/staging/rtl8723bs/include/rtw_recv.h       |   8 +-
 drivers/staging/rtl8723bs/include/rtw_wifi_regd.h  |   1 -
 drivers/staging/rtl8723bs/include/rtw_xmit.h       |  25 +-
 drivers/staging/rtl8723bs/include/sdio_ops.h       |   5 +-
 drivers/staging/rtl8723bs/include/sdio_ops_linux.h |   1 -
 drivers/staging/rtl8723bs/include/wifi.h           |  28 +--
 drivers/staging/rtl8723bs/include/xmit_osdep.h     |   1 -
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  |  63 ++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        |  27 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c       |  20 +-
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c  |   4 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c       |  18 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c      |  15 +-
 drivers/staging/sm750fb/ddk750_chip.c              | 145 +++++------
 drivers/staging/sm750fb/ddk750_power.c             |  17 --
 drivers/staging/sm750fb/ddk750_power.h             |   5 -
 drivers/staging/sm750fb/sm750.c                    |  60 ++---
 drivers/staging/sm750fb/sm750.h                    |  12 +-
 drivers/staging/sm750fb/sm750_accel.c              |  62 ++---
 drivers/staging/sm750fb/sm750_accel.h              |   6 +-
 drivers/staging/sm750fb/sm750_cursor.c             |  58 -----
 drivers/staging/sm750fb/sm750_cursor.h             |   2 -
 drivers/staging/sm750fb/sm750_hw.c                 |  38 +--
 drivers/staging/vme_user/vme.c                     |  24 +-
 139 files changed, 1622 insertions(+), 2879 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/HalVerDef.h
