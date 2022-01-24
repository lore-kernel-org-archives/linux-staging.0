Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF229CA
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 22:50:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l35-20020a05600c1d2300b0034d477271c1so447689wms.3
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 14:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ukeorMKD4DtTx7v5GqpKgHDeObRNyCx3SApk5x8npCw=;
        b=kXg9Ge4+kIwdTqVeOYcdLAVTnOUdJivC2riTMPZ6s277XWRoWB1Bzkj8PLdJh7Kq+L
         wE1BSg49UXx5S2RwGGLao9rM+HwGtwj+lz/XF3ZW1vWKKwQKC3bID2E+FWhQulvfPiI2
         Oc4WMjQKGDp7Ekl4HVJd50EcH7WvGT1SwhfoiHryh1msKrpTHJYgPb2XIADVrdvG5URe
         pDBf+E2USfqZw2fs//BWR3/+iqPjQl3CMmukmok5291dmHhBLxERpKvKR7BYI5QpdWTs
         BHFC9Gb6qGYDGDfCXZ42MqXbbhEyu+7MpfJ5OQcVcP4ILAcvGG4wGBi099sQqtKrlQeV
         1vjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ukeorMKD4DtTx7v5GqpKgHDeObRNyCx3SApk5x8npCw=;
        b=2nnAXCbSxdHChirQZGluRs0I+vAV119TAZkYbIQvASLlXrH6WubrKHfwfRtKzW2ap5
         ChM69PNBmTJYwWLlXElkOaXs+wvGxD0rsNIneBhpjsBjxPc+65lJUQsW8CM9fvA+zKtI
         0tHJI8OGPGBuqIMfQzxzVT1k38eZJTKSMKk2JTSqk4KE7UL1TjTGN0yx27UvWCB77cdT
         NasgdzqgypK0x+PwnBRxwxBXg9T5vufy8UQyINUnJYhLuwSSUoWMSEQZ1qvlMHmgEf8I
         k2pQOp5WzOntDnNdjg5bFWIi/5yd8GaU6ZTc44X8ooWjL5LqjmB7HsqkY+1u/HFIXGTw
         nWvQ==
X-Gm-Message-State: AOAM530UeXyNiBQGqeAzCZxF9lcFLdOD3GEARW1V+Rya4tZgrfxeAxgP
	cuYgfUAOxPG/OnZqwyzlVL9ynw==
X-Google-Smtp-Source: ABdhPJy2vu8DCpg8pLFx8vtG7q7XTyywWiZ5zwZtPjuytXroxhE09RDmb3Y8rdTtPXXYvOnE05GbJQ==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id m15mr387846wmq.132.1643064642784;
        Mon, 24 Jan 2022 14:50:42 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id g189sm624742wme.18.2022.01.24.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:50:42 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [RESENT PATCH 00/10] staging: r8188eu: Cleanup and removal of DBG_88E macro
Date: Mon, 24 Jan 2022 22:50:22 +0000
Message-Id: <20220124225032.860-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series does a few things in order to effect the removal of the
DBG_88E macro:

(1) It removes previously converted calls for consistency.
(2) It removes all current DBG_88E calls.
(3) It removes all aliased DBG_88E calls.
(4) It removes the GlobalDebugLevel flag and the file that defines it.

By its very nature, it is a large patchset, so I've tried to group as
appropriate. I went by file as I did the work, which led to over 40
patches originally, so I've listed the largest C files as their own
patches and then grouped everything else by subdir which gives closer
sizes for the other patches.

I resent the series as I neglected to properly include the driver in the
subject line of the cover letter, sorry. All other patches are
identical.

Phillip Potter (10):
  staging: r8188eu: remove previously added dev_dbg and netdev_dbg calls
  staging: r8188eu: remove smaller sets of DBG_88E calls from core dir
  staging: r8188eu: remove DBG_88E calls from core/rtw_mlme_ext.c
  staging: r8188eu: remove all DBG_88E calls from hal dir
  staging: r8188eu: remove smaller sets of DBG_88E calls from os_dep dir
  staging: r8188eu: remove DBG_88E calls from os_dep/ioctl_linux.c
  staging: r8188eu: remove DBG_88E call from include/usb_ops.h
  staging: r8188eu: remove all remaining aliased DBG_88E calls
  staging: r8188eu: remove DBG_88E macro definition
  staging: r8188eu: remove GlobalDebugLevel flag

 drivers/staging/r8188eu/Makefile              |   1 -
 drivers/staging/r8188eu/core/rtw_ap.c         | 108 +----
 drivers/staging/r8188eu/core/rtw_br_ext.c     |  59 +--
 drivers/staging/r8188eu/core/rtw_cmd.c        |  12 +-
 drivers/staging/r8188eu/core/rtw_ieee80211.c  |  37 +-
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  |  15 +-
 drivers/staging/r8188eu/core/rtw_iol.c        |  10 +-
 drivers/staging/r8188eu/core/rtw_mlme.c       |  54 +--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 343 +--------------
 drivers/staging/r8188eu/core/rtw_p2p.c        |  61 +--
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  49 +--
 drivers/staging/r8188eu/core/rtw_recv.c       |  73 +--
 drivers/staging/r8188eu/core/rtw_security.c   |  19 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |   6 -
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 102 +----
 drivers/staging/r8188eu/core/rtw_xmit.c       |  62 +--
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   4 +-
 drivers/staging/r8188eu/hal/hal_intf.c        |   3 -
 drivers/staging/r8188eu/hal/odm_debug.c       |   6 -
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  43 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  95 +---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |   3 -
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  |   5 -
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |   8 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     |  62 +--
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  31 +-
 drivers/staging/r8188eu/include/rtw_br_ext.h  |   5 -
 drivers/staging/r8188eu/include/rtw_debug.h   |   8 -
 drivers/staging/r8188eu/include/usb_ops.h     |   5 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 416 +-----------------
 drivers/staging/r8188eu/os_dep/mlme_linux.c   |   4 -
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  34 +-
 .../staging/r8188eu/os_dep/osdep_service.c    |   2 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  84 +---
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  18 +-
 drivers/staging/r8188eu/os_dep/xmit_linux.c   |   6 +-
 36 files changed, 166 insertions(+), 1687 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/odm_debug.c

-- 
2.34.1

