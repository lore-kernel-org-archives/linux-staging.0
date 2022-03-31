Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DA37E0
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 13:05:31 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id c10so29573921ejs.13
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pvflieYkGvqxxIFeLwTIeMj7AbGD4LMFP+RQU2pR/xU=;
        b=ek1+IghIBT0bcGojmg71M4YYdT+5iyd9S2DmEDNImFQZkSO8m2dv2hmeWO0CSdjNf7
         AAtdpjkrPRIoVJawVniS/hzEFLf1RR9/gvz8jzGOMnEOL61BlOcBG7QAwTXY9kvmfNwk
         T74Xix2kVrSh5uUUPYfvY43IIFIe8GImiy1Kcm+fdQ4VbQ6qq4MAsQeWdex+M6gYsUfy
         VMRKXW1MvOQLJazzbAyuT5yvkM7rtbmPxGk8QoiB7NIjgtCTXmssYHRd7U6VLEuFzKBC
         8Xn7Sy1R5Ysvtlt7cHqT1zNSa+b/CwhXsTtATHGvFbOFuC8jp4P6z4C1fz5LkzW5wt/J
         fV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pvflieYkGvqxxIFeLwTIeMj7AbGD4LMFP+RQU2pR/xU=;
        b=L47IPWz1mKRpPHLNUz2q2gqM5V1QUkQkzBRev0I/OIk9i6UL9NPtrUJ8haaaAQ0wYT
         bwt0LSQibrk1wy9/cuMC2BCHA2Unx37zsqCWFJ50XqojWj/NE4FjKIiFGcxFH3Vo3AEW
         Ldh130Pwlt0iclxLvzXldgTazBYT+RyIfB2QzW1qUD94p8SEWasCPkDydB0nFYtfiA0z
         PZkf8NeZSAnFReHz93Zv+N0ls7ERLjYs+7YI1uL1++RgqF9AuCfnQuY3Ct1I2R+JxVTL
         j7zmxoF3IHkH7Y72fAF9IPh+hWI4Wzf310p1rufB9gHWHypQVbPHf0oeItnW1QUnZwaH
         l8bg==
X-Gm-Message-State: AOAM531pGoeSOSDidVfx4xLjzlaF7e7GAO1Jt8RL3FDh9NhhkC6ELYDO
	TBuY7Uqj1k7PxlI4P96VgO4=
X-Google-Smtp-Source: ABdhPJwE/mM0q2UOa5P6FLgSZ+W9DWY0CAbNM725eRXiAEEY1B/GzM02PAPJHEONKlNBLKpUGF0RXw==
X-Received: by 2002:a17:906:6a11:b0:6e4:976b:e94 with SMTP id qw17-20020a1709066a1100b006e4976b0e94mr4986900ejc.142.1648731928910;
        Thu, 31 Mar 2022 06:05:28 -0700 (PDT)
Received: from localhost.localdomain ([95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm9333358ejc.197.2022.03.31.06.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 06:05:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: remove GetHwReg8188EU()
Date: Thu, 31 Mar 2022 15:05:17 +0200
Message-Id: <20220331130522.6648-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series remove the function GetHwReg8188EU(). This is part of the
ongoing effort to get rid of the unwanted hal layer.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: rename clear_bacon_valid_bit()
  staging: r8188eu: remove HW_VAR_BCN_VALID from GetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_CHK_HI_QUEUE_EMPTY from
    GetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_FWLPS_RF_ON from GetHwReg8188EU()
  staging: r8188eu: remove GetHwReg8188EU()

 drivers/staging/r8188eu/core/rtw_cmd.c        | 14 +++----
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 14 +++++--
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 19 +++++++--
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  6 +--
 drivers/staging/r8188eu/hal/usb_halinit.c     | 40 -------------------
 drivers/staging/r8188eu/include/hal_intf.h    |  4 --
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  3 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  4 +-
 8 files changed, 39 insertions(+), 65 deletions(-)

-- 
2.35.1

