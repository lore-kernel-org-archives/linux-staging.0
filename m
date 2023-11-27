Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766A5663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SZIm80v0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cf89e31773so23588965ad.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063382; x=1701668182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZZM2c5g/+TPAQIyy7mIwCyenkF8kluxFKUdyumlEzY=;
        b=SZIm80v03TQS233KtV9mCKQrv5qlO6y+YcfJB3Tpmo+MaTefLFcfSiYw73TKqpXvRg
         t0jzRHpaoLrwOWzUgMoqqpHGR0E2FCfmu+9PE6Wpr4Z8ptBb+f5phUkU22fFgxc3v1XW
         9wYmpgWXB9XQVLPKfCoL5pfALBlPLgndeOHpEtm+REGntTNYkmChBOF/rso7V3+Lt+x3
         vGOJBkUNGnBIk3moHLU4IUy+Z9aXpF6uz+5rCa3uMcvxPSnMCl7dXEgzSvyeZBRtB1+i
         IqJpobRWNFL7KA+EkAPAMIUVYj8CS8HHd957RGvfZ8qs2qpqwCBf746NDGFkCvsgXd+5
         3E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063382; x=1701668182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZZM2c5g/+TPAQIyy7mIwCyenkF8kluxFKUdyumlEzY=;
        b=wlcNvO0Ogjl8Inc4BUL1reOqtDm961uQFRY7Gf001v+c81gtSMFM9T28v+vV6ONMFZ
         zLyfKDA7tEwnfU4Eehhz+va8mEfl3t674eu688/CaXM5+hQXBuXW1NY5gEgML4tqVAZ+
         9zI9D0qAPYA9wSsTpnhj0IJhNpgjaMhmenTgy0Z2Z/5NhF1ffZ9aJX4w1ad3vIBLs2h0
         A1NcZXcUyRxxUPgH33SDBrFsBEekKKjD9cuEDpMOapHu01ZL81oF8BzPMmQIE5MkkkNs
         HQmkjTeaZPs9rozXu1Uob+Yy4c02jBejCHOPNHBowF3hL4MdxbybGJ+77cnCu5uWkEU+
         U82A==
X-Gm-Message-State: AOJu0Yxyjn8v1CauTMQMw/tsuE1HBplnTEDg+gYILKEGM3G78TYKuErH
	7zXTDvsyC1mLdVvjX61upxeljnZxPfc4MfISiZQ=
X-Google-Smtp-Source: AGHT+IHCkcRzecB8ILsptMxgN5ky2tpVSiuXnhBEYbPJugtAJYw26N7txXsXCLcOKsZwU4R4h9uY6w==
X-Received: by 2002:a17:902:d48d:b0:1cf:c4d3:f337 with SMTP id c13-20020a170902d48d00b001cfc4d3f337mr2817000plg.30.1701063382241;
        Sun, 26 Nov 2023 21:36:22 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:21 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/15] Staging: rtl8192e: Rename variable TxAdmittedBARecord
Date: Sun, 26 Nov 2023 21:42:55 -0800
Message-ID: <20231127054305.148276-6-tdavies@darkphysics.net>
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

