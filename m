Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685E259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso5260367wmi.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT97JimwWqdXkAjZA44yEtpuv0qlddxSSVFYHgByYgg=;
        b=oi6J5+9AivKOGGQkPiS2NjT6E3b5tlBVNQ8f66A4cFo6s7Zv1teiCw6xoXswUustom
         stuwJJuyf4kBtYV4Gi1kpNK9xoPS5nRuOmYGVIqi5wqrvSecqgyB4nee+Ps1+WfDsgZn
         m87D6jUBz7ieFS28bkd8rJLjB4Uu9dvOoz635PHpdqcuWRKAWyTFgG4VPX+HxvpnXcZH
         M9geuZDPPeTVumuOT1/lGsY9llkxWDKv+Du74QwrMsJEkMcbLBi8HSsTEgAY9YCBRoDg
         nnj9KKadlatrpXtJi9Jh2Z2vi5wSs45LDPNqaSKE9GMtj6Yu/QZu0WN/HU65tXPjtuuX
         zL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT97JimwWqdXkAjZA44yEtpuv0qlddxSSVFYHgByYgg=;
        b=ao3tgyZntodp6Ee+cJOCOkgx/rLeAiEG9LHHO/qa9+LR2WaHWS0rFsPzfOIG7iqHKu
         iW+l9MhJM4DcvylU02WExq3x1b8CCjTf6/9ssX7Xr9r5P2QuX4d5r95wwC1EIo8KTpd5
         PgWDJdZ8iJOlOnBsks+BgIYw80h7D+TCLAkIx3T2+GQMt65L4ATfNjLIbPtBk8xiwY5m
         7mSAcLttPCInW+CBMPk4vKQjt5kUnTMXB38+hJnau8QNp67ko/rI3yBKF1MGcHY4g0r6
         dJL50cNhd6PRx1NLRErL6mt4hogKoBdcMZY1zIFLbFvIDhwjfrUOy5NG/mkjeDqpzVjh
         y/jw==
X-Gm-Message-State: AOAM533DojJfjkvrsTgmoI6HTtbB95MOCJq0aftWFP/Yj+a4Bbaj4HLX
	GmuksD9ZGt3HCoBFpAHqd1U=
X-Google-Smtp-Source: ABdhPJwWNyxVlAq39t9pBVAgGw5NoNNuFliOakVPT+rcoHoC6vmn5y7r4tcuXxfmc9Bst/O+jiry5g==
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr16592788wme.172.1617441254306;
        Sat, 03 Apr 2021 02:14:14 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id v189sm15801645wme.39.2021.04.03.02.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 00/30] staging: rtl8723bs: remove RT_TRACE logs in core/*
Date: Sat,  3 Apr 2021 11:13:22 +0200
Message-Id: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes all RT_TRACE usages in core/ files.

This is the first of a series aimed at removing RT_TRACE macro.

The whole private tracing system is not tied to a configuration
symbol and the default behaviour is _trace nothing_. It's verbose
and relies on a private log level tracing doomed to be
removed.

-------------------------------
Changes in v3:
	- written better changelog in single patches

Changes in v2:
        - isolate checkpatch fixes in separate patches
        - removed two if conditions in core/rtw_wlan_util.c

Fabio Aiuto (30):
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_xmit.c
  staging: rtl8723bs: fix condition in if statement in core/rtw_xmit.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_security.c
  staging: rtl8723bs: fix line exceed warning in core/rtw_security.c
  staging: rtl8723bs: fix spaces around operator issues in
    core/rtw_security.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_eeprom.c
  staging: rtl8723bs: fix error prone if conditions in core/rtw_eeprom.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_pwrctrl.c
  staging: rtl8723bs: fix logical continuation issue in
    core/rtw_pwrctrl.c
  staging: rtl8723bs: remove unnecessary parentheses in if-condition in
    core/rtw_pwrctrl.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_cmd.c
  staging: rtl8723bs: fix null check conditions in core/rtw_cmd.c
  staging: rtl8723bs: remove unnecessary parentheses in if condition in
    core/rtw_cmd.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme.c
  staging: rtl8723bs: tidy up some error handling in core/rtw_mlme.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme_ext.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_recv.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_recv.c
  staging: rtl8723bs: added spaces around operator in core/rtw_recv.c
  staging: rtl8723bs: split long line in core/rtw_recv.c
  staging: rtl8723bs: remove unnecessary parentheses in core/rtw_recv.c
  staging: rtl8723bs: fix comparison in if condition in core/rtw_recv.c
  staging: rtl8723bs: remove commented RT_TRACE call in
    core/rtw_ioctl_set.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_ioctl_set.c
  staging: rtl8723bs: place constant on the right side of the test in
    core/rtw_ioctl_set.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_wlan_util.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_ieee80211.c
  staging: rtl8723bs: add spaces around operators in
    core/rtw_ieee80211.c

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  53 +------
 drivers/staging/rtl8723bs/core/rtw_eeprom.c   |  56 +++----
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  90 ++---------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  79 +---------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 124 +++------------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  39 +----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  56 +------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 147 +-----------------
 drivers/staging/rtl8723bs/core/rtw_security.c |  41 +----
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  25 ---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  24 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  82 +---------
 12 files changed, 101 insertions(+), 715 deletions(-)

-- 
2.20.1

