Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B62E06E4;
	Tue, 25 Aug 2026 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667542; cv=none; b=mc4/6W32dhIWmA+h6XOrtDlZ+bWOPr70AXGw3wwSARy6aHOfW25EfTWRBd5wKDNwrlyXAqulFCCDdCqjnCi1r8WoXBdp3csytRgQQ89e3vfnEJxARzr2wLxZ87jf8VCI9AXxPBquml++STiiFxfTTNtCoHprm8YvnfqshaP3vEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667542; c=relaxed/simple;
	bh=8vWGKFdMI1NMmqdMTjEwMJj+GFbI/+reY98juACWmvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+WW1LTfnX6I1Vzx4wsaPlKMBpLWxfe6IHB82cgCt2ufDBGu/5PoFi+7COEOG2yH6DcyVbZ3+SyKCg9iQGdsQ8Lyvt4jv98wPmcKuYYVi6TfSTRT7HGlspgVfGkj7Yd6/8ut+8mBj2aaPyCW4t+wwX7LyS8izEJ6FBRE+WGlVsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J90qFcDV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J90qFcDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6921F000E9;
	Tue, 25 Aug 2026 14:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787667540;
	bh=SC+61JOeHoST5JgjhZve34VcYtgKc1LtC368F+BfvSA=;
	h=Date:From:To:Cc:Subject;
	b=J90qFcDVn53EAbrKl/owJIRsuc44/ZU3NoP71yQm6w5hNPMOWPH2Nt23DqUGJEV3Z
	 lKIITKRgp4iFTwvXqoUNukQMu6yzUd+rJ6KlNuri8jmgSWoF0dqj6xpBVAsEJxcXXS
	 Udlk56RUSc5BzNc3HY3SuPBegg061Ui304hU50W4=
Date: Tue, 25 Aug 2026 16:18:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver update for 7.3-rc2
Message-ID: <ao2kTjU_gnL3zR20@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.3-rc1

for you to fetch changes up to c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3:

  staging: rtl8723bs: add blank line after declaration (2026-07-28 09:37:17 +0200)

----------------------------------------------------------------
Staging driver updates for 7.3-rc1

Here is the big set of drivers/staging/ updates for 7.3-rc1.

Nothing major in here at all, just lots of tiny coding style cleanups,
refactoring, and minor "fixes" as found by some tools.  Included in here
  - loads of coding style and refactoring in the rtl8723bs wireless
    driver
  - minor greybus driver cleanups
  - minor sm750fb driver cleanups
  - other even smaller driver cleanups

All of these have been in linux-next for a weeks with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abdelnasser Hussein (2):
      staging: greybus: audio_codec: fix sscanf return value check
      staging: greybus: audio_codec: remove redundant else-if check

Aditya Chari (1):
      greybus: audio: Split gb_audio_gb_get_topology() into size query and data fetch

Aditya Tipre (1):
      staging: rtl8723bs: rename shadowed variable

Ahmet Sezgin Duran (4):
      staging: sm750fb: gate dualview dataflow using g_dualview
      staging: sm750fb: remove commented-out forward declarations
      staging: sm750fb: remove unnecessary initializations
      staging: sm750fb: remove unused struct fields

Aiman Najjar (2):
      staging: rtl8723bs: drop GEN_CMD_CODE macro and capitalize labels
      staging: rtl8723bs: drop GEN_EVT_CODE macro and capitalize labels

Alexander A. Klimov (1):
      staging: greybus: audio: correct sscanf() return value check

Alfie Varghese (2):
      staging: greybus: vibrator: return device_create() errors
      staging: greybus: uart: return tty_alloc_driver() errors