Rename variable TxAdmittedBARecord to tx_admitted_ba_record to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c |  4 ++--
 drivers/staging/rtl8192e/rtllib_tx.c      |  4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index bf8d42668990..db529559592b 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -25,7 +25,7 @@ static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *ba
 
 static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *ts)
 {
-	struct ba_record *admitted_ba = &ts->TxAdmittedBARecord;
+	struct ba_record *admitted_ba = &ts->tx_admitted_ba_record;
 	struct ba_record *pending_ba = &ts->TxPendingBARecord;
 	u8 send_del_ba = false;
 
@@ -346,7 +346,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	ts->add_ba_req_in_progress = false;
 	pending_ba = &ts->TxPendingBARecord;
-	pAdmittedBA = &ts->TxAdmittedBARecord;
+	pAdmittedBA = &ts->tx_admitted_ba_record;
 
 	if (pAdmittedBA->b_valid) {
 		netdev_dbg(ieee->dev, "%s(): ADDBA response already admitted\n",
@@ -494,8 +494,8 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 
 		if (tx_ts_delete_ba(ieee, ts))
 			rtllib_send_DELBA(ieee, pTsCommonInfo->addr,
-					  (ts->TxAdmittedBARecord.b_valid) ?
-					 (&ts->TxAdmittedBARecord) :
+					  (ts->tx_admitted_ba_record.b_valid) ?
+					 (&ts->tx_admitted_ba_record) :
 					(&ts->TxPendingBARecord),
 					 TxRxSelect, DELBA_REASON_END_BA);
 	} else if (TxRxSelect == RX_DIR) {
@@ -521,12 +521,12 @@ void rtllib_ba_setup_timeout(struct timer_list *t)
 void rtllib_tx_ba_inact_timeout(struct timer_list *t)
 {
 	struct tx_ts_record *ts = from_timer(ts, t,
-					      TxAdmittedBARecord.timer);
+					      tx_admitted_ba_record.timer);
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
 				     TxTsRecord[ts->num]);
 	tx_ts_delete_ba(ieee, ts);
 	rtllib_send_DELBA(ieee, ts->TsCommonInfo.addr,
-			  &ts->TxAdmittedBARecord, TX_DIR,
+			  &ts->tx_admitted_ba_record, TX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index f2bd53268e3a..40b0ed4fefaf 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -26,7 +26,7 @@ struct tx_ts_record {
 	struct ts_common_info TsCommonInfo;
 	u16				TxCurSeq;
 	struct ba_record TxPendingBARecord;
-	struct ba_record TxAdmittedBARecord;
+	struct ba_record tx_admitted_ba_record;
 	u8				add_ba_req_in_progress;
 	u8				add_ba_req_delayed;
 	u8				using_ba;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 039f070aadd1..0e59a3155c4a 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -105,7 +105,7 @@ static void ResetTxTsEntry(struct tx_ts_record *ts)
 	ts->add_ba_req_delayed = false;
 	ts->using_ba = false;
 	ts->disable_add_ba = false;
-	rtllib_reset_ba_entry(&ts->TxAdmittedBARecord);
+	rtllib_reset_ba_entry(&ts->tx_admitted_ba_record);
 	rtllib_reset_ba_entry(&ts->TxPendingBARecord);
 }
 
@@ -134,7 +134,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 
 		timer_setup(&pTxTS->TxPendingBARecord.timer, rtllib_ba_setup_timeout,
 			    0);
-		timer_setup(&pTxTS->TxAdmittedBARecord.timer,
+		timer_setup(&pTxTS->tx_admitted_ba_record.timer,
 			    rtllib_tx_ba_inact_timeout, 0);
 
 		ResetTxTsEntry(pTxTS);
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 2ef617a55995..51a8286abd18 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -294,7 +294,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			netdev_info(ieee->dev, "%s: can't get TS\n", __func__);
 			return;
 		}
-		if (!ts->TxAdmittedBARecord.b_valid) {
+		if (!ts->tx_admitted_ba_record.b_valid) {
 			if (ieee->wpa_ie_len && (ieee->pairwise_key_type ==
 			    KEY_TYPE_NA)) {
 				;
@@ -305,7 +305,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			}
 			goto FORCED_AGG_SETTING;
 		} else if (!ts->using_ba) {
-			if (SN_LESS(ts->TxAdmittedBARecord.ba_start_seq_ctrl.field.seq_num,
+			if (SN_LESS(ts->tx_admitted_ba_record.ba_start_seq_ctrl.field.seq_num,
 				    (ts->TxCurSeq + 1) % 4096))
 				ts->using_ba = true;
 			else
-- 
2.39.2

