Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD6566B
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="OPkjJvmp"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5bd6ac9833fso2083774a12.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063377; x=1701668177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BNSjAfjsj6TnStXG6ZmHRofXAvHYH/XMDwqXWavaiA=;
        b=OPkjJvmp7fuOFDTFTbQbmJ06CCRqVUTeaS5EEs6BPcgSOu4Ay7He93yR5py68LzJfg
         JSAAkoailjcP8IDufVfN3RBzfT3n1dDPKUq3NpCfZaj3nYZOZGJSTmLFuFBI8j1BDwx6
         WEnvC53j5cnXwjEnC2opk120HI4JoIS2g/xfodNwlYxuBMc9kw7rVbBVmfwf3rkuxkxp
         8ovGK6AxaZx4MFxhEvvZQsgLaB8VzBbGjsT1fwbmXzlsIusFzDKCUH7wRIZrYlu39Rp/
         Tu6uWx85Lpx3QIzuC2iiEf7nV/Im5jpcAGnIEB2uKbZlNnd1kJnFCTjEZKSlD5kTg3Wf
         YBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063377; x=1701668177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BNSjAfjsj6TnStXG6ZmHRofXAvHYH/XMDwqXWavaiA=;
        b=YnN3lxhUbHhaDCFU+akbmDHWtW+8X5KnBbmDW7Zo5YjYH/Gs9nwAUvxLUK/PGEp7nU
         frBcWOFxXl7zf+b6cOvHaUFHlaC2yRd5JorA5MwNFLDDi15RAub/OJC5CIOlRxwVtd4B
         0/iV3GQmTmvlC1depEhbCKGtoznIgPH3Mn9TSXwbjiICYPVcuttuE2AQ6vZ8pluwkmpG
         PH0kPz9rf1pqJCEbI40HG2sVxHffSYgCBR35PPXc5jvWLOPy1D4F+vHIf1N3OEyeyOnB
         8YXm9ykzxWaOf6A/+9iU/1Ivl7jSrUtFeUKdQW/Yzg/Dt7sl+o9PG1X6I11/tyJU2mgM
         eumA==
X-Gm-Message-State: AOJu0YyKLTDfaAw0Haw6SHyagDH1TJhm55uKaNJIpzEyjRdzdXdf0ldC
	PbLtqnvF3l6HCG5LNgE4oF5uXQ==
X-Google-Smtp-Source: AGHT+IF7wlbCLu5aKqnvoDa+vzLrPQ1alT3S0V3uWasMqktoQcwKrtJf60uEqCxrF1GQbEBwQWcW5w==
X-Received: by 2002:a05:6a21:3391:b0:182:119d:2d0e with SMTP id yy17-20020a056a21339100b00182119d2d0emr10898995pzb.20.1701063376908;
        Sun, 26 Nov 2023 21:36:16 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:16 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/15] Staging: rtl8192e: Rename variable pTxTs
Date: Sun, 26 Nov 2023 21:42:51 -0800
Message-ID: <20231127054305.148276-2-tdavies@darkphysics.net>
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

Rename variable pTxTs to ts to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 50 +++++++++++------------
 drivers/staging/rtl8192e/rtl819x_TSProc.c |  8 ++--
 drivers/staging/rtl8192e/rtllib_tx.c      | 18 ++++----
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index b52b42ac0fc4..497791a980ba 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -23,10 +23,10 @@ static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *ba
 	del_timer_sync(&ba->timer);
 }
 
-static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs)
+static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *ts)
 {
-	struct ba_record *admitted_ba = &pTxTs->TxAdmittedBARecord;
-	struct ba_record *pending_ba = &pTxTs->TxPendingBARecord;
+	struct ba_record *admitted_ba = &ts->TxAdmittedBARecord;
+	struct ba_record *pending_ba = &ts->TxPendingBARecord;
 	u8 send_del_ba = false;
 
 	if (pending_ba->b_valid) {
@@ -443,20 +443,20 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 
 		rx_ts_delete_ba(ieee, ts);
 	} else {
-		struct tx_ts_record *pTxTs;
+		struct tx_ts_record *ts;
 
-		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&pTxTs, dst,
+		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
 			   (u8)pDelBaParamSet->field.tid, TX_DIR, false)) {
 			netdev_warn(ieee->dev, "%s(): can't get TS for TXTS\n",
 				    __func__);
 			return -1;
 		}
 
-		pTxTs->using_ba = false;
-		pTxTs->add_ba_req_in_progress = false;
-		pTxTs->add_ba_req_delayed = false;
-		del_timer_sync(&pTxTs->TsAddBaTimer);
-		tx_ts_delete_ba(ieee, pTxTs);
+		ts->using_ba = false;
+		ts->add_ba_req_in_progress = false;
+		ts->add_ba_req_delayed = false;
+		del_timer_sync(&ts->TsAddBaTimer);
+		tx_ts_delete_ba(ieee, ts);
 	}
 	return 0;
 }