Alonso Garrigues (8):
      staging: rtl8723bs: remove unnecessary braces in rtw_set_oper_ch
      staging: rtl8723bs: remove unnecessary braces in hal_intf.c
      staging: rtl8723bs: remove dead code block in rtl8723bs_cmd.c
      staging: rtl8723bs: correct binary operator style in rtl8723bs_cmd.c
      staging: rtl8723bs: fix lines ending in '(' in rtl8723b_cmd.c
      staging: rtl8723bs: remove dead code in rtl8723b_cmd.c
      staging: rtl8723bs: remove unnecessary parentheses in rtl8723b_cmd.c
      staging: rtl8723bs: Add braces to if statement in rtl8723bs_cmd.c

Amin Madani (2):
      staging: rtl8723bs: Fix spacing around ternary operator in sdio_intf.c
      staging: rtl8723bs: Split multiple assignments in _rtw_open_pktfile

Andrea Frasson (1):
      staging: rtl8723: remove multiple blank lines in rtw_security.c

Andrei Khomenkov (2):
      staging: rtl8723bs: remove dead rtw_atimdone_event_callback()
      staging: rtl8723bs: clean up wlanevents table in rtw_mlme_ext.c

Anirban Bose (5):
      staging: rtl8723bs: rename camelcase variable nSubframe_Length
      staging: rtl8723bs: rename camelcase variable bAllow
      staging: rtl8723bs: remove unused variable bDumpRxPkt
      staging: rtl8723bs: rename Switch_DM_Func to switch_dm_func
      staging: rtl8723bs: rename Update_RA_Entry to update_ra_entry

Arnesh Banerjee (1):
      staging: rtl8723bs: use !psta instead of comparison to NULL

Arsenii Pashchenko (1):
      staging: rtl8723bs: remove redundant ReadChipVersion8723B wrapper

Artur Ugnivenko (2):
      staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
      staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c

Ashton Warner (1):
      staging: rtl8723bs: Wrap line exceeding 100 characters

Atharv Margur (2):
      staging: rtl8723bs: remove unnecessary braces in rtl8723b_hal_init.c
      staging: rtl8723bs: remove unnecessary braces in odm_HWConfig.c

Ayush Mukkanwar (2):
      staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
      staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown

Babanpreet Singh (1):
      staging: axis-fifo: Fix kernel-doc return value warnings

Batu Ada Tutkun (1):
      staging: most: dim2: use dev_err_probe() for clock errors in rcar enable functions

Bryam Vargas (1):
      greybus: audio: bound the topology section sizes against the fetched size

Chen-Yu Yeh (2):
      staging: rtl8723bs: remove unused netdev format/arg macros
      staging: rtl8723bs: remove unused channel format/arg macros

Cong Nguyen (3):
      staging: rtl8723bs: use nl80211_iftype instead of custom NDIS enum
      staging: rtl8723bs: remove unused network_type_in_use field
      staging: rtl8723bs: fix xmit_frame/xmit_buf leaks on mgnt-frame error paths

Dalvin-Ehinoma Noah Aiguobas (15):
      staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm
      staging: rtl8723bs: add braces to resolve checkpatch
      staging: rtl8723bs: fix Alignment should match open parenthesis in rtw_mlme.c
      staging: rtl8723bs: Rename camelcase struct member dot11PrivacyAlgrthm
      staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_8021X
      staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Open
      staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Auto
      staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Shared
      staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_WAPI and dot11AuthAlgrthm_MaxNum
      staging: rtl8723bs: Fix logical operator alignment in rtw_mlme.c
      staging: rtl8723bs: Remove unused parameter pnetdev
      staging: rtl8723bs: change struct member bDriverStopped
      staging: rtl8723bs: wrap line over 100 characters
      staging: rtl8723bs: remove unnecessary whitespace
      staging: rtl8723bs: wrap line over 100 characters

Dan Carpenter (1):
      staging: fbtft: Use sysfs_emit_at() to print to sysfs file

Dang Vu Duc Hien (1):
      staging: rtl8723bs: add blank line after declaration

David C.C.M. Gall (1):
      staging: rtl8723bs: clean up struct spacing

