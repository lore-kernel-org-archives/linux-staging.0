Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BEF3FCC
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 08:06:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f62-20020a1c1f41000000b0030b42643f72so1273281wmf.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+ZicbaCnRFRwPjtdSj14+R6QkztHEiM+wYFY8ONJ5c=;
        b=pu0Dnk+nvamRG842FpR3b13PDb3WZdRxm1P1gVCMMAMA19PPKxbUKJD49+3WfaSW0O
         H2jhL9GaewoOcHcVvda+Kp7BJQ2s7JlzB6IDVuQwTkYC5x7QPNKTy9AqYB3Sif15AK88
         NK3F08u/ewF3rLWUaLp1M9DR4xaJEzPO3e1Hwyasf14nUIvqIrZkLHqVMeYQn4IQmzXX
         C7sakh8HpP5BGMEiH8zmAJ9+sJy/ApFNzOZCvl4xFgkjgg+C76t6xy/oXWk3WUo677jx
         NbnYLpSmFRuSnjggiScuhoHPn1k1ps1HVT62Lvp9z8lSjRJzldmuqWdR5zT3aBNtecia
         0iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+ZicbaCnRFRwPjtdSj14+R6QkztHEiM+wYFY8ONJ5c=;
        b=oicWeXNtr1PaJH4KQSifAbHL6MQtNVcR8fctAE1/58f++MV3ExCqGlCxnCxuBhs946
         z/L2aYaBvAJI9D7r4E1hLVpEWxVEUzTTwUObOUS0bfapVW+3NFFg7kFPuKK4YaIxgGxK
         PVdIZO71CY2Zom8cy2QhEZodHP5n1cbb+rIfUSXlhjwr/d8AOpOn3mpld47k8bmvFtJd
         H/a6E8nCxdUtrnCZJHbuWNBgBvMdbaV3WomInopo+QZ0k98k081JPT8FNIIhupIPbdz1
         H7To0wRaKlCc1Akg1k0PgfWFDGHvo6n6TXs/k5CRd+lzSPZgE5qK06Z7qk+HZgvRB/Mw
         9TIg==
X-Gm-Message-State: AOAM5331h0+uhHqt7K3kptT0Za3+yKiblIufrcyewQjsF5qedj/vIkED
	j/J88I9Y2RpjcPUWojaThdY=
X-Google-Smtp-Source: ABdhPJxUBah5feVFGpcLPDwTARF9Qf3N5vDMhWmMs7d/5q61eoGg1W5jbDt/LBUhSUGpB86MaZb/+g==
X-Received: by 2002:a1c:3543:: with SMTP id c64mr13933848wma.78.1631865991558;
        Fri, 17 Sep 2021 01:06:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id r129sm5690890wmr.7.2021.09.17.01.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 01:06:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: remove some unused code
Date: Fri, 17 Sep 2021 10:06:11 +0200
Message-Id: <20210917080615.25819-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTL8188EU chips are 1T1R. This set removes some code that is valid
only for 1T2R and 2T2R chips.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: remove IS_1T1R, IS_1T2R, IS_2T2R macros
  staging: r8188eu: remove if test that is always true
  staging: r8188eu: remove NumTotalRFPath from struct hal_data_8188e
  staging: r8188eu: remove switches from phy_RF6052_Config_ParaFile()

 drivers/staging/r8188eu/hal/hal_com.c         |  10 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  60 ++++-----
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     |   5 +-
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |   8 +-
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 125 ++++++------------
 drivers/staging/r8188eu/include/HalVerDef.h   |   9 --
 .../staging/r8188eu/include/rtl8188e_hal.h    |   1 -
 7 files changed, 74 insertions(+), 144 deletions(-)

-- 
2.33.0