@@ -489,14 +489,14 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 			   enum tr_select TxRxSelect)
 {
 	if (TxRxSelect == TX_DIR) {
-		struct tx_ts_record *pTxTs =
+		struct tx_ts_record *ts =
 			 (struct tx_ts_record *)pTsCommonInfo;
 
-		if (tx_ts_delete_ba(ieee, pTxTs))
+		if (tx_ts_delete_ba(ieee, ts))
 			rtllib_send_DELBA(ieee, pTsCommonInfo->addr,
-					  (pTxTs->TxAdmittedBARecord.b_valid) ?
-					 (&pTxTs->TxAdmittedBARecord) :
-					(&pTxTs->TxPendingBARecord),
+					  (ts->TxAdmittedBARecord.b_valid) ?
+					 (&ts->TxAdmittedBARecord) :
+					(&ts->TxPendingBARecord),
 					 TxRxSelect, DELBA_REASON_END_BA);
 	} else if (TxRxSelect == RX_DIR) {
 		struct rx_ts_record *ts =
@@ -510,23 +510,23 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 
 void rtllib_ba_setup_timeout(struct timer_list *t)
 {
-	struct tx_ts_record *pTxTs = from_timer(pTxTs, t,
+	struct tx_ts_record *ts = from_timer(ts, t,
 					      TxPendingBARecord.timer);
 
-	pTxTs->add_ba_req_in_progress = false;
-	pTxTs->add_ba_req_delayed = true;
-	pTxTs->TxPendingBARecord.b_valid = false;
+	ts->add_ba_req_in_progress = false;
+	ts->add_ba_req_delayed = true;
+	ts->TxPendingBARecord.b_valid = false;
 }
 
 void rtllib_tx_ba_inact_timeout(struct timer_list *t)
 {
-	struct tx_ts_record *pTxTs = from_timer(pTxTs, t,
+	struct tx_ts_record *ts = from_timer(ts, t,
 					      TxAdmittedBARecord.timer);
-	struct rtllib_device *ieee = container_of(pTxTs, struct rtllib_device,
-				     TxTsRecord[pTxTs->num]);
-	tx_ts_delete_ba(ieee, pTxTs);
-	rtllib_send_DELBA(ieee, pTxTs->TsCommonInfo.addr,
-			  &pTxTs->TxAdmittedBARecord, TX_DIR,
+	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
+				     TxTsRecord[ts->num]);
+	tx_ts_delete_ba(ieee, ts);
+	rtllib_send_DELBA(ieee, ts->TsCommonInfo.addr,
+			  &ts->TxAdmittedBARecord, TX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 41c1e768348a..01d077bf0155 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -82,12 +82,12 @@ static void RxPktPendingTimeout(struct timer_list *t)
 
 static void TsAddBaProcess(struct timer_list *t)
 {
-	struct tx_ts_record *pTxTs = from_timer(pTxTs, t, TsAddBaTimer);
-	u8 num = pTxTs->num;
-	struct rtllib_device *ieee = container_of(pTxTs, struct rtllib_device,
+	struct tx_ts_record *ts = from_timer(ts, t, TsAddBaTimer);
+	u8 num = ts->num;
+	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
 				     TxTsRecord[num]);
 
-	rtllib_ts_init_add_ba(ieee, pTxTs, BA_POLICY_IMMEDIATE, false);
+	rtllib_ts_init_add_ba(ieee, ts, BA_POLICY_IMMEDIATE, false);
 	netdev_dbg(ieee->dev, "%s(): ADDBA Req is started\n", __func__);
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 1da098f5b84c..2ef617a55995 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -267,7 +267,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 				    struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
-	struct tx_ts_record *pTxTs = NULL;
+	struct tx_ts_record *ts = NULL;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 
 	if (rtllib_act_scanning(ieee, false))
@@ -289,25 +289,25 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 	if (!ieee->GetNmodeSupportBySecCfg(ieee->dev))
 		return;
 	if (ht_info->current_ampdu_enable) {
-		if (!rtllib_get_ts(ieee, (struct ts_common_info **)(&pTxTs), hdr->addr1,
+		if (!rtllib_get_ts(ieee, (struct ts_common_info **)(&ts), hdr->addr1,
 			   skb->priority, TX_DIR, true)) {
 			netdev_info(ieee->dev, "%s: can't get TS\n", __func__);
 			return;
 		}
-		if (!pTxTs->TxAdmittedBARecord.b_valid) {
+		if (!ts->TxAdmittedBARecord.b_valid) {
 			if (ieee->wpa_ie_len && (ieee->pairwise_key_type ==
 			    KEY_TYPE_NA)) {
 				;
 			} else if (tcb_desc->bdhcp == 1) {
 				;
-			} else if (!pTxTs->disable_add_ba) {
-				TsStartAddBaProcess(ieee, pTxTs);
+			} else if (!ts->disable_add_ba) {
+				TsStartAddBaProcess(ieee, ts);
 			}
 			goto FORCED_AGG_SETTING;
-		} else if (!pTxTs->using_ba) {
-			if (SN_LESS(pTxTs->TxAdmittedBARecord.ba_start_seq_ctrl.field.seq_num,
-				    (pTxTs->TxCurSeq + 1) % 4096))
-				pTxTs->using_ba = true;
+		} else if (!ts->using_ba) {
+			if (SN_LESS(ts->TxAdmittedBARecord.ba_start_seq_ctrl.field.seq_num,
+				    (ts->TxCurSeq + 1) % 4096))
+				ts->using_ba = true;
 			else
 				goto FORCED_AGG_SETTING;
 		}
-- 
2.39.2

