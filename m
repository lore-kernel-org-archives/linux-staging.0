Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE62345CCD
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364500; cv=none; b=LJf69zgU5sv/YZtW5OifbeIkhp7LEFpSdop8fw+YLa56JEiwca7pwyU+L9SsdXpwcnIChTXxsPyLbZnlJXZRlRtcyaMZ4U4dcFWdhTvBj+nrIDymoLyBGIHp3JOof5caGLAroGimzw69rz5lLTytcXQQSqwBCpZzqWZxNPYHDhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364500; c=relaxed/simple;
	bh=pWEavuUT+279dYe3LslLV2G+k0IoNkj/4iwWlHVDd74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JlxN9RJtG+8lUzmbiVVVBGtUgTjXroPx8MxjOILstHTIeO+DsnZNatc4f8zoWr+HYjXEdc8K5EEyaEQ5C4oFuwhqwVF1nqytFUj0/MkWq8AwDucacq7Mc++v0KOBmK3ztS8uyj84Kab2pwegdQdwulSsQuuEzQVBc8cIJYN97LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGkjxLJw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGkjxLJw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359228b7c6so242704f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364499; x=1770969299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fzzanob46KvwkTDsA1p/iH48Wo6H9xZAHpPuBNLiGZU=;
        b=MGkjxLJwQWyJXYzZ401x++yQ1VgSCYmoAbRhEgbGkn1YHNO4aja8VExvDtt0JCDnVF
         5j7FUiH4hHsjm+UfEqz8UfE6QUW0khk+K8W4nzSW4DFAShTOwF5ThK98VfyjNtUjE9dw
         0AupptM+1XNSq6TbjwgKjuOwLQvyfVSLw+ploP39BYtPcYXcDashQQKVps/vEgnnLoCn
         /TiLmyjoFa2uovZop2gLdM6Gvyfa4TGKV93g415kmvLaVvMtwNkRSdFF3TR1zDuWVPID
         9PiQISlgSV9AIuFA7DhLcF6qie0n8leeFsf4MccI8y0cO0pfV6c3PZknFf5/PnfMb56D
         3LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364499; x=1770969299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fzzanob46KvwkTDsA1p/iH48Wo6H9xZAHpPuBNLiGZU=;
        b=QurAWpmTWqH6SNfDS2xpTB9YFv88y+38RjmOCYLxXSSPlo0DWFS3Dnn8c5rm0JbCzs
         NktCrppqGU0gsdKUIIhiUFrDOseaLLIUvEdl+qgK87ILXr/0KEm1Aq9xvgyBokwCK4V0
         uK1Nrj0gBwCK10t9loEONrsJ5BfvMnjEwxgZrByDnZ/AcXk7zNAvBcBv0SttZ2YEznKD
         +NcMwVVRB6H3eRF6USmpFpyoRcGAFfNJtTTeqYS1RNgtqEZeBLEH5AmySKZJUVHb6Wi4
         Xd3SqapFLplkoK8SYN4O3barGd0TDB8A0koT++04zx9wzOKB55FtYHNIz+GXWvwH3TQj
         xZOg==
X-Forwarded-Encrypted: i=1; AJvYcCUwvB63zpx9swsM2YclV116r58B0NDzA3rbRK9ax21KNwhrKPdfD++es1LyH5+eYBCqj/rRI00+ZmNG18xd@lists.linux.dev
X-Gm-Message-State: AOJu0YxSIvRrK5tD2kBapsT52Csfxc3s5o7z7ms+fzh8Gqpp0DLC5P0G
	ywfMNkmNRCjoQTBYZVwTATYby94EZjG0wBPBAuBM5vUgG/cb+MkwxGbtxBvrDGc=
X-Gm-Gg: AZuq6aLDI2UNHovzZJv4PxYliAMD6JT1T4o/tsVl1MnB7Ig54R+LlkN2jvt0sVPwdbl
	Gupyw9i5vmnWhiPBPwh5HQ0GOyu9IElnVfYxh4Vvpc9l8L1E+/R3x4/qjgOgJBG2IowuqX8wns3
	1OwecROOPyU25RPtFsSeosRGO7D9s8luvyHPXoNzMhn+BQxoY10HJ056XYkBlOMy46VREvtIxOs
	J5Tcg9qJdUgMohaPupUV01zbNDB8Jq3iLVjwO9fS1QfJV441DD7vR0jtMTaS2r3/eSS4JmU/FXs
	m3/CLuBAVN1n3dtd4TCfwN3MP9HQcMZl/AIO0v2e35F03UMmoTpLHy/eiIKwCGddL1oXxu9AtbF
	SVdhkp+yWJowZfqbx82OnWTO5b+QTkgrZiUziNEb/ZIZ1CCAWmtzQRrA1MQ6pvBQCcoBUquY//r
	V2zIvwGexHOQSdGYPf5pJal2YLO15Y08GCdNEyg7WhiOCVCmCPt1OnKV21gyuvzlB03NKLBs4LX
	A==