Dawei Feng (1):
      staging: rtl8723bs: fix mismatched free of HalData in rtw_sdio_if1_init()

Devansh Soni (2):
      staging: rtl8723bs: remove redundant rsp_allocated_buf
      staging: rtl8723bs: fix missing unregister_netdev on sdio_alloc_irq failure

Dorian Catric (2):
      staging: nvec: fix typo in copyright header URL
      staging: nvec: remove extra space in enum declaration

Ethan Nelson-Moore (3):
      staging: rtl8723bs: remove references to nonexistent CONFIG_IEEE80211W option
      staging: rtl8723bs: remove reference to nonexistent CONFIG_SDIO_HCI option
      staging: rtl8723bs: remove references to nonexistent CONFIG_IOCTL_CFG80211 option

Eugene Mavick (2):
      staging: rtl8723bs: fix alignment
      staging: rtl8723bs: remove unnecessary parentheses

Gabriel Changamire (1):
      staging: sm750fb: rename CamelCase parameters in sm750_accel.h

Gianmaria Biselli (1):
      staging: rtl8723bs: rename CamelCase variable RxMgmtFrameSeqNum

Gongwei Li (1):
      staging: rtl8723bs: rtw_mlme: make rtw_add_network() static

Greg Kroah-Hartman (2):
      Merge 7.2-rc3 into staging-next
      Merge 7.2-rc5 into staging-next

Hao-Qun Huang (1):
      staging: greybus: hid: fix SET_REPORT return value

Hari Mishal (1):
      staging: axis-fifo: Align arguments to open parenthesis

Hungyu Lin (13):
      staging: sm750fb: remove duplicate init_status structure
      staging: rtl8723bs: simplify LPS_RF_ON_check control flow
      staging: rtl8723bs: convert LPS_RF_ON_check to errno
      staging: rtl8723bs: simplify update_attrib_sec_info control flow
      staging: rtl8723bs: simplify update_attrib control flow
      staging: rtl8723bs: convert update_attrib_sec_info to return errno
      staging: rtl8723bs: convert update_attrib to return errno
      staging: rtl8723bs: remove redundant return variable in rtw_make_wlanhdr()
      staging: rtl8723bs: convert rtw_make_wlanhdr() to return errno
      staging: rtl8723bs: convert xmitframe_addmic() to return errno
      staging: rtl8723bs: simplify rtw_xmitframe_coalesce() control flow
      staging: rtl8723bs: convert rtw_xmitframe_coalesce() to return errno
      staging: sm750fb: remove unused set_all_eng_off field

Igor Putko (2):
      staging: rtl8723bs: remove empty loop and stale comment in HalPhyRf.c
      staging: nvec: nvec_power: use GFP_KERNEL in probe()

Ivy Lopez (1):
      staging: rtl8723bs: use kfree_sensitive() for key material

Jad Keskes (2):
      staging: sm750fb: rename pvReg to mmio
      staging: rtl8723bs: replace beacon timing magic numbers with named constants

Jason Winter (1):
      staging: rtl8723bs: Remove space after cast

Jinke Wu (5):
      staging: rtl8723bs: fix operator spacing in rtw_mlme_ext
      staging: rtl8723bs: fix line length and alignment in rtw_mlme_ext
      staging: rtl8723bs: split nested assignment in OnAssocRsp
      staging: rtl8723bs: remove unnecessary parentheses in issue_asocrsp
      staging: rtl8723bs: simplify boolean comparison in send_beacon

Joachim Bose (1):
      staging: rtl8723bs: line exceeds 100 columns

Leonardo Martins Martins (1):
      staging: rtl8723bs: remove redundant goto in rtw_free_xmitframe()

Manuel Ebner (1):
      staging: rtl8723bs: sdio_intf.c: cleanup function

Max Raulea (1):
      staging: rtl8723bs: rename camelcase variable psurveyPara

