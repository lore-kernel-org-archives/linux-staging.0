Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8621C2CA8
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 22:11:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id v8so4027225lfd.8
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=np9qQNRe/434uUffTp5fkNq//+6BgIG1Jqjo8T2tQq4=;
        b=mVXnIcfDowm0H9W6YJlJel6lMFCikH4arwUrKuuRIFQ8GsrMRKn8vO7Utj9nZZj0tw
         TrO4FkvAxS9v1u2dxjdX4iDxqjM0MY7Sjif/BiSYGOvVmV9p1jMqgHTkxt1JiaLn6QfJ
         u559aOYqgsjSAiTFHJ8E9/cAb5nQIsGwYYaJuX79GkleImiovIqjuuDBvBheReQimeRv
         t/0WMxJ88K0b94eBFgMMKxSNm9GsRG4eMBjUhhdR3pP5sP4UiU1c+2YnP8UPeiUKxNcB
         Rue2SSQ64bFEEi3WNcbu4a3lw6FY/EjWCt8s2w2y4v/BqdXLZbX4pfnzTH5NecD/knzh
         wwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=np9qQNRe/434uUffTp5fkNq//+6BgIG1Jqjo8T2tQq4=;
        b=ingdBK5PjMJzXK/8m1H4y7nHQ5/eB6+WWyuXA7vRuq+1Ry1ugwePgbuNC+nu0kuLhi
         cLj/MRmHt6+x+bcRvZITswyltq5xzgqMWauDX70jddNbpErS87yiVf9qs5cRJR808Y4A
         NtbFf5nH7a9YNTeGm/rw2vp5knMIXGrvWYpKCGekK87TFf2IzDQhXxsAAzw0DNFcnvfN
         z/BvzDelvZstQNQyHDr8EL+1PxF2fqOtWPtBHPEUOX82I+Sby4QY4dRR3i3IueGvNypD
         wiMyePyKrQZQSDowdDJNWylW6nU77WEm1SoTx8d4JZeHuiuc4QAb+D2HP5UTIPXwyKvS
         PcHA==
X-Gm-Message-State: AOAM531ikzwbszq9wtCQznFCcEGXwJw4bVAAgSK8vvh9emEKl1b3v5KN
	TdpTgWM4VXTV10TW5GTxHRc=
X-Google-Smtp-Source: ABdhPJySSMcW9Cf36RqzFKxgy2nAY+ds7Cn6Au7dGczI6ytJbTCgPr59yAnHTD3DkEgvGCHe3pFq1w==
X-Received: by 2002:a05:6512:3341:b0:44a:eb29:c59c with SMTP id y1-20020a056512334100b0044aeb29c59cmr1056155lfd.596.1652911908406;
        Wed, 18 May 2022 15:11:48 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id v21-20020a197415000000b004742009e038sm67500lfe.126.2022.05.18.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 15:11:47 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	dan.carpenter@oracle.com,
	fmdefrancesco@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: add error handling of usb read errors
Date: Thu, 19 May 2022 01:11:43 +0300
Message-Id: <cover.1652911343.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

it's reincarnation of my old series for adding sane error handling in
r8818eu.

*Problem*

Old code was returning just stack variable in case of read error. It's
not the best approach, since passing around stack data might cause
device misconfiguration or even kernel data leakage

To solve this I've changed rtw_read{8,16,32} prototypes to return an error via
return value and data via passed pointer. Some work should be done to
propogate an error down to calltrace, but it's good way to at least
start doing sane I/O error handling

Tested locally on qemu with TP-Link TL-WN722N v2/v3 [Realtek RTL8188EUS]
device. More testing is welcomed, of course :)

Series is based on top of staging-testing branch

Pavel Skripkin (4):
  staging: r8188eu: add error handling of rtw_read8
  staging: r8188eu: add error handling of rtw_read16
  staging: r8188eu: add error handling of rtw_read32
  MAINTAINERS: add myself as r8188eu reviewer

 MAINTAINERS                                   |   1 +
 drivers/staging/r8188eu/core/rtw_cmd.c        |  15 +-
 drivers/staging/r8188eu/core/rtw_efuse.c      |  32 ++-
 drivers/staging/r8188eu/core/rtw_fw.c         |  62 ++++-
 drivers/staging/r8188eu/core/rtw_led.c        |  20 +-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  62 ++++-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   9 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  20 +-
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  21 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  20 +-
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
 drivers/staging/r8188eu/hal/hal_com.c         |  24 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  37 ++-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 117 +++++++--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  30 ++-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 239 +++++++++++++++---
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  33 ++-
 drivers/staging/r8188eu/include/rtw_io.h      |   6 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  61 ++++-
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  19 +-
 21 files changed, 681 insertions(+), 162 deletions(-)

-- 
2.36.1

