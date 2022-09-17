Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34187366
	for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 04:24:58 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id u9so53562302ejy.5
        for <linux-staging@lists.linux.dev>; Fri, 16 Sep 2022 21:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=Ih6RViuFYSO4oFrRxwo7eSPDz1/vXHNTppdf5GB0xs4=;
        b=It+WthWhOGrxYwoT6LTHzhnEm8pdt1q2Kxm+nJhCULw4pOXXJ9/lrtOcbmGTWZUB2a
         rMrUDr/a+HqS6ohag1G5Eng4VF9YQs59wFG+QPG3JAkMVluj/GRw8WVBvVAWeEg/kI2p
         dneWnrNZg2CjN5LP/0oGF1bQnF+wzDf4Q+K3qrm3f9oElWxYWNo8oUkBoAjxcLn5sZYb
         GNHei1+VnJ6lEcnfWxLZHt9SoVdICa15E6O3YcWdgnxUAIhC4GEl9raM+A03u1fHREsH
         /GfUGu7f+Q8Amf6ev00HOhZx9W4RsOV/Y+3AXUNJEl7g+ajJPSocGuDe/DbYc3BcetB0
         KYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ih6RViuFYSO4oFrRxwo7eSPDz1/vXHNTppdf5GB0xs4=;
        b=O/IIHfhaXo+HflwFnOhCzhcuEQykKu9i/Zj052ynnigz3KatEk9SAbGOok/I+ygAgm
         Z9WwnLefDnoEbrBuTEmLCXpysDTmLGyxPxva4yRG8pfH1cP+I464oYWTPbBiv8YSn672
         kAu0A3TMJyvoNOmo6/v/Vo+LiLwyQAb1RymvGMI7rcEd81oH1oWAZ+bzLBVDoY7GNYZ0
         m1y8J0wsOqf8Cko3wqFjylyQ4nmJtYY3C8bJUO/JrXUMbAW6rN7pfOlSYBBeGLDfPIA3
         fEbvSS1C29hHuG+zVZxuUhhgxTZQRWxSSfHdNffO6G9J2mFd0e2HuWlmuvoIJFAB46pa
         yWfQ==
X-Gm-Message-State: ACrzQf3c3Y8YmS73EJtf+UBKKlWpOoJrEIE74hPLH+hAmfqB/zMW2cW4
	8Uf49K5ptfjnLNlPPIydFrc=
X-Google-Smtp-Source: AMsMyM6/VQ5pkXMFQ3AsThkW5okJI3ndyKJvMjsKJy+hKE3X42BQ1VDKk0a515HqcP9vlCxRi3zagA==
X-Received: by 2002:a17:906:505:b0:73d:b188:17d9 with SMTP id j5-20020a170906050500b0073db18817d9mr5293974eja.97.1663388696346;
        Fri, 16 Sep 2022 21:24:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id y17-20020a50ce11000000b0044f2afbb1easm15141717edi.27.2022.09.16.21.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 21:24:55 -0700 (PDT)
Date: Sat, 17 Sep 2022 06:24:53 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] staging: rtl8192e: Remove ftrace-like logging RT_TRACE
Message-ID: <cover.1663387785.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove "Unnecessary ftrace-like logging" as requested by checkpatch. To
keep the logging would make future patches for fixing CamelCase larger.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (6):
  staging: rtl8192e: Remove ftrace-like logging in r8192E_firmware.c,
    ...
  staging: rtl8192e: Remove ftrace-like logging in r8192E_dev.c
  staging: rtl8192e: Remove ftrace-like logging in r8192E_phy.c
  staging: rtl8192e: Remove ftrace-like logging in rtl_dm.c
  staging: rtl8192e: Remove ftrace-like logging in rtl_ps.c
  staging: rtl8192e: Remove ftrace-like logging in rtl819x_BAProc.c, ...

 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |   6 -
 .../staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c |   2 -
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 161 +----------------
 .../rtl8192e/rtl8192e/r8192E_firmware.c       |   7 -
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 132 --------------
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c   |  16 --
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 165 ------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c   |   2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_pm.c    |   1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  34 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |   8 -
 drivers/staging/rtl8192e/rtl819x_BAProc.c     |   5 -
 drivers/staging/rtl8192e/rtllib_debug.h       |   6 -
 drivers/staging/rtl8192e/rtllib_softmac.c     |   8 -
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   6 -
 15 files changed, 1 insertion(+), 558 deletions(-)

-- 
2.37.3

