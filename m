Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4071
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 09:22:38 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id g5so5616732ejx.0
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j6Hgr1/sJJuLw4JsoDZoO0HpzSCcQbNfMw8CuF77WYo=;
        b=gEjYqvDoOF1dDhmzRVR2z+XELtVZkb4wgK5o0PD8utd14YnS+87ij8cRoTNTU8JYSK
         sEtfSgdHaIzMgK+86tpxSSxs7imjOfmtqCJ0DPhAT2/4AdRtMqxkNQ4tXWuoQR4BGNHb
         qbLub64zmF2lTNTkOL+oLku/MY5NmECBBKzKug1UcoKaxGUjCP5moQtOHMifnNwY0K6W
         aT8++simrBcnDPAdDWLiuaSr8pGDFEfXpsWZTV8DLIzF/LNvNmfp2WpeeV4JAWXSyTUt
         h03373bTqdMwPmhHRUmHg4xualF/MP42FWZTUZ4qJxxq5xsDxxRpSOKxjSS+DZ8RbVx+
         lhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j6Hgr1/sJJuLw4JsoDZoO0HpzSCcQbNfMw8CuF77WYo=;
        b=e8nrKlX8TFeUiHVs+axMoz3czcmFxLDRLoCx9oUOXbhyPXSx2VnXjIWLIHfMvmB+J/
         WOCxLT7pNoyq+Qf1l5eearHw1R8EvykqfEt5qekiecVrUg7MnZWfS4QaykGhs84LX76L
         OwVab1LKg7xOhPnI90wCAuJIviwSdSAACoh2i1sdaOSoS2VGD+vcpJQhSOCkWOkz4nGm
         G/vs0ag11yVS2CNDdFyDXn3lwuQ4isvGrSjPuVDzNDGZs1v41T9YSxxjFXDTGogF9nzT
         pHd0qGfmlIiPvxtqFoXOV8zbgnYwpr9eZit5ghN7qInXME6lRedWrA7NzcRWMF+X8X51
         /hxg==
X-Gm-Message-State: AOAM532mR04JbM1X+JgCpqU/lh5gbz9RrZFtJN2uH8ZiJd1p3/Fnixwg
	YFTrqSbteklUMAMD5EkWRbw=
X-Google-Smtp-Source: ABdhPJxkauEDpltFY4Z5f/Kg7I1GeZkUezEZKjzPTB4Jqa3wrYKNPh8QrnvcPzkRw9505etCGPbbLw==
X-Received: by 2002:a17:906:3f88:: with SMTP id b8mr19971657ejj.36.1618046556670;
        Sat, 10 Apr 2021 02:22:36 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id a22sm2801624edu.14.2021.04.10.02.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 02:22:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 0/4] staging: rtl8723bs: Change several files of the driver
Date: Sat, 10 Apr 2021 11:22:28 +0200
Message-Id: <20210410092232.15155-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove camelcase, correct misspelled words in comments, remove an unused
variable, change type and use of another variable. These changes affect 
files in different subdirectories of this driver.

Fabio M. De Francesco (4):
  staging: rtl8723bs: Remove camelcase in several files
  staging: rtl8723bs: include: Fix misspelled words in comments
  staging: rtl8723bs: core: Remove an unused variable
  staging: rtl8723bs: Change the type and use of a variable

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

