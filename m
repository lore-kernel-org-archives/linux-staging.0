Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC6F177
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 21:58:12 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id u25so6887422oiv.5
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 14:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ffEovo72jB0896lCY2QBWVkyqJIjuYfWFlsrTfJBxg=;
        b=mObmYPmrUe5F/Sce0a+/DAl71hlQHvvp3ewU5maNAgyvE2N+FDBnuSoptCVq4xVvIK
         L8cYBF5b/t49KCwixfnFIaNfpgFzkqgWI5opBQsYeJl2rL90RoRGVyJWdfbRsIOLX/qt
         rEypFxSq9f5Oy0Fd5ziFDJttLUjCNh2+zMjW6slETmJWcV5JVjQ/Xt5rtr/dc/mitzt/
         MdvTW6PMuLRQ5/JRG0G06NdFxt0xCG7puDN4ev/LTR19j6qp+JeGofChyd3T9Uvzn9V/
         PGmcDEYYsfEaj90huTo92iwNL3XGNW5GdvSOb77YxbSidAebHRsOVcEzFrGBsWM/foFF
         SxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=4ffEovo72jB0896lCY2QBWVkyqJIjuYfWFlsrTfJBxg=;
        b=mF4vuKS2cVC6/vZG3BeTkoEfELwKdamlokNtiaslvLOq4fZLviua1B6hS/qLk6BTYx
         sTMvmdKBBPmlHLqHnBsf9Zd9PPTlIKYqSVbztTt14NhT5UzHz1UOF4d+s/O1BrYEM6kt
         ggoQxjGmBJhDE+ny0WL5iDQMCpz2nqNsxHSOahjUh93awVX5caOXCQ/tYj2mVUx1aSqE
         bqwquguPbNhUVzvhWEXoR/DNWv/nan+8t6fTBuv3xtbKINerap1vy3TsFDXpP5yKGJWn
         exNJO2m9LVVfIgkL0tiRDu9TjFiyXGQAflzaftsehkMEtjhAdz2rDPj7oLgNKU2j4Whm
         X9pw==
X-Gm-Message-State: AOAM530ThcTBgfH6EPORXaLDDjSavN8OJiezMeV4C+PctJ1wLCAvd4qi
	HPLe/SKqB5qaF9D4CE8aHZ4=
X-Google-Smtp-Source: ABdhPJwCwqc5nxBifSF7+iCKeyF4RlYjCeQu5PIyYosqeOKKe5yY68G0Ixz5/IUJsMPUTVwSWpN6nw==
X-Received: by 2002:a54:4197:: with SMTP id 23mr8857720oiy.159.1628719091809;
        Wed, 11 Aug 2021 14:58:11 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id u126sm105852ooa.23.2021.08.11.14.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 14:58:11 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 0/3] staging: r8188eu: Clean up some smatch warnings and errors
Date: Wed, 11 Aug 2021 16:58:03 -0500
Message-Id: <20210811215806.20426-1-Larry.Finger@lwfinger.net>
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
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  58 ++++-----
 drivers/staging/r8188eu/os_dep/mlme_linux.c   |   3 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c     |   2 +-
 .../staging/r8188eu/os_dep/osdep_service.c    |   2 +-
 drivers/staging/r8188eu/os_dep/recv_linux.c   |   8 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 117 +++++++++---------
 29 files changed, 227 insertions(+), 240 deletions(-)

-- 
2.32.0

