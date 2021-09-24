Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185193FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 20:49:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w17so30958636wrv.10
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s1PU/DWp0zhZhGgDyFhxiTEWeLIl4kkj5NZM4AVkHRY=;
        b=KWMUh8xl8UaxNJA9SYFksYkUTnqvDinC2cBfe+fcEnzH76d3JLIYlIZAm5+NeJDmXT
         klgQHmhK8tKgOUqqRfITQSpnUdf+i7X2WhFyLKXqkntXwI/TxAm+G96jbd1SVPUtxiqJ
         xILi6i+WU/vv7dIniGDnV4decjP4yr+eWiWawZSkOesb9lGYh/C2szzTRvRmfFkMZq1z
         JIC0wcyQFM9OrTereDX8n8utTJP7KACFPXAKI+AJ+ytkBzltwvJwj/zI+ly/z4l/ykPC
         GVHbRVPQrx9DwOiWXFvTAraT0KvxLERZT/ecUp1lqyPPEHGUuGAz/YRA43JkoHwcJh0q
         3Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s1PU/DWp0zhZhGgDyFhxiTEWeLIl4kkj5NZM4AVkHRY=;
        b=Co0MDt2t3qjJA7jxtORSEl0torCNaI55OaPbXd+6tHV77ILkPM0sc9dDrR0ZzzNjqS
         g6FX1inUmjasN6rXeidy684xh4dOC+tIYzJYgVbxuYd38lkUCmyn9vF/KSi8ED6Y2WXD
         RrzKpSaPnFbbK49PX5dXig+Ev7249S87fOk9RxwtkvcHme927xskh2TwQRo9077AxVc4
         mqJn0GKxsecWWVDaYwtyio3SiwHjUhKwjKFNNhR2JqRMQSMSZqqtEolbybVMFWlc5XJv
         3qJE/A+S6gZRS9z8VE2ET8ZCL6iY9qvP+qshpU0pd4WT9ABP5WBWnl42NZVnrEmS2qdJ
         Z/dQ==
X-Gm-Message-State: AOAM531TeZgL73BJ25nRwFN+7NBPBRAa/jcP1CEXvpMHboj0E279Bfjk
	EJlhGvQQbDYsEVvqSDfe7hc+E6B/K+rUrg==
X-Google-Smtp-Source: ABdhPJyHdhmt9IB8ff6bR64KP46d5Od5N17Qz7RPmaU/12/FO3aFlJepyfDtYRaJ/8waoTbiUSTHQQ==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr4083424wmq.166.1632516572504;
        Fri, 24 Sep 2021 13:49:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51da])
        by smtp.gmail.com with ESMTPSA id j19sm9040292wra.92.2021.09.24.13.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 13:49:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: remove _InitHWLed()
Date: Fri, 24 Sep 2021 22:49:16 +0200
Message-Id: <20210924204917.6313-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924204917.6313-1-straube.linux@gmail.com>
References: <20210924204917.6313-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function _InitHWLed() does nothing, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 097fb42bf7b2..483a3b0ea94f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -403,18 +403,6 @@ static void _InitEDCA(struct adapter *Adapter)
 	rtw_write32(Adapter, REG_EDCA_VO_PARAM, 0x002FA226);
 }
 
-static void _InitHWLed(struct adapter *Adapter)
-{
-	struct led_priv *pledpriv = &Adapter->ledpriv;
-
-	if (pledpriv->LedStrategy != HW_LED)
-		return;
-
-/*  HW led control */
-/*  to do .... */
-/* must consider cases of antenna diversity/ commbo card/solo card/mini card */
-}
-
 static void _InitRDGSetting(struct adapter *Adapter)
 {
 	rtw_write8(Adapter, REG_RD_CTRL, 0xFF);
@@ -830,8 +818,6 @@ static u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	rtw_write16(Adapter, REG_PKT_VO_VI_LIFE_TIME, 0x0400);	/*  unit: 256us. 256ms */
 	rtw_write16(Adapter, REG_PKT_BE_BK_LIFE_TIME, 0x0400);	/*  unit: 256us. 256ms */
 
-	_InitHWLed(Adapter);
-
 	/* Keep RfRegChnlVal for later use. */
 	haldata->RfRegChnlVal[0] = PHY_QueryRFReg(Adapter, (enum rf_radio_path)0, RF_CHNLBW, bRFRegOffsetMask);
 	haldata->RfRegChnlVal[1] = PHY_QueryRFReg(Adapter, (enum rf_radio_path)1, RF_CHNLBW, bRFRegOffsetMask);
-- 
2.33.0

