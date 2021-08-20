Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CDE72
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 17:07:35 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id q21so18327252ljj.6
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5w3aD/4Jry4S4+SCqfDyrWdgfV6zXBwV1v34ZMdy1PI=;
        b=jmm4EiIAxrd4gbp9UMxggwALz/2cjmpR1B9o0h85Yy5MycWFrUUDm0iFi/iGPBmU9w
         BTDEK2IPe2qPyCxYnXDkIJrUkfQGjmUscW5S3vurHezVdx8LYIA2nD1yUI0dfTqZXm/R
         PfLGfDoZStCVui6FjM+VdfKZx7eXln3bECWOefuepCWvgFqSxsS7qq+N+2JliBkdc4+c
         NaSVx8M3i87xUroXOysb8ihoKF5+jpjWhgrX5iZf4aBrCdUCSXIUWdW+BdPMRmLMubIa
         jxnMNNTAZwAGUBGVjeErOQND56fVPB+rAedUa5VcgyCe7EOcsAuGYfSpgEksGf0UToNM
         lN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5w3aD/4Jry4S4+SCqfDyrWdgfV6zXBwV1v34ZMdy1PI=;
        b=eyqCTzH3dAHynwZNBBSPDBluJy/IZxb59xdU1hLkSRlhBy/ZQORjdLjlZJ8t3LChAg
         aX0+JW1piGi+Q+E5C3iUlD96B8+3F4swnGuzLbYn/HFUgxBvDyKFKwZvtiCsxedaa8pE
         Eeq1Mb0ne22P2pQEkVqtNzCkZBtB3/NFjuQYOGNuYnkz1/U4uBtbQsQ1z6HvHzeT+/7m
         DH7ScMw6MXq3lXlQnyAA3aC+Y2raGcge65JXUKuwCHXtCd4E2abl3dl61Q3kULihM+vT
         C+ZyMU3vw/gcL7lQ6C+yD45lDvl7+Vkm9qTTwOp080VNiR8Zn+0PLpSsqvzJRS87KU1B
         O6GQ==
X-Gm-Message-State: AOAM533aDwqOBepXhXxzajw5bjNokuJYA7p5rUtRr0eDh5/dvlGd2sQ/
	K5U1bHUw13OsHYWKuXj9k5M=
X-Google-Smtp-Source: ABdhPJyt2eYXE3jgJi+T7eVSQbYPiBYy2adHX89czVPIb+QYqQOqRNNWdZawIAX38UiyJIS1CtWBvg==
X-Received: by 2002:a05:651c:50e:: with SMTP id o14mr17392732ljp.351.1629479253220;
        Fri, 20 Aug 2021 10:07:33 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id q18sm569163ljp.19.2021.08.20.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 10:07:32 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
Date: Fri, 20 Aug 2021 20:07:28 +0300
Message-Id: <cover.1629479152.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Greg, Larry and Phillip!

I noticed, that new staging driver was added like 3 weeks ago and I decided
to look at the code, because drivers in staging directory are always buggy.

The first thing I noticed is *no one* was checking read operations result, but
it can fail and driver may start writing random stack values into registers. It
can cause driver misbehavior or device misbehavior.

To avoid this type of bugs, i've expanded read() API with error parametr,
which will be initialized to error if read fails. It helps callers to
break/return earlier and don't write random values to registers or to rely
on random values.

Why is this pacth series RFC?
  1. I don't have this device and I cannot test these changes.
  2. I don't know how to handle errors in each particular case. For now, function
     just returns or returns an error. That's all. I hope, driver maintainers will
     help with these bits.
  3. I guess, I handled not all uninit value bugs here. I hope, I fixed
     at least half of them

This series was build-tested and made on top of staging-testing branch


With regards,
Pavel Skripkin

Pavel Skripkin (3):
  staging: r8188eu: add proper rtw_read* error handling
  staging: r8188eu: add error handling to ReadFuse
  staging: r8188eu: add error argument to read_macreg

 drivers/staging/r8188eu/core/rtw_debug.c      |  79 +++-
 drivers/staging/r8188eu/core/rtw_efuse.c      | 119 +++--
 drivers/staging/r8188eu/core/rtw_io.c         |  18 +-
 drivers/staging/r8188eu/core/rtw_mp.c         |  38 +-
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  20 +-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   6 +-
 drivers/staging/r8188eu/core/rtw_sreset.c     |   7 +-
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
 drivers/staging/r8188eu/hal/hal_com.c         |  22 +-
 drivers/staging/r8188eu/hal/hal_intf.c        |   6 +-
 drivers/staging/r8188eu/hal/odm_interface.c   |  12 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  37 +-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 260 ++++++++---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  26 +-
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  20 +-
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  17 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 412 ++++++++++++++----
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  55 ++-
 drivers/staging/r8188eu/include/hal_intf.h    |   6 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |   2 +-
 drivers/staging/r8188eu/include/rtw_efuse.h   |   4 +-
 drivers/staging/r8188eu/include/rtw_io.h      |  18 +-
 drivers/staging/r8188eu/include/rtw_mp.h      |   2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 168 +++++--
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   4 +-
 26 files changed, 1072 insertions(+), 301 deletions(-)

-- 
2.32.0

