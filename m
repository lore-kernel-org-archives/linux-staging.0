Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB92FAD
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 20:56:10 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id by4so28533948edb.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aoItqzXOHntzCchNL5rIsd8p+kh/W+iiqjyy5NjMfJA=;
        b=EDES33c8tZEwiq4s1gNTxOvGc9nSuJ0NdqPO+To/3fG5YOY+tbFJk0cnXg+H+FIYa5
         cdlu0+TIVwFf7sRo1EuoBxZVyowE3w0mGKWTfOWq54OBwuBCm2reiaCP91C9i5ODVqbE
         /L2dzhYDsknei+rjPa7kjDxZ08e9Zg6zeMrBM4VWNG9AenXwd42rpzk3bXpQ2GY2oJKF
         BaUeNLXgXzDU07YlFGkwebzeZOfRrEKsSHY16SKgroPCPNoT5e2PgK/0gVk1Oz+L4xhw
         sjK3uwydl4OWx/Gm8ur30s1qiRBarWJuignFTiH1m7scsubNtRcLsE2rkp93ATpKytyx
         l1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aoItqzXOHntzCchNL5rIsd8p+kh/W+iiqjyy5NjMfJA=;
        b=KWpxSGOvhvuH+9JqFJMFQ3f21UkQ23EhgLLajYnWS1cAWiDGncYMIy34TVBXQ3cIdh
         Pc54RZ6LRNdjo90imDCGzhsyt7bGflk3YmV42kQso8gzbwRJvRBvfFIMS7p/U5h11zxU
         2AnOv2j+dPAkE1X3km86rkMZOPC9Bl6xS9Onz1vu1dvq2fYYoUwKyWFsgIinLXlBvPbj
         ysdXm971c4cf04sQazIfKo/vDMpEqnD3ZxdsNERkK/lBFy6/pVk9ZrgIhOXTaM1TPhzs
         OVYgIcoKJ7PYjIzAzYC85/pXWVMQr08zq4cLDID8tgDNzrJCnuz469ZICtQtEXInmJTZ
         A80Q==
X-Gm-Message-State: AOAM533cxkHiNLG00sNfTVOzgaWsoV+b8/J3YAonhXV92DxvzOMyhSNT
	G3kX2WlxyfHyGsRlM+nHdaU=
X-Google-Smtp-Source: ABdhPJzLWZa4CwGbYcc5OdSJcBncxavfel7BKlS+3cFTg+uXp3T/t4bwe+UX3FYUM1fyP+vFy3VVWw==
X-Received: by 2002:aa7:db47:: with SMTP id n7mr71967edt.15.1629147369305;
        Mon, 16 Aug 2021 13:56:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id ck17sm36967edb.88.2021.08.16.13.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 13:56:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: clean up spacing style issues in hal dir
Date: Mon, 16 Aug 2021 22:55:08 +0200
Message-Id: <20210816205511.20068-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up coding style issues in the hal directory
reported by checkpatch --types SPACING.

Michael Straube (3):
  staging: r8188eu: clean up spacing style issues in hal dir, part 1
  staging: r8188eu: clean up spacing style issues in hal dir, part 2
  staging: r8188eu: clean up spacing style issues in hal dir, part 3

 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  48 ++--
 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |  22 +-
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |   6 +-
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    |   6 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 138 +++++-----
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   2 +-
 drivers/staging/r8188eu/hal/hal_com.c         |  36 +--
 drivers/staging/r8188eu/hal/hal_intf.c        |   4 +-
 drivers/staging/r8188eu/hal/odm.c             | 114 ++++-----
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |  84 +++----
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    |  70 +++---
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |   8 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  74 +++---
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 238 +++++++++---------
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     |  40 +--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  60 ++---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  66 ++---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |   2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  10 +-
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  |   2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  36 +--
 drivers/staging/r8188eu/hal/usb_halinit.c     | 162 ++++++------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  20 +-
 23 files changed, 624 insertions(+), 624 deletions(-)

-- 
2.32.0