Michail Tatas (1):
      staging: greybus: Remove unused macro

Mohammed Momin (1):
      staging: rtl8723bs: add missing spaces around '*' operator

Mohit Mishra (2):
      staging: sm750fb: Clean up whitespace and comment spacing in headers
      staging: sm750fb: Remove unused function sm750_enable_dma

Moksh Panicker (6):
      staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
      staging: rtl8723bs: Fix missing spaces around operators
      staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in ioctl_cfg80211.c
      staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in xmit_linux.c
      staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in os_intfs.c
      staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature

Nikolay Kulikov (24):
      staging: rtl8723bs: remove unused field 'bAPKThermalMeterIgnore'
      staging: rtl8723bs: remove unused case from update_beacon()
      staging: rtl8723bs: remove unused 'oui' parameter from update_beacon()
      staging: rtl8723bs: remove 'NumTotalRFPath' from 'struct hal_com_data'
      staging: rtl8723bs: remove local variable 'eRFPath'
      staging: rtl8723bs: remove dead fields from struct hal_com_data
      staging: rtl8723bs: remove unused 'PolarityCtl' from struct hal_com_data
      staging: rtl8723bs: remove unused RegulatorMode from struct hal_com_data
      staging: rtl8723bs: remove unused 'MultiFunc' from struct hal_com_data
      staging: rtl8723bs: remove unused 'EEPROMCustomerID' from hal_com_data
      staging: rtl8723bs: remove unused ForcedDataRate from hal_com_data
      staging: rtl8723bs: remove unused EEPROMVersion from struct hal_com_data
      staging: rtl8723bs: remove unused EEPROMBluetoothType from hal_com_data
      staging: rtl8723bs: remove unused 'bTXPowerDataReadFromEEPORM'
      staging: rtl8723bs: remove unused 'CCK_24G_Diff' from hal_com_data
      staging: rtl8723bs: remove unused array MCSTxPowerLevelOriginalOffset
      staging: rtl8723bs: remove unused 'bIQKInitialized ' from hal_com_data
      staging: rtl8723bs: remove unused 'bNeedIQK' from struct hal_com_data
      staging: rtl8723bs: hal: remove unused readings from the chip
      staging: rtl8723bs: remove unused 'UsbRxHighSpeedMode' from hal_com_data
      staging: rtl8723bs: remove unused spinlock 'SdioTxFIFOFreePageLock'
      staging: rtl8723bs: remove 'rf_chip' from struct hal_com_data
      staging: rtl8723bs: remove debug fields from hal_com_data
      staging: rtl8723bs: remove unused enumerations

Nikoloz Bakuradze (1):
      staging: rtl8723bs: core: avoid NULL pointer dereference in c2h_wk_callback

Nils Lehnen (1):
      staging: most: video: replace pr_err with dev_err

Olivier Tanoh (2):
      staging: rtl8723bs: rename Save_DM_Func_Flag functions to avoid CamelCase
      staging: rtl8723bs: rename Restore_DM_Func_Flag functions to avoid CamelCase

Pablo Vallespín Aranguren (1):
      staging: rtl8723bs: wrap long line over 100 characters

Panagiotis Petrakopoulos (1):
      staging: rtl8723bs: use rS0S1_PathSwitch define instead of 0x948 magic number

Pang-Chun Liu (1):
      staging: rtl8723bs: remove unused rtl8192c function declarations

Patryk Gawroński (2):
      staging: rtl8723bs: Remove multiple assignments
      staging: rtl8723bs: Replace custom RotR1 macro with ror16

Pramod Maurya (1):
      staging: rtl8723bs: Fix line over 100 chars in xmit_linux.c

Prashant Rahul (4):
      staging: octeon: factor out device removal into a helper
      staging: octeon: Propagate rx initialization failures
      staging: octeon: Propagate tx initialization failures
      staging: octeon: handle rx/tx initialization failures in probe

