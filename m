Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C72A2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:58 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id q6so22236897edr.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qqo23BBWvfRPpInFMgEIGt2hEIbFItq/UvhQi520Ig0=;
        b=NoNixB7h8rbBKmtlBAFwLvaFyGWzB12+PBKrLGSLHT2uqv1AsuNNPKUz45hpaq255f
         vCX9iaMFpmZHOgWg5D9EBeTNy/ezMAETw4WI4ifYwiOI0jHFSy9nLnZwIb5FEB0lX9Wv
         u1J3XzFeVzAYF/psPRth2dqAzm+stNSRsud8xBdq4wa5K70EjX+PEJsUqb0QfqJN7UEe
         EDav7KdIJkOKJK1yDiJN6HOwK46ShHCRtgwvj3Hrk+DB4Rn72FlqN5WoUC7aNPKFPnog
         7mIwLZItknE82UqVWrXjHhoO0VgY1NaufzurX3wbvv5ZNrLRrQ1yOKetXuPwfJYmlAUo
         3C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qqo23BBWvfRPpInFMgEIGt2hEIbFItq/UvhQi520Ig0=;
        b=l0FLn96p5rBydmENlrU0NOhn1Z6RzRV9isMls6b8vKRGlpxaKMyDsON8NdCSXmDOtr
         9y7jtPGTJLVvkdFYes+yS4O5cEXF05xZqYMYtfJnyb/uDXVN1/0Dk1XM+lCBRDjgING2
         X2rqSZYRC7rubFS5VBjPKGVHbqmslusVLtOqdgKnhVcL2Uhs/E2LIU8BPl0d5xzOKrD0
         G/p2dIQY7XV568uKHuNod55mY/UjfI2aZfeQZKQ3WKEy3VBnObcv3AYKTzz/dUcMUKtB
         gxRecHrWZRfvotlT7wcOP6tvnvh4XeA6HD9TiAdDb52WTqwd/cozIUAyqGzEwjwQfG2W
         IFlg==
X-Gm-Message-State: AOAM532VcOSvLTni7c3mfgYscpKyQjY/SJPgvuvVmg7qMC5HiQUlGvm/
	xIaJ+6NTxz6TjYPk4fdbjhY=
X-Google-Smtp-Source: ABdhPJxu+HwmwUz/bw+qUvb9XW567odI8/YFDphYo6AXJDZchlE9JTHfGRTarQuCVgnLRmRML7EAog==
X-Received: by 2002:aa7:d658:: with SMTP id v24mr4081055edr.290.1619768697071;
        Fri, 30 Apr 2021 00:44:57 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id l1sm649452edt.59.2021.04.30.00.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/43] staging: rtl8723bs: remove unnecessary halbtcoutsrc_DbgInit() function
Date: Fri, 30 Apr 2021 09:43:49 +0200
Message-Id: <81c0b2654dbca9356217ff5e1f4a2e2ec929e918.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
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

