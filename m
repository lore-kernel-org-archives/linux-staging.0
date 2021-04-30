Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EC82F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:59 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id bf4so3247031edb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qqo23BBWvfRPpInFMgEIGt2hEIbFItq/UvhQi520Ig0=;
        b=bEFoYlV5qUOrrZDVcr+u2KYvrk1xBHOWEDyDd1OXlq4s8fOVy70wa2DCTDoYGItFSb
         u3Fg5UHyOIopUdDxAxio5D84epg2FYpXEChNQsnJzCaYxy47u1FxW6JR7Ij45kOh6i54
         ASsy1ww4s6VVw9DJUmdUQdmAhsrvEUR2byt25kmtJ+VNl/5mL05S/L0nmPJIpR6cxBcX
         uj4+HrtNQAA8hp4tGHBakT4GckImDSEqAZAs6Rq/6smmG1AfHr0lnlFG4pvMwXTfA869
         nNTeIicFsxzmyFWCIoMDgH9XzvhFFO5yfe3lXQGFXIsnVZ4YBUcqw7aUKguaypTDE7QQ
         ZVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qqo23BBWvfRPpInFMgEIGt2hEIbFItq/UvhQi520Ig0=;
        b=tElf8wq1XMvjySsPifpcfDXDlw2a0ljXi9gP8rQPH/1kFUE3PtIbFSi086LhnXQEuc
         P4xGWZq3PP1ziU+R4xD04dh1pyK63TtAYcxLhDQmjuKc/8CrhAJz1E4TV0uGA4Ky8Gb7
         gIDA5xFUmz5SJL0qnGaJfmz781QxHH0tQmEG4Odt4n5LyKIlI+K/fGgxq8N+UiB1Rgxp
         5TeWoL77wsa3r0lrsCfKCi9yIZMtoYpj34Z42Ci4d9INqryYfrMpnpbF0otfSmQeY0x+
         O4IISsXOQVC2GiMLKmkA0dFT3XUiEqy3QIvEm+LXVnMOKl27lq3P9fjVgIwQGaIad6Fl
         MzSg==
X-Gm-Message-State: AOAM532n/38Pt9ObVRk2KAv8VEOFr6xFWNnqQb+5Qd1ywAdMklwhAjdv
	mtBCbwRiMfe5QLIjTExUtFQtVdq9V3c=
X-Google-Smtp-Source: ABdhPJyZ3/fKJXkKZJJciCr1lDVRQlLB3eF9m8aFqNbS5eQ3Q7bdM3bKvo540QnvHp4zrcoZGF53Yw==
X-Received: by 2002:a05:6402:cb4:: with SMTP id cn20mr6284134edb.167.1619794678372;
        Fri, 30 Apr 2021 07:57:58 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id ga33sm2027943ejc.11.2021.04.30.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 31/43] staging: rtl8723bs: remove unnecessary halbtcoutsrc_DbgInit() function
Date: Fri, 30 Apr 2021 16:56:53 +0200
Message-Id: <f6c4f680b2d0ee8850f97532ca76dd405c1d50c3.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