Praveen Jayaprakash Pattar (3):
      staging: rtl8723bs: hal: Fix block comment style in HalPwrSeqCmd.c
      staging: rtl8723bs: hal: Fix indentation in odm_EdcaTurboCheck.c
      staging: rtl8723bs: hal: Fix space before tab in rtl8723b_dm.c

Quentin Strydom (6):
      staging: rtl8723bs: hal: fix space-before-tab warnings in HalBtc8723b2Ant.c
      staging: rtl8723bs: hal: fix space-before-tab warnings in hal_btcoex.c
      staging: rtl8723bs: hal: fix space-before-tab warnings in hal_com.c
      staging: rtl8723bs: hal: fix space-before-tab warnings in HalPhyRf_8723B.c
      staging: rtl8723bs: hal: fix space-before-tab warnings in rtl8723b_hal_init.c
      staging: rtl8723bs: hal: fix space-before-tab warnings in rtl8723bs_recv.c

Rhys Tumelty (1):
      staging: greybus: remove unused macro CAP_TIMEOUT_MS

Rodrigo Gobbi (1):
      staging: rtl8723bs: fix unnamed parameters warning detected at checkpatch

Rong Zhang (1):
      staging: sm750fb: Add missing Kconfig dependency

Santiago Ruano Rincón (1):
      staging: rtl8723bs: fix several line spaces in wifi.h

Serhat Kumral (5):
      staging: rtl8723bs: rename ChannelNum to channel_num
      staging: rtl8723bs: rename ScanType to scan_type
      staging: rtl8723bs: simplify rtw_spt_band_alloc
      staging: rtl8723bs: remove multiple blank lines
      staging: rtl8723bs: put logical continuation on previous line

Shivank Sharma (1):
      staging: axis-fifo: Remove unused includes

Som Tripathi (1):
      staging: rtl8723bs: remove extra blank lines in rtw_qos.h

Subhrojyoti Bala (2):
      staging: rtl8723bs: Fix indentation in enum in rtw_mlme.h
      staging: rtl8723bs: Fix comment style issues in header files

Tomasz Unger (6):
      staging: greybus: power_supply: remove unnecessary parentheses in return
      staging: fbtft: fix typo in comment in fb_upd161704.c
      staging: rtl8723bs: fix spelling mistake found by codespell
      staging: rtl8723bs: fix spelling mistakes found by codespell
      staging: rtl8723bs: fix spelling mistake in rtw_recv.c
      staging: rtl8723bs: fix spelling mistake found by codespell