X-Received: by 2002:a05:6000:186c:b0:435:a194:734 with SMTP id ffacd0b85a97d-43629244709mr3143027f8f.5.1770364498448;
        Thu, 05 Feb 2026 23:54:58 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:54:57 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 00/26] staging: rtl8723bs: refactor and fix various driver issues
Date: Fri,  6 Feb 2026 08:54:13 +0100
Message-ID: <20260206075439.103287-1-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

This series is a complete redo of an older patch series (v6) and v1 of 
new series that was previously submitted. It has been fully rebased 
onto the current staging-next branch to resolve merge conflicts and 
ensure a clean application. It also includes fixes based on Greg's 
request for commit separation.
Rebase: 
- Updated against staging-next to prevent conflicts.
- Split Cleanups: Per Greg's request, style and line-length fixes are 
now separated by file and sub-directory (core, hal, os_dep) rather than 
submitted as a single monolithic patch.

Luka Gejak (26):
  staging: rtl8723bs: fix potential out-of-bounds read in 
    rtw_restruct_wmm_ie
  staging: rtl8723bs: rename u1bTmp to val
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
  staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
  staging: rtl8723bs: remove unused rtl8192c function declarations
  staging: rtl8723bs: remove unused RECV_BLK defines
  staging: rtl8723bs: remove unused MAX_PATH_NUM defines
  staging: rtl8723bs: convert PSTA_INFO_T to struct sta_info *
  staging: rtl8723bs: remove NDIS type aliases
  staging: rtl8723bs: remove redundant MAC_ARG macro
  staging: rtl8723bs: core: fix line lengths in rtw_wlan_util.c
  staging: rtl8723bs: core: fix line lengths in rtw_recv.c
  staging: rtl8723bs: hal: fix line lengths in HalPhyRf_8723B.c
  staging: rtl8723bs: os_dep: fix line lengths in ioctl_cfg80211.c
  staging: rtl8723bs: hal: fix line lengths in rtl8723b_cmd.c
  staging: rtl8723bs: hal: fix line lengths in rtl8723b_hal_init.c
  staging: rtl8723bs: hal: fix line lengths in rtl8723b_phycfg.c
  staging: rtl8723bs: core: fix various line length overflows
  staging: rtl8723bs: hal: fix various line length overflows
  staging: rtl8723bs: os_dep: fix various line length overflows
  staging: rtl8723bs: core: fix line lengths in rtw_cmd.c
  staging: rtl8723bs: core: fix line lengths in rtw_mlme_ext.c
  staging: rtl8723bs: core: fix line lengths in rtw_mlme.c
  staging: rtl8723bs: core: fix line lengths in rtw_xmit.c
  staging: rtl8723bs: core: fix various line length overflows

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 147 +++---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  36 +-
 drivers/staging/rtl8723bs/core/rtw_io.c       |   4 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 111 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 480 ++++++++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   3 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 123 +++--
 drivers/staging/rtl8723bs/core/rtw_security.c |  11 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 215 +++++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  44 +-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  35 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  29 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  36 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 166 ++++--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  10 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  22 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   4 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |   4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  28 +-
 drivers/staging/rtl8723bs/hal/odm.h           |  11 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  38 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  19 +-
 drivers/staging/rtl8723bs/hal/odm_types.h     |   3 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 103 +++-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  90 ++--
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  54 +-
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   5 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  49 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |   1 -
 .../staging/rtl8723bs/include/rtl8192c_recv.h |   8 -
 .../staging/rtl8723bs/include/rtw_ioctl_set.h |   3 -
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  12 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 136 +++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  17 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   3 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |   8 +-
 41 files changed, 1388 insertions(+), 712 deletions(-)

-- 
2.52.0

