Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2814A088
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947781; cv=none; b=k/4Eo4jvTP5sWeQpEtMOTEXph54FcUgaB0593RSvYNt44fa3Uebhee4n3GyJiaRCo+psBT5QyQ6obKzkmjvvMVIy5TMlXKMKwePZthgmgVlOA/JC4oa1MfADN5SmNVNRCFJV+Z0wqU5ZjcEyU0vkaAiIqm2joXwZpF5UWSSM+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947781; c=relaxed/simple;
	bh=UiEfix7QB4glLlvDKOR5CGUKiUCSA474Yl0Jn5b76Ns=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUWDJlN4Y37iYbDDgZwQKJf8yJ26MwBAKl1X/GExPxzavqAtcedoXCaaqgLaxrLQ6FuiEcfU5FCzvdfyMttjjmU12Ulq0P3tLn41LuyfeerE3aOEHwYcLHPkOU8SaYY/ac4wCIqgxYdlqxfcTQwrR71Y1l8BH9t12yM+7OMSixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NI7ga4cj; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NI7ga4cj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso418211a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947778; x=1726552578; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5BO52+KJ68/Ix4XqJ5qAm5TxRd6ZPYkPcL1mWHiM8g=;
        b=NI7ga4cjYa60HB/Ltrv24kkmaU69jIglKQOJBHespaUK60k5J+Ct8Xq0FkBS5JEmNE
         lFr6yJSB4i3I4uHWYv+Dtq30ReFuLH7qCfzFlzAREs9VcQKLLBfmfDIIZD7Fa2ore5Wq
         lTmvDuDLJT/Zl8RXr4G+JRr8SAkVkZ66YUktAo82usYwfrfZ6bPeiFYATtx5aK4gbEfi
         GudWdGDmLI3QGKC9DZiTu/f9hO59m0kXhJ3ze4A6JJbaaTjlt2ygkwNfxbdDH1P9nVBF
         5iNkw6GszMdBIEJgAISWv2AvKo9FfPlVpV4FsyE+EobaqJyoIl3iQOTrgBF6Zw8uJmwo
         NtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947778; x=1726552578;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5BO52+KJ68/Ix4XqJ5qAm5TxRd6ZPYkPcL1mWHiM8g=;
        b=akK5nmJZLHKfkkhjU8PBqkJRGT33D6tj4IYk+wEVbMhVkI0+3dqHOm+VKI956aeEWZ
         SQ05jZvtLo/Xgob91x05V/putnVyvrebEOeA7hNMNYWMvlBgH2cwmtdPXzd67vAvQKUQ
         X1XA/425ARXLCnt5DsWQHpRRYDIRRJ3MRyMrmwXoE6pvd0OPDfrinXcx7O/zAfClG7X5
         3SIwlv1dbygj51m7CGOiTlLPj4dwt13EyCYx6+QIiNToiu7s6hU+5GPwIVMbtLrV0aIi
         B0F+wzVUgwwpD1Gms1YSLv5bPsFLZ/ez+V0dYZn0XDUWAgZ5o/qP1DzvSx37c5egs/F5
         8Vkg==
X-Forwarded-Encrypted: i=1; AJvYcCXP91SrFfnaAw+VD8OVmBPeqPvIxg3zPNqYuPWqnax6ZTFTyvSDGorRPMqtk6B5JnNxZXkBoqYiFESNtjP5@lists.linux.dev
X-Gm-Message-State: AOJu0YyYMTTbkwD1DFQoa7hv9xwGSHi+0JYkTpcqvHMevuuhYwRWy2/s
	HejvVLQYDYYIiZyOUv01s2np+XPIUZHQhElJKsz6y2Kzw8VIYusx
X-Google-Smtp-Source: AGHT+IGPcg4NsRThfAQEC9mdQMOjTLlR5bm9MR3qaVW22hNI37G+Pd2WccWByjAiQ86qYvfy4QjTHg==
X-Received: by 2002:a17:907:d08:b0:a8a:794b:9888 with SMTP id a640c23a62f3a-a8a88668371mr1043210466b.36.1725947778177;
        Mon, 09 Sep 2024 22:56:18 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72e71sm428893566b.139.2024.09.09.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:56:17 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:56:16 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8723bs: Remove unused functions starting
 with RTW_DISABLE_FUNC
Message-ID: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused functions.

There are some debug functions in between. I assume that those can be
removed as well as due to missing information how to use them and
what the output is those are not useable for developers without
further documentation.

Tested with rtl8723bs in ODYS Trendbook Next 14

MAINTAINERS File does not need to be updated.

Philipp Hortmann (11):
  staging: rtl8723bs: Remove unused function RTW_DISABLE_FUNC
  staging: rtl8723bs: Remove unused function rxmem_to_recvframe
  staging: rtl8723bs: Remove unused function rtw_hal_get_odm_var
  staging: rtl8723bs: Remove unused function rf_reg_dump
  staging: rtl8723bs: Remove unused function dump_4_rf_regs
  staging: rtl8723bs: Remove unused function bb_reg_dump
  staging: rtl8723bs: Remove unused function mac_reg_dump
  staging: rtl8723bs: Remove unused function dump_4_regs
  staging: rtl8723bs: Remove unused files rtw_debug.c and rtw_debug.h
  staging: rtl8723bs: Remove unused function rtw_ch2freq
  staging: rtl8723bs: Remove unused file rtw_rf.c

 drivers/staging/rtl8723bs/Makefile            |  2 -
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  1 -
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  1 -
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  4 --
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 68 -------------------
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  1 -
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_io.c       |  1 -
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  1 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  1 -
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  1 -
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  1 -
 drivers/staging/rtl8723bs/core/rtw_rf.c       | 34 ----------
 drivers/staging/rtl8723bs/core/rtw_security.c |  1 -
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  1 -
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  1 -
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  1 -
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |  1 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  1 -
 drivers/staging/rtl8723bs/hal/hal_com.c       |  1 -
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  1 -
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  7 --
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  1 -
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  1 -
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  1 -
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  1 -
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  1 -
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  1 -
 drivers/staging/rtl8723bs/include/drv_types.h |  7 --
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_debug.h | 14 ----
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 10 ---
 drivers/staging/rtl8723bs/include/rtw_rf.h    |  2 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  1 -
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  1 -
 .../staging/rtl8723bs/os_dep/osdep_service.c  |  1 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c |  1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  1 -
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  1 -
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |  1 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  1 -
 48 files changed, 187 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/core/rtw_debug.c
 delete mode 100644 drivers/staging/rtl8723bs/core/rtw_rf.c
 delete mode 100644 drivers/staging/rtl8723bs/include/rtw_debug.h

-- 
2.46.0