Uwe Kleine-König (1):
      staging: rtl8723bs: Drop unused parameter from rtw_sdio_if1_init()

 drivers/staging/axis-fifo/axis-fifo.c              |   9 +-
 drivers/staging/fbtft/fb_upd161704.c               |   2 +-
 drivers/staging/fbtft/fbtft-sysfs.c                |   2 +-
 drivers/staging/greybus/audio_codec.c              |   5 +-
 drivers/staging/greybus/audio_codec.h              |   4 +-
 drivers/staging/greybus/audio_gb.c                 |  32 +-
 drivers/staging/greybus/audio_manager_sysfs.c      |   2 +-
 drivers/staging/greybus/audio_module.c             |  27 +-
 drivers/staging/greybus/authentication.c           |   2 -
 drivers/staging/greybus/hid.c                      |   2 +-
 drivers/staging/greybus/loopback.c                 |  26 --
 drivers/staging/greybus/power_supply.c             |   4 +-
 drivers/staging/greybus/uart.c                     |   2 +-
 drivers/staging/greybus/vibrator.c                 |   2 +-
 drivers/staging/most/dim2/dim2.c                   |  14 +-
 drivers/staging/most/video/video.c                 |  10 +-
 drivers/staging/nvec/nvec.c                        |   4 +-
 drivers/staging/nvec/nvec_power.c                  |   2 +-
 drivers/staging/octeon/ethernet-rx.c               |  20 +-
 drivers/staging/octeon/ethernet-rx.h               |   2 +-
 drivers/staging/octeon/ethernet-tx.c               |  19 +-
 drivers/staging/octeon/ethernet-tx.h               |   2 +-
 drivers/staging/octeon/ethernet.c                  |  66 ++-
 drivers/staging/rtl8723bs/core/rtw_ap.c            | 182 ++------
 drivers/staging/rtl8723bs/core/rtw_cmd.c           | 251 +++++-----
 drivers/staging/rtl8723bs/core/rtw_efuse.c         |  11 +-
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c     |  12 +-
 drivers/staging/rtl8723bs/core/rtw_io.c            |   7 -
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c     |  30 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c          | 269 +++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      | 513 +++++++++++----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |  32 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c          |  47 +-
 drivers/staging/rtl8723bs/core/rtw_security.c      |  48 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c       |   6 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c     |  85 ++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c          | 130 +++---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  26 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c           |  12 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c     |  58 +--
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c       |  38 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c         |  10 +-
 drivers/staging/rtl8723bs/hal/hal_com.c            |  14 +-
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     |  15 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c           |  14 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c           |   6 +-
 drivers/staging/rtl8723bs/hal/odm.c                |   2 +-
 drivers/staging/rtl8723bs/hal/odm.h                |   7 -
 drivers/staging/rtl8723bs/hal/odm_DIG.c            |   2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.h            |   5 -
 drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c |   2 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c       |   3 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c       | 250 +++++-----
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c        |   7 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 113 +----
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    |   8 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c    |  67 +--
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c     |  10 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c     |  11 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c       |  83 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c           |   2 +-
 drivers/staging/rtl8723bs/include/drv_types.h      |   9 +-
 drivers/staging/rtl8723bs/include/hal_com_reg.h    |  10 +-
 drivers/staging/rtl8723bs/include/hal_data.h       | 122 -----
 drivers/staging/rtl8723bs/include/hal_intf.h       |   8 +-
 drivers/staging/rtl8723bs/include/hal_pg.h         |   6 -
 drivers/staging/rtl8723bs/include/ieee80211.h      |  30 +-
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h |   4 +-
 .../rtl8723bs/include/osdep_service_linux.h        |   3 -
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h  |   3 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h   |  22 +-
 drivers/staging/rtl8723bs/include/rtw_ap.h         |   2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h        | 144 +++---
 drivers/staging/rtl8723bs/include/rtw_event.h      |   4 -
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h       |  61 ++-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h   |  64 +--
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h    |   6 +-
 drivers/staging/rtl8723bs/include/rtw_qos.h        |   4 -
 drivers/staging/rtl8723bs/include/rtw_security.h   |  20 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h       |   4 +-
 drivers/staging/rtl8723bs/include/sta_info.h       |   2 +-
 drivers/staging/rtl8723bs/include/wifi.h           |  83 +---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h    |  92 ++--
 drivers/staging/rtl8723bs/include/xmit_osdep.h     |   2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 146 +++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        |  30 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c       |  24 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c       |   4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c      |  12 +-
 drivers/staging/sm750fb/Kconfig                    |   1 +
 drivers/staging/sm750fb/ddk750_chip.c              |  27 --
 drivers/staging/sm750fb/ddk750_chip.h              |   7 -
 drivers/staging/sm750fb/ddk750_power.c             |  14 -
 drivers/staging/sm750fb/ddk750_power.h             |   5 -
 drivers/staging/sm750fb/sm750.c                    |  26 +-
 drivers/staging/sm750fb/sm750.h                    |  20 +-
 drivers/staging/sm750fb/sm750_accel.h              |  44 +-
 drivers/staging/sm750fb/sm750_hw.c                 |  28 +-
 99 files changed, 1564 insertions(+), 2179 deletions(-)
