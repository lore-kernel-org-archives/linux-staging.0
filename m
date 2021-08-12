Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99382173
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 01:52:43 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id s13so7683817oie.10
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 18:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5hikIeodmpms+ptOTxs+0WU9ZF1QyEbMM/oI8jbMJBo=;
        b=lJMpS3sJZWxYSe98itQsP9CDbGlqreyl6H4K77FPFiwPjGfFYK9HJLihd74u6PckSx
         rGRCA189RpE8rjwFRWlbgNt7uj3Fs4/oMhCt4XtUHcen6j1ErP0SSCwVr7qlUl079Uhw
         KVrSGZS084s3pxR83fkzNLsT4chyoBMwOF6xHd/yudiZCjipGT4fOsdK16z+bpD4DPqF
         90DWKZwE0C+xwLfll/HWYkz7SAkh5CZ/njpjOqgGpuohD9bno7Dy8HhMIvd+pXP8dgK8
         vOm7JLp0iaO61v9npY5mx6RL2gMJZE0KLEh8x/ZCe6dQmIzwKKOs38Tp49yKfEXODwkW
         5F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=5hikIeodmpms+ptOTxs+0WU9ZF1QyEbMM/oI8jbMJBo=;
        b=q6PoFQTdBA28Qv3OKF5jinxyA3EnX/7CoidVqMDJuloyoi730nViPBXMfJYw82Rgti
         C3ud4ouiKYD0aLK12hkEEy2WJkeSUAfpkrZ6IEFRgquwS+Xh97OHQrVNgOA0NeyJskZS
         THrOx4UfL4MBxh5rxDnV9Tap1yuOfhnld/eFBGNeA1Xb4Yam6WaX9qKNfpXeezN7hsmM
         pH6sWXXmiEUze+bIbGGrh2tWCScXd7jdA0+y+A5+6O74uvSNjhW91oGeUj/dUx/1l3gj
         qr5/LyvAC8ecyIr/0T32R7Zplg4BMDQdPm5/DYmzGiI5+BEkEHS1aSznljn+N2bDoo80
         P7+Q==
X-Gm-Message-State: AOAM533kHQ0cy5T1kTk1iW/WmMpaEe/OB4N0/SRy0kXoXeHKNzOuA2Gy
	LGidMTHkAc6Dabfhlr/Fe20=
X-Google-Smtp-Source: ABdhPJwLnCOMTp/YFFiQt7qAgqGIafwa/Zvye9jq08+ok2LMtYykHbSs3cMKDUgiUAXTtpah6hTN0Q==
X-Received: by 2002:a05:6808:1388:: with SMTP id c8mr9551414oiw.172.1628733162848;
        Wed, 11 Aug 2021 18:52:42 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id q21sm305718otn.61.2021.08.11.18.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 18:52:42 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH v2 0/3] staging: r8188eu: Clean up some smatch warnings and errors
Date: Wed, 11 Aug 2021 20:52:29 -0500
Message-Id: <20210812015232.23784-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch reports a number of warnings ans a few errors. Most are places where
the indentation is messed up, but a few are unitialized variables or
dereferencing a pointer before checking it.

Smatch does output a false message concerning a potential memory leak.
The pointer is saved, and the memory freed in another routine.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>

---
v2 - did a respin of the patches due to conflict
---
Larry Finger (3):
  staging: r8188eu: Fix Smatch warnings for core/*.c
  staging: r8188eu: Fix smatch problems in hal/*.c
  staging: r8188eu: Fix smatch warnings in os_dep/*.c

 drivers/staging/r8188eu/core/rtw_br_ext.c     |   2 +-
 drivers/staging/r8188eu/core/rtw_cmd.c        |   6 -
 drivers/staging/r8188eu/core/rtw_ieee80211.c  |   2 +-
 drivers/staging/r8188eu/core/rtw_io.c         |   2 +-
 drivers/staging/r8188eu/core/rtw_led.c        |  20 +--
 drivers/staging/r8188eu/core/rtw_mlme.c       |  16 ++-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  16 +--
 drivers/staging/r8188eu/core/rtw_mp.c         |   6 +-
 drivers/staging/r8188eu/core/rtw_p2p.c        |   4 +-
 drivers/staging/r8188eu/core/rtw_recv.c       |  18 +--
 drivers/staging/r8188eu/core/rtw_security.c   |   6 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |   6 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  14 +--
 drivers/staging/r8188eu/core/rtw_xmit.c       |   4 +-
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  16 +--
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    |   2 +-
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   2 +-
 drivers/staging/r8188eu/hal/odm.c             |  18 +--
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |   2 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |   2 +-
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     |   8 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     |  18 +--
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  87 +++++++------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  56 +++++----
 drivers/staging/r8188eu/os_dep/mlme_linux.c   |   3 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c     |   2 +-
 .../staging/r8188eu/os_dep/osdep_service.c    |   2 +-
 drivers/staging/r8188eu/os_dep/recv_linux.c   |   8 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 117 +++++++++---------
 29 files changed, 226 insertions(+), 239 deletions(-)

-- 
2.32.0

