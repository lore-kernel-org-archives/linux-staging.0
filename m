Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6BC70
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 10:12:07 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id p21so16821001edi.9
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 03:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1OU67HbwUr4do4pKiu+mprt4x/hHymYLyxHmplXnMyk=;
        b=qEBvSFM4ZWwzTqRLRXTSHiybKOUxWmGFiGsGwQWeKOr7LaN/7qptLh55siwChx5jbQ
         9QYgRuf4I3jzfrkTwZ6fY9BuARbfDk4K161QGYemaWqA2HR8MxbUwfUYJ1tM3wRKso4r
         gLqm8cyx/JTMLV9OyrFR30WVsuI/xEuFm/ys2Cz4Udosb0Je1iUJSdTe6CEyEQWI37lW
         1SMJv4eVjjY5j1p2d4Z9sNcFNMoa81b2kAXdN9AY6zL89cyXOTQBcsyju8IGz+vdjs8e
         TQJCeRKTHitUWrq8czBRW2vcShO23LBGOQIffaE7EBrX/W2R0h4gyoIpi3Mv189EPepI
         nfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1OU67HbwUr4do4pKiu+mprt4x/hHymYLyxHmplXnMyk=;
        b=APDa9hdooh2gewyA39LBguX2QGjzzBi69GN7TzRV1yzKMOhsDs87HVbrSOjE0IHAYz
         91EHTssbzA0ffG3Gbm+qtAgnynW3RVcDv3Z8mgPivua5osNsCUPgg637uDXXXM8MIzi5
         X8flzc+V7Z9PDrxsqAMJxCdZ2wPKiaeoNYogP938DpXBn/wAMf9hr+KcSIauT6NZSeVW
         O6oRVl2X7mEuscCbZE0ZkeOJlM+Zt6NCWRd77J2SlNm4fdNOHFA+sM1VMCXce5UfqbMb
         IhEFtQv7ofjNQnWwJZPCKHmw3j4jqjb+Bui7PUVlYsaZIo/K+xjXG4LzbsTRSRVXBn8z
         7LPQ==
X-Gm-Message-State: AOAM531q2eRWuDxton1qTFNrOkgxmN+CDNW+yzNrH+2Qq5Wo6W6KPnbS
	AKSkhk07IrvUtMxuvBjHQ0M=
X-Google-Smtp-Source: ABdhPJwRb/SaWQSJbZpmSrjSg+gknlPts8QLcsJW14g2tDk7rj44La14pFsuB8GBDzJMTt99nLEqsA==
X-Received: by 2002:a50:f113:: with SMTP id w19mr17549606edl.107.1628331126241;
        Sat, 07 Aug 2021 03:12:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::a83e])
        by smtp.gmail.com with ESMTPSA id u4sm3662514eje.81.2021.08.07.03.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 03:12:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/17] staging: r8188eu: remove unnecessary parentheses
Date: Sat,  7 Aug 2021 12:11:02 +0200
Message-Id: <20210807101119.16085-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unnecessary parentheses reported by checkpatch.

Michael Straube (17):
  staging: r8188eu: remove unnecessary parentheses in os_dep dir
  staging: r8188eu: remove unnecessary parentheses in hal dir
  staging: r8188eu: remove unnecessary parentheses in
    core/rtw_mlme_ext.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_ap.c
  staging: r8188eu: remove unnecessary parentheses in
    core/rtw_wlan_util.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_led.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_p2p.c
  staging: r8188eu: clean up comparsions to true/false
  staging: r8188eu: remove unnecessary parentheses in core/rtw_mlme.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_xmit.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_sta_mgt.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_recv.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_pwrctrl.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_io.c
  staging: r8188eu: remove unnecessary parentheses in
    core/rtw_ioctl_set.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_cmd.c
  staging: r8188eu: remove remaining unnecessary parentheses in core dir

 drivers/staging/r8188eu/core/rtw_ap.c         |  80 +--
 drivers/staging/r8188eu/core/rtw_br_ext.c     |   6 +-
 drivers/staging/r8188eu/core/rtw_cmd.c        |  36 +-
 drivers/staging/r8188eu/core/rtw_debug.c      |  14 +-
 drivers/staging/r8188eu/core/rtw_ieee80211.c  |   4 +-
 drivers/staging/r8188eu/core/rtw_io.c         |  32 +-
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  |  22 +-
 drivers/staging/r8188eu/core/rtw_iol.c        |   2 +-
 drivers/staging/r8188eu/core/rtw_led.c        | 354 +++++------
 drivers/staging/r8188eu/core/rtw_mlme.c       | 110 ++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 586 +++++++++---------
 drivers/staging/r8188eu/core/rtw_mp.c         |  10 +-
 drivers/staging/r8188eu/core/rtw_p2p.c        |  78 +--
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  20 +-
 drivers/staging/r8188eu/core/rtw_recv.c       |  26 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  22 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  70 +--
 drivers/staging/r8188eu/core/rtw_xmit.c       |  56 +-
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |   8 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  16 +-
 drivers/staging/r8188eu/hal/hal_intf.c        |   2 +-
 drivers/staging/r8188eu/hal/odm.c             |  44 +-
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    |  10 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  56 +-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  30 +-
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     |   8 +-
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |   2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  12 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  10 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     |  32 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |   6 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 162 ++---
 drivers/staging/r8188eu/os_dep/os_intfs.c     |   4 +-
 .../staging/r8188eu/os_dep/osdep_service.c    |   4 +-
 drivers/staging/r8188eu/os_dep/recv_linux.c   |   4 +-
 drivers/staging/r8188eu/os_dep/rtw_android.c  |   2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   2 +-
 37 files changed, 971 insertions(+), 971 deletions(-)

-- 
2.32.0

