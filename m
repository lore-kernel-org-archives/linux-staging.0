Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C69809
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 12:06:41 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id r13so22078691ejd.5
        for <linux-staging@lists.linux.dev>; Sat, 09 Apr 2022 05:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4E8eHD2LjgOkxXkJxCrrou4dw9MQCmrHPwVfgpBx/zE=;
        b=U4qMUS2qylwk458bucVJvxFMvhPJTq4piE1OmAH5yMV1h1f0YQF63Hw7O4kpzwKItR
         92x3Cf6xIh1cm3S/AR/DaFOivECLGHYqJoMdFt8lb8rli377kUzhDl+7wxQV0TMFqXSB
         vr3u+HljDE3wH3DEK4XhIzWKSJG6IzsGz/WHf7OAhmuPSnl/HgrfxBCEPpQm5BrOY16w
         EUX4pfQjuhBAZhC9tCqeqW+bz/h8YNNi/OyYsKIytaQrPTnLQi4o5ej9swuVb9qAFkb7
         OIS6VRJbp0+G7vES7nLAwuiB4xCgF+pYEr+kAyN+kJPXBfJ65ayZIifB81zmORm19n2i
         dyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4E8eHD2LjgOkxXkJxCrrou4dw9MQCmrHPwVfgpBx/zE=;
        b=NI8iJhlLaKHLZ/kprZWAn3xf8+hw/qEPXlCV6itfLjR4iy9tCcAZ+6aaDY+gt2+8ci
         qWW7zK65cvdY5CgPnuw5EogLv70wu03TxQYvPSvaQzS6QeG+oXszwxLRo8pVVfJi4KLx
         rlI80+gyzfbtCWZ4pT5R26KVs8IAmYB5UszWkCoosHz5x5vmlBHoYbZ8hEVHfuhfUrEW
         3JuxnSFlY6qjltEa0gdlrXPr41MavNUGx0dfxHLzL3kP2bC8Pm3+bj7+qmiEqIskV1Rt
         1ddVdar8NrXmdtpVU0bZsrN7QRXmjR9P+sM3dNA1ilkFiLx8XxjkXMm78R+U+Vp6yaFo
         82KA==
X-Gm-Message-State: AOAM531QfVR0mcjt8pzQB6S5q6lDi/7bDyEgCTo2idklkLrJsQoWbjuF
	z1epvOe7707lTGnWsB7/anI=
X-Google-Smtp-Source: ABdhPJzeUygIiKJjYEcp1x+lnl0P6edcX3nvDH7/1QrfX8bOFA7QoBM120Eqlj81NkTrl0GII8p3zw==
X-Received: by 2002:a17:907:3e17:b0:6e7:10de:80d5 with SMTP id hp23-20020a1709073e1700b006e710de80d5mr22586173ejc.404.1649505999799;
        Sat, 09 Apr 2022 05:06:39 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906435500b006e8669fae36sm1102947ejm.189.2022.04.09.05.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 05:06:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: SetHwReg8188EU() cleanups
Date: Sat,  9 Apr 2022 14:06:23 +0200
Message-Id: <20220409120627.10633-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next round of SetHwReg8188EU() cleanups. This series removes
four cases from that unwanted function.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: remove HW_VAR_INITIAL_GAIN
  staging: r8188eu: remove HW_VAR_MLME_JOIN
  staging: r8188eu: remove HW_VAR_FIFO_CLEARN_UP
  staging: r8188eu: remove HW_VAR_H2C_FW_PWRMODE

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 91 ++++++++++++++-----
 drivers/staging/r8188eu/core/rtw_p2p.c        |  4 +-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 19 +++-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 80 ----------------
 drivers/staging/r8188eu/include/hal_intf.h    |  4 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  1 +
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 29 +++++-
 7 files changed, 113 insertions(+), 115 deletions(-)

-- 
2.35.1

