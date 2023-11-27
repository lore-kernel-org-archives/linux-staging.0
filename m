Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF65566B
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="dXnihXoI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cfc35090b0so6057025ad.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063385; x=1701668185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IN7Uz/ApgY1f3u5IU30JsgnfKyUE/XtB4TY8u0u2IE=;
        b=dXnihXoIW4K3aoXmRZAP+WZLMfzzuYM1rINLFwLudDHjETstmU0oiXLjvd7iok9WQi
         73aVv7F7fuDBN4BwL4y5CaL71bMk0o8WQ6lwQRmohkovysUDkd3N33VPMW50a7UUajUB
         /EZnNe4+r5nvP07uyML3/x6ipUqvN0yaoHZ/24mPpT8jO0VshOChSGIqLCc6n7Hv/WeT
         bpuwcnz0NglYQqkqsnIvN8pKw75PPXZahCJnK3y+bxWUYK+z3g35i9lQz5/TxfA+78y8
         Kx1C3i405OSWt0sb9wRyqvR2Dxim0ygKgNHtvFfuCJiEM2F4cy/K1xdxd0r23xg1oeKf
         zxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063385; x=1701668185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IN7Uz/ApgY1f3u5IU30JsgnfKyUE/XtB4TY8u0u2IE=;
        b=qIVAu0pzqkJZvu8HerFxJg8zrzsWIChNtrYDcyfktNPdBqfJGtj4EV+4isUIdjczpH
         aAuf5cMsxXMRtxWZOyd9a4u7uacLc3BmGQRIgC0Gl3zLcPlFv2k8A7w/J1usBXvD/30K
         HEuD+b0bLjGpzthVE6/laeuS/JBDB3aLl4sibcf4AWl/igDb4htar969czhwx6DBCbhR
         pVOU2+fBkpsJD3O18VRrm68ErawCEL/4up4JqCNRLvpEwwq5nz/a1+Az0nXtWhXHf8YD
         MgPk4q2GKH2d8KgMdCa/3vZtv35NFEQDvwyLaG7Ei1QyjWolzQ8/X3giOZ1brbUcMHXW
         fVrw==
X-Gm-Message-State: AOJu0Ywv/+nt6YIL2oDPSkfJkSJKSK14vVCQ6aVAFyVacxSL4dr56Ucn
	UrxfiYfAcYF9hw00Y6LVKq/uKg==
X-Google-Smtp-Source: AGHT+IHB8qLA1itApM0KaYIbMULLjPaTaLcTr8nkQl51KE5AUYBOL3RWSteixe/bb0DBDbIRYuEjgw==
X-Received: by 2002:a17:902:d488:b0:1cf:c518:fa3a with SMTP id c8-20020a170902d48800b001cfc518fa3amr2470988plg.23.1701063385660;
        Sun, 26 Nov 2023 21:36:25 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:25 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/15] Staging: rtl8192e: Rename variable pTsCommonInfo
Date: Sun, 26 Nov 2023 21:42:58 -0800
Message-ID: <20231127054305.148276-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pTsCommonInfo to ts_common_info to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 10 +++++-----
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 78da79ebd775..d11cbe3bbb31 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -485,24 +485,24 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 }
 
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
-			   struct ts_common_info *pTsCommonInfo,
+			   struct ts_common_info *ts_common_info,
 			   enum tr_select TxRxSelect)
 {
 	if (TxRxSelect == TX_DIR) {
 		struct tx_ts_record *ts =
-			 (struct tx_ts_record *)pTsCommonInfo;
+			 (struct tx_ts_record *)ts_common_info;
 
 		if (tx_ts_delete_ba(ieee, ts))
-			rtllib_send_DELBA(ieee, pTsCommonInfo->addr,
+			rtllib_send_DELBA(ieee, ts_common_info->addr,
 					  (ts->tx_admitted_ba_record.b_valid) ?
 					 (&ts->tx_admitted_ba_record) :
 					(&ts->tx_pending_ba_record),
 					 TxRxSelect, DELBA_REASON_END_BA);
 	} else if (TxRxSelect == RX_DIR) {
 		struct rx_ts_record *ts =
-				 (struct rx_ts_record *)pTsCommonInfo;
+				 (struct rx_ts_record *)ts_common_info;
 		if (rx_ts_delete_ba(ieee, ts))
-			rtllib_send_DELBA(ieee, pTsCommonInfo->addr,
+			rtllib_send_DELBA(ieee, ts_common_info->addr,
 					  &ts->rx_admitted_ba_record,
 					  TxRxSelect, DELBA_REASON_END_BA);
 	}
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index ed14e8e1ed93..2e6b705437d9 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -91,10 +91,10 @@ static void TsAddBaProcess(struct timer_list *t)
 	netdev_dbg(ieee->dev, "%s(): ADDBA Req is started\n", __func__);
 }
 
-static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
+static void ResetTsCommonInfo(struct ts_common_info *ts_common_info)
 {
-	eth_zero_addr(pTsCommonInfo->addr);
-	memset(&pTsCommonInfo->tspec, 0, sizeof(struct qos_tsinfo));
+	eth_zero_addr(ts_common_info->addr);
+	memset(&ts_common_info->tspec, 0, sizeof(struct qos_tsinfo));
 }
 
 static void ResetTxTsEntry(struct tx_ts_record *ts)
@@ -211,16 +211,16 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 	return NULL;
 }
 
-static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
+static void MakeTSEntry(struct ts_common_info *ts_common_info, u8 *addr,
 			struct qos_tsinfo *pTSPEC)
 {
-	if (!pTsCommonInfo)
+	if (!ts_common_info)
 		return;
 
-	memcpy(pTsCommonInfo->addr, addr, 6);
+	memcpy(ts_common_info->addr, addr, 6);
 
 	if (pTSPEC)
-		memcpy((u8 *)(&(pTsCommonInfo->tspec)), (u8 *)pTSPEC,
+		memcpy((u8 *)(&(ts_common_info->tspec)), (u8 *)pTSPEC,
 			sizeof(struct qos_tsinfo));
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 77ae259eab35..5f372554d424 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1787,7 +1787,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 			   u8 policy, u8 overwrite_pending);
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
-			   struct ts_common_info *pTsCommonInfo,
+			   struct ts_common_info *ts_common_info,
 			   enum tr_select TxRxSelect);
 void rtllib_ba_setup_timeout(struct timer_list *t);
 void rtllib_tx_ba_inact_timeout(struct timer_list *t);
-- 
2.39.2

