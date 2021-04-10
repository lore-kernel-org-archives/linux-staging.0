Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043A71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 15:00:21 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r22so9832512edq.9
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sMhLL/zmfb0UTfjF/sD2Sc2fOjk1wvP7x0u+3C18oCY=;
        b=W59pRIcct6yXQX+TT3XK6OB0EQPzdKY93PYF/MoLTjbXvLETtuDWkvXb2RHDswlLlY
         OTGMcF09BYPVmmu16v8IZzLbsIyf/Agm5TVRWPQdHnV91bQRFRHiOXKQ05c61/4r7ZZ4
         o0/8cHxDNf/ZAVQEbuv8WmF5LWCk+SwEv1HbkyfUu4mu0BOtjTj+xgSC7bVElZ7eXB1W
         Xw6v++W2bDtAS40BYAsCysTqYWHeP4n1hxb2VbFHU1xVpriIM4wbSkX1VCkG7UtMtWXY
         a1s12/wTQS2bk/KbEMmwmP1uyX/k9smBqexOgLWBFbxsNd5nBnzI103StT4m5dCUA2OE
         yntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sMhLL/zmfb0UTfjF/sD2Sc2fOjk1wvP7x0u+3C18oCY=;
        b=LbZ8+KjPkvAZ4Mxw+WAalbOVr349QO5RIPZBU89eijAaETyZcw0eQLkgxfgRGMSSu7
         LxW5ebAAb4H/TPy2YjQB4gGps6FrMdGaRQ/AoB95DQ4kuX1c2bLtN1CdZHcY0FueFm28
         2kgwhC0rj0kZ3WJ9bp9oIeDgKEt7kKUDZMFv9BuL4je+VstTVlum/l8tkmEqqgM5zJA6
         yaVUUiRRKy2Y63GzqSThTla44662VF09qhjcMLOLFA+eL9DESlsZJM8hb/LCoEVd0EnI
         UibpkVZgfUcKm16P2UA7PBqj/mMlIQ+xDzuv8gGRUrYtmWogvjPE/nguhgRBqc5ZZ7yC
         KHgg==
X-Gm-Message-State: AOAM531ndDo2v/pO6Qq8ZTuMnFsgvy7Kn7/JicuASBZMj4A8mnIVMUC+
	Gn90oLbs2uU9Wa8WiPSemW1J+7ogYNk0FG8K
X-Google-Smtp-Source: ABdhPJw7FSWaqhkVVFBs/1LXOF8G6W3WYP6O8sO027EixpBG1DwLbnYg03RM1An6rLOGTKelp1cyKQ==
X-Received: by 2002:a05:6402:4386:: with SMTP id o6mr23039910edc.307.1618066819873;
        Sat, 10 Apr 2021 08:00:19 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gb4sm2719494ejc.122.2021.04.10.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:00:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2 0/5] staging: rtl8723bs: Change
Date: Sat, 10 Apr 2021 17:00:03 +0200
Message-Id: <20210410150008.5460-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove camelcase, correct misspelled words in comments, remove an unused
variable, change the type of a variable and its use, change comparisons
with 'true' in controlling expressions.

Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

Fabio M. De Francesco (5):
  staging: rtl8723bs: Remove camelcase in several files
  staging: rtl8723bs: include: Fix misspelled words in comments
  staging: rtl8723bs: core: Remove an unused variable
  staging: rtl8723bs: Change the type and use of a variable
  staging: rtl8723bs: core: Change a controlling expression

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  4 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 18 +++++-----
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  6 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 14 ++++----
 .../rtl8723bs/include/Hal8192CPhyReg.h        |  8 ++---
 .../staging/rtl8723bs/include/basic_types.h   |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   | 34 +++++++++----------
 drivers/staging/rtl8723bs/include/hal_data.h  |  2 +-
 .../staging/rtl8723bs/include/hal_pwr_seq.h   |  2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  6 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 18 +++++-----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  2 +-
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  4 +--
 drivers/staging/rtl8723bs/include/rtw_recv.h  |  4 +--
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |  2 +-
 drivers/staging/rtl8723bs/include/sta_info.h  |  2 +-
 drivers/staging/rtl8723bs/include/wifi.h      |  2 +-
 24 files changed, 71 insertions(+), 73 deletions(-)

-- 
2.31.1

