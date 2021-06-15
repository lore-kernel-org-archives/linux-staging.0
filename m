Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346342FB8
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 22:36:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n35-20020a05600c3ba3b02901cdecb6bda8so2746202wms.5
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qeDnHq8ZJBiwEwWDSRdqHUmE3/dIBI2cdiaVs08gMLo=;
        b=epOWaywLJRBPSH71XG3Vle6CE6NTtTCbAqFfsszHrqBIjjnK9wfKEdnbhvK3aeMDX1
         00TuqDY+i0CObbK59pTM99vKCmIueuAIBR2udvbMqu4XOl1x/5Y1HFijX1sScw4WfXvV
         CRzhaw4TnuGwA4kpSEOlZRCh+3k4gm04KINdnqw6rN5l9ZgzXUhiP5BEqpmzfiLkc65f
         gWG/OXPNYW9VY4jIfPmG48fluyr4uXMQSAs6+Gq7LxZBjYlDI/BsKQRf3ppnTaK0gMw4
         lYPVnNvo+o7MxIwAueXo+smfuvJFRPP1NtLkl73GRX4ZF77Wzt1ZoAlD4hUQU0Cz+kbH
         3TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qeDnHq8ZJBiwEwWDSRdqHUmE3/dIBI2cdiaVs08gMLo=;
        b=fWg/I4cUZ+kG+KEZcSYEDBnFWcXeMcJ/QH4/tBe+Iwo/eGYKJv2Iw2NNu99ZoR2KmW
         P0l2xnKS90R4aTixJS8VCtZfZCXhK77cCC0FP576Vgxj7m950Kyd0rd+6vrQdivExYN1
         y3pzDc/EWGOQmi9QLCP/s3tKm2QAORlZwFked6A39lqWpR2z2lWNhOEwhZDef8px+diY
         XXq+cw2Le8nEhYw1+0JyqEzrpaWbSiTcsNE1tpgEammBB3higBLeK0IUNG2lwvBMDigW
         jNNJGjsbcOLDQHXC4jP7JR4lJY9N0WzK7+LIaeF6oJGCnEO4ih2koDN3aSKQpZ1vW7up
         MX+A==
X-Gm-Message-State: AOAM533npyJ0i2+7nvJEGDJ5UDN9+PHcbAAA7iq6VA8sZSmrzV6wHk5u
	bx/bgru9XVE9nj1b3aHGe2416Q==
X-Google-Smtp-Source: ABdhPJwk1z6ArKvPyCqIhocjUyi3ERhMpYt1WNwYo3S3cQqtshPrUgpdKiEOgfzCNCgZLnaa0VRKtQ==
X-Received: by 2002:a05:600c:20d:: with SMTP id 13mr1667903wmi.174.1623796572710;
        Tue, 15 Jun 2021 15:36:12 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id m23sm3934791wml.27.2021.06.15.15.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:36:12 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/7] Fixup unused variables and warnings
Date: Tue, 15 Jun 2021 23:36:00 +0100
Message-Id: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes an empty goto label by removing it and converting its
associated goto to a return. It also changes a decrement operator to
prefix to make it clearer, and provide expected behaviour. Finally, it
removes a lot of unused variables warned about by the kernel test robot,
which are a result of my previous DBG_88E removal series, and removes an
entire function as well which is surplus to requirements.

Phillip Potter (7):
  staging: rtl8188eu: remove empty label from
    mlmeext_joinbss_event_callback
  staging: rtl8188eu: use prefix decrement operator on trycnt variable
  staging: rtl8188eu: remove unused variables from core/rtw_efuse.c
  staging: rtl8188eu: remove unused variables from core/rtw_mlme_ext.c
  staging: rtl8188eu: remove unused variable from os_dep/ioctl_linux.c
  staging: rtl8188eu: remove unused variables from hal/rtl8188e_cmd.c
  staging: rtl8188eu: remove _dbg_dump_tx_info function

 drivers/staging/rtl8188eu/core/rtw_efuse.c    | 11 ++--------
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 20 +++++--------------
 drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c  |  4 ----
 drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c | 17 ----------------
 .../staging/rtl8188eu/hal/rtl8188eu_xmit.c    |  1 -
 drivers/staging/rtl8188eu/hal/usb_halinit.c   |  2 +-
 .../staging/rtl8188eu/include/rtl8188e_xmit.h |  3 ---
 .../staging/rtl8188eu/os_dep/ioctl_linux.c    |  3 ---
 8 files changed, 8 insertions(+), 53 deletions(-)

-- 
2.30.2

