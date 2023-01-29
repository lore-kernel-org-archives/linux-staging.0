Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0473F23A3
	for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 14:57:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so976716wms.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 06:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3PIUhJJ2Js3C/6tt+mresOOSKw7x85c+zFM2rE/u0U=;
        b=RcByp6Rs2We/gmOWyyrEZ+IXSaGFAeaQ/6SSTYW8z4OzUszNPVJZBd0XetBD+gv9+J
         PnkF4igZXVKQTRrtpjunOnbo7vzys6/OGwtuS8i1+rXUDAVCHzcJ3+km5yUc+LduIlG9
         h+jlOxNsvjz46Sr4bmV9uRBbaM/HUBeoLi3Xeslsozi1XTvQ6wurNDQlsGXJpgXo8RPS
         L8cseUhE0LDuv7wVcDwP5jHl+QEspL5zTbUGKdRGYYyRi+yYH9HmtlJm2FsIzuy3yhJh
         YsIM9um85wfZGFPPBrQLENpieiSeDapuXq2RmZWZuvGGX9fUYWtHJHkbsM+tG4VBZS6s
         bqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3PIUhJJ2Js3C/6tt+mresOOSKw7x85c+zFM2rE/u0U=;
        b=3099zGzUNCHVTmxTwv8xqcYcv0QwFswVhQshS/KgxeCt5OqC89VcH8kGxup9QrvpvD
         YD6EMryMYfN9dMUZ5BpmIRRuBODBzR4G6olFC0RkcFRGDhvPMBWDG9cGCn/dPfAs86On
         8PSRztVfO7NADP/FTZawRtj30hi/W52OW0f/RkhYFwMcTYI9P6eHaGjmF1JBx2QrFUXB
         GgVsxkWjFosqO5aYuin2qSB92YDHhVTQhHE11c18sC+ulZbf6vKg0tUb48BZlVIyfqtb
         sF0xQJiuKMK8qM7m7J9tClF1wl2WUb6YTCJKInYo/VkqQyMdib8gA9BatAP6KKrX8Eym
         edCA==
X-Gm-Message-State: AFqh2krVfyCVOVmbk/faAK452MUXqbCU4vER56gbS13txUJj6Y+WHmeq
	JjTOUpxNpW/7d78Kp65qxKo=
X-Google-Smtp-Source: AMrXdXsjVQh845slkNhByBaBVfoXw7J2mQdc6Pv+qb6C/k15/nHz1+lutQpeeBQWVaaaLPFoYiMf2g==
X-Received: by 2002:a05:600c:3ba9:b0:3d2:231a:cb30 with SMTP id n41-20020a05600c3ba900b003d2231acb30mr10352358wms.3.1675004274089;
        Sun, 29 Jan 2023 06:57:54 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c384f00b003d9de0c39fasm15567434wmr.36.2023.01.29.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:57:53 -0800 (PST)
Date: Sun, 29 Jan 2023 15:57:51 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Remove unused constants and
 variables from r8192E_hw.h
Message-ID: <cover.1675003608.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused constants and variables from r8192E_hw.h 
Fix checkpatch issues as CamelCase and missing spaces.
Remove dead code.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (10):
  staging: rtl8192e: Rename TxBBGainTab.., CCKTxBBGainTab.. and
    RT_CID_81..
  staging: rtl8192e: Rename sCrcLng
  staging: rtl8192e: Remove unused variable rxSNRdB
  staging: rtl8192e: Remove unused constants from enum rt_customer_id
  staging: rtl8192e: Rename BaseBand_Config_PHY_REG and
    BaseBand_Config_AGC_TAB
  staging: rtl8192e: Remove unused constants at beginning of r8192E_hw.h
  staging: rtl8192e: Remove unused constants in _RTL8192Pci_HW
  staging: rtl8192e: Remove used constants MSR_LINK_SH.. and
    MSR_LINK_N..
  staging: rtl8192e: Rename _RTL8192Pci_HW, MXDMA2_NoLimit and TPPoll
  staging: rtl8192e: Rename TPPoll_CQ, AcmHwCtrl and AcmHw_BeqEn

 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |   2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c |   2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  43 ++--
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 204 +-----------------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  16 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |   4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  31 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  30 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h    |   6 +-
 9 files changed, 60 insertions(+), 278 deletions(-)

-- 
2.39.1

