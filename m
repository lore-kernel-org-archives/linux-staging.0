Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D82F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:02 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y26so3304206eds.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qqo23BBWvfRPpInFMgEIGt2hEIbFItq/UvhQi520Ig0=;
        b=CtDfXUHcX+Qm5zTyOpykjdR4PMjU5KKLt5GtEZToPKqy9kJUMHZfXndwJSrqQBzWDz
         kZPZBCgz3LvIiUlPB4iwBuKIBPvelvI/dj3AH2SOB9gBJJxknFs7tE+H371Qxj4mpphT
         oNbkDAKJrOBP45ivmRycppvuHO9xYR7C0w54h2a9YC2aLhgpYnfaNcKNVyZ4nMtVwW9f
         iqt9xuiUgh4ViD7uXm7Y5R2FNXR5vWSEUzkTxwPm9GlEOuJLH+XvLIhFgB3veRkEwINo
         H3d2UYamUAulqKBwtie7yofaazBc/Lm22cEs7ey7UQCLo4259hfHsLK6LhXCCaEqOUUQ
         JvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qqo23BBWvfRPpInFMgEIGt2hEIbFItq/UvhQi520Ig0=;
        b=QP2Ax49dDuuzf9k4G4b8xt7z5D2HCEPH1gWM1DOcPVlIj+uQIlioFQ6xnBOfR+wi2j
         W86xRpBWRD9+yRcdF0tV/RmMuUxfCxiEYFowvPk6IzUiPqe+9ZfpHycvxmUVG7fkcjkg
         HqtrO8oP8Bh9PtwIq6XrHtAtEWpRHJQF8VMuaR3pwcpgMSCpsyKPzwCHNIUDc0C+pFaT
         Wda2coKgdRnlde17Um5mjBXhq94r2T398v66vpqvg7D7MuP5dOpy0BebMC6Zxb/nJ4c7
         eDOWLTnRBd/QTVVQu5fK0+BMoN9z/WzKFdIJH/N1vcOQRVsIh/w4y9BGOXapHgt4bsBk
         1ErQ==
X-Gm-Message-State: AOAM532rONINiDPnnWikFEoOu+gFyBcmaBMNA7WL0fVnHFoD4erDS1gQ
	GlM/cuwtc4RVeA3HmqLzFVk=
X-Google-Smtp-Source: ABdhPJzj29/Rm6sLatUfUel+aNNEcHBpFliH+FcYtD5E2lpt+F1HDHEK8RxkmGwy/C2W9KzvY+sniA==
X-Received: by 2002:a05:6402:c1:: with SMTP id i1mr6297905edu.315.1619793900923;
        Fri, 30 Apr 2021 07:45:00 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id p24sm1461327edt.5.2021.04.30.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 31/43] staging: rtl8723bs: remove unnecessary halbtcoutsrc_DbgInit() function
Date: Fri, 30 Apr 2021 16:44:01 +0200
Message-Id: <2b2a35c7729314ef72df93427c017760daa58942.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

halbtcoutsrc_DbgInit() static function was intended for
manual activation of private tracing facilities.

So remove it.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 02d9997094f2..fd26187a976a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -75,32 +75,6 @@ static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 	return true;
 }
 
-static void halbtcoutsrc_DbgInit(void)
-{
-	u8 i;
-
-	for (i = 0; i < BTC_MSG_MAX; i++)
-		GLBtcDbgType[i] = 0;
-
-	GLBtcDbgType[BTC_MSG_INTERFACE]			=	\
-/* 			INTF_INIT								| */
-/* 			INTF_NOTIFY							| */
-			0;
-
-	GLBtcDbgType[BTC_MSG_ALGORITHM]			=	\
-/* 			ALGO_BT_RSSI_STATE					| */
-/* 			ALGO_WIFI_RSSI_STATE					| */
-/* 			ALGO_BT_MONITOR						| */
-/* 			ALGO_TRACE							| */
-/* 			ALGO_TRACE_FW						| */
-/* 			ALGO_TRACE_FW_DETAIL				| */
-/* 			ALGO_TRACE_FW_EXEC					| */
-/* 			ALGO_TRACE_SW						| */
-/* 			ALGO_TRACE_SW_DETAIL				| */
-/* 			ALGO_TRACE_SW_EXEC					| */
-			0;
-}
-
 static void halbtcoutsrc_LeaveLps(struct btc_coexist *pBtCoexist)
 {
 	struct adapter *padapter;
@@ -919,8 +893,6 @@ void hal_btcoex_Initialize(void *padapter)
 
 	/* pBtCoexist->statistics.cntBind++; */
 
-	halbtcoutsrc_DbgInit();
-
 	pBtCoexist->chipInterface = BTC_INTF_SDIO;
 
 	EXhalbtcoutsrc_BindBtCoexWithAdapter(padapter);
-- 
2.20.1

