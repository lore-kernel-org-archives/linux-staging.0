Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330336D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s15so24840528edd.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jmlhXWCJ2XtgAisEDgZm+I/z8Zj5LaHUfk+sYMxcX0w=;
        b=bOAvcIZAx8MOa6fUzYOC2qnQqsEY/wNrNKN0j9q60ttjRFNTKqOtTPBFvFLk5jMegz
         I3SBkmJJHF++9ARM3n/hh5FxIiZEtOTb26ZpaL0i37wJvQyzRMM+0UFCtTb5EmabDo6P
         OaD+/5jPY+KBtLE+9dMZOJJz3c8/XhHnGoBJdXVzScs5hEiPd6OknaLf3uqBW6y4tL9o
         8CTx+TTOlzGscPKFlBrBmvfoBz91Dt1+x6dyUBbJFEqcE3q0bcTj6X1dlQF0Q+vGZDFz
         v/BtzKMbVpyCtTgWbrB/CUTI6MzGw5fsiZbwA+0BvFxxjSE1W5Y/2Pbr7vNetMK7oRVs
         mGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmlhXWCJ2XtgAisEDgZm+I/z8Zj5LaHUfk+sYMxcX0w=;
        b=YbnaETirixwXMC50WHq2Qh6uuH53Pawu2/w399Ly40N/6T3xBdBJU5ES3IL38wG/tO
         ISSBrB+cV7G7XNmKs1vO0PMkbUPU97uSnr/dNi0/TUAX+k4stjeeSeNwhVA2PxHy5T/8
         OFjDM9uAI8ktVR1Q3tNyh+9f9/1g0/958VVLWGW75xt/rX9LeVvLevjrsQkm2/CtjBir
         UlFBTj2DG/YlcrGKauxqGUAG9Dzo2TJZtzyQ+sRPlUU6/1Qs/CFWU2+uKOw7ol3jR+fO
         PdQdv+Ja+aQMjUo4LLoFecBBoZXTySeONQCaNmJxfCXNC2dPsQx8vPE67aRn3Swh9HnT
         5Z7g==
X-Gm-Message-State: AOAM530rw/uop/Gm0RWvT8mB6SAyIbZ12ym5wiDC5wNcYYwCnb9B/2P4
	adaSbHSVF54xfD90qia3UCQKKQ==
X-Google-Smtp-Source: ABdhPJyu1Xkaqc4ETAAc2G9Mc6AemDVEQqBB8EZH2Dy2YGiwN5k0QZNSXO5TO34emzUN45TL+VNl8A==
X-Received: by 2002:aa7:c247:: with SMTP id y7mr156227edo.305.1618423954858;
        Wed, 14 Apr 2021 11:12:34 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Stanley@BB.SD3,
	linux-staging@lists.linux.dev
Subject: [PATCH 57/57] staging: rtl8723bs: hal: sdio_halinit: Remove unused variable 'ret'
Date: Wed, 14 Apr 2021 19:11:29 +0100
Message-Id: <20210414181129.1628598-58-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
 drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
 drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
 drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
 drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
 drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Stanley@BB.SD3
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f6d734dd1a24f..60d3d6d1ba678 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -878,10 +878,9 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 {
 	u8 u1bTmp;
 	u8 bMacPwrCtrlOn;
-	u8 ret = _FAIL;
 
 	/*  Run LPS WL RFOFF flow */
-	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
 	/* 	==== Reset digital sequence   ====== */
 
@@ -909,9 +908,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	/* 	==== Reset digital sequence end ====== */
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
-	ret = false;
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
-	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
 }
 
 static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
-- 
2.27.0

