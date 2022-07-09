Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF47B
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 09:45:09 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id d2so1415624ejy.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Jul 2022 02:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qS7NXICXrYzuBu2snw80niT0A4edSVecKeyrASDHwuM=;
        b=GdQW1oqRvMc3yiC7ZNvWSPLUsJxkUXwqRI1bpd0hHdW0x3QGrYY+A53OSInxYU4ZXK
         CiWf0ybDuPhOorntfXXdJiQqxTJ7YSzSMSzTllbUh43LVq+C6g/XgLNkOOGSvxl/9iPw
         6egTjXkmM8yO3EpRBd9gM5+7EbU/9FBG2D328FZcsCh8hwCJOB1OTknngASzKTbBP7Fc
         B4WrZ3pkGPDWZV8hy0eCy4JdRvmjXH/6/za6j67nLnA4ul8tSCMcFzCBVIfOF6DV/Hy7
         /++/BsXWND9tg7WRxuJ/BRsqxWNXRbUS+8piVFV/gqnuYhdRLhscD/flqDFer2VqlZJA
         OM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qS7NXICXrYzuBu2snw80niT0A4edSVecKeyrASDHwuM=;
        b=b17Xjlm/KDjv+b5MZakhrKaAr2qgWHLrx3SI6GmQoXjxP908x0yel8t1aCYq5EGKaf
         61pE6QpM2ISQjePO/Z0KkezG9B41QXWuBoMYszH4CF4FaBawDcOLRMrkrP4fP3BAOPz4
         sE3H3fZ5uxdDJQxlG8KiPlwqLbFAmH6v+30KmerGFQfnLuecagLqMMkgVoF2GAHxY/Rr
         QSkA8d8SLZyOQgj80LBow1/k9OIqS2wQ6TpJfRPKk09KwF7yRT9JcT7l70td3cLwtBu7
         osyJsQVLzs0Uf0UXvdQc9MitAPossHZMqobK1Yh+bzxofgK+jFEJ2wlxDadrFOCVv0yN
         2aLg==
X-Gm-Message-State: AJIora9AvcoezoK/eirjdSW8tQKAl/bKjo343bre73fGm0PQ72V6ca76
	HzBT11bVRQoOG6okY5zhfVg=
X-Google-Smtp-Source: AGRyM1vnx4HdESYKOr7xrUNQ2ey1+/7ybWYZyOf69dfDAJGDkNnO3hGU0PNdhyxkn+kjPRqpEjSnuQ==
X-Received: by 2002:a17:907:a421:b0:726:ee5f:718a with SMTP id sg33-20020a170907a42100b00726ee5f718amr7985663ejc.368.1657359907891;
        Sat, 09 Jul 2022 02:45:07 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6f.dynamic.kabel-deutschland.de. [95.90.187.111])
        by smtp.gmail.com with ESMTPSA id hy10-20020a1709068a6a00b00704757b1debsm441521ejc.9.2022.07.09.02.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 02:45:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: SetHwReg8188EU() cleanups
Date: Sat,  9 Jul 2022 11:44:53 +0200
Message-Id: <20220709094458.9578-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some more cases from the unwanted function
SetHwReg8188EU().

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: remove HW_VAR_BASIC_RATE from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_DM_FUNC_OP from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_DM_FLAG from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_DM_FUNC_RESET from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_DM_FUNC_CLR from SetHwReg8188EU()

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 25 +++++++--
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 51 +++++++++++++++--
 drivers/staging/r8188eu/hal/usb_halinit.c     | 55 -------------------
 drivers/staging/r8188eu/include/hal_intf.h    |  5 --
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  1 +
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 10 +++-
 6 files changed, 77 insertions(+), 70 deletions(-)

-- 
2.36.1

