Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713782FB3
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 13:57:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso3251947wmc.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 06:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GtTfat+z4qsQAJi7YljHJL6j8Luu+LN1kPWBAI8xkrI=;
        b=Oz9d7SxENkLcn6ZmKFrTlAY6yO3Sl2vU8BIckPyxXCA3jGc3xSIzRCN5yDAL71rrV2
         /eFhtwgsp7Hr4I1QQZZKvHY9+0HwENlW7GVuyqLMY4xCOAXMwgDLuDteYiOMxWlWg9am
         FguRTGD84yAC+xtVCzJ93eBZ10YfQ6lcwY+MmKxcM8AYnp3z0iklTvK5cBdsiEGIWwL1
         BqCwrnSbaYQjpzAG1mFTa+JV0xfZrVl0czC4WaLQ8XILXfCSGpHvBrG5A38NmzxiPuG0
         guCW0joUlHm+bIaYQ6UJFSphA1kzvDxwGrrm4JP7rEvA8eZFuLp8qB4Ki+R8hmjQgbZU
         /v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GtTfat+z4qsQAJi7YljHJL6j8Luu+LN1kPWBAI8xkrI=;
        b=JfFr9N4jH1l+qFOUqaEbLdsI518GuhbXEUtt7HqsGI1g43UYCbvKeeJ3BKvfG75GSc
         9ikYAmnh983Q3r/We07gF/IUHzxKtBaQVYmsTjWnSs1jn/tOctxw8/NRV3yDc8UeMnZg
         0j/7u7PYKLLsyUNNJe4cMY4TJiWmHSAEV3DOj0SgtaOgEqEiBmkm1VATl3MRg4I7iix+
         raSi4gUXYjPsSjlpoexP57Fc+HPZ0H3TGKzbQ+7U/m9+N8kpkTR1BnqEW3ShXgyO2xJX
         69BzUiCGugiuXN/DowsuhSiemXSpu8j8BxL6L57vKQA1g9/Pu5HQm8RwHuOpt617pD2s
         KVwQ==
X-Gm-Message-State: AOAM532lRWFYeYd440XdNhgmOtDj9y6EcALpd3sFAEyxAd03rGdwYwP5
	6GyABk73mbIAJWCbDY/Spus=
X-Google-Smtp-Source: ABdhPJyenGGxO0xTSduJkCYgtGWUtvIzPD49vQozB55tcOO1w2HX6zCncb3BiaF2lQnGGyvuzTPFPg==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr27713184wml.161.1623247023914;
        Wed, 09 Jun 2021 06:57:03 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id q5sm20819898wmc.0.2021.06.09.06.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:57:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8712: Replace printk() with netdev_dbg()
Date: Wed,  9 Jun 2021 15:56:59 +0200
Message-Id: <20210609135659.4054-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced printk() with netdev_dbg() because the latter is preferred in
network devices drivers.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
index e94604cb71fd..e9294e1ed06e 100644
--- a/drivers/staging/rtl8712/rtl8712_cmd.c
+++ b/drivers/staging/rtl8712/rtl8712_cmd.c
@@ -55,7 +55,7 @@ static void check_hw_pbc(struct _adapter *padapter)
 		/* Here we only set bPbcPressed to true
 		 * After trigger PBC, the variable will be set to false
 		 */
-		printk(KERN_DEBUG "CheckPbcGPIO - PBC is pressed !!!!\n");
+		netdev_dbg(padapter->pnetdev, "CheckPbcGPIO - PBC is pressed !!!!\n");
 		/* 0 is the default value and it means the application monitors
 		 * the HW PBC doesn't provide its pid to driver.
 		 */
-- 
2.31.1

