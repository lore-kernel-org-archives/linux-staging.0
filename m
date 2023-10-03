Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E437A4A
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 03:14:30 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3af5fcb5e37so304470b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1696302870; x=1696907670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9hlCad7f4/mqWpqK+voUlgMVeMuqqdsowTrGqTaaqM=;
        b=IU/oASuKNGWvT331pWEkAOWCuUr4T/dC1K3LDY731Fy+iIxnowkaTZq7mD5xKfzaSV
         xNCEGWmfNo4jUu7eYsPrQ5A2tCf3reuNK80oQI1kN3DqFPX6FLeEE7DK7/G7qu8YwgHr
         QNOsba1sqxSw268U66Hu20cSqx3zSH8T9ZpaCMcU9cEH4P4QGTMDgCTrmBW+BYjbN4Bx
         1HxgHXWCzinTZ+eweUPePjWFQV0EcXR0QB0KTNex5cAIpq6Yq6QjwfMuvn0Lz1cXj3nP
         ObBHHLJdXIVvrZ2URuKlKWqJpaZuOg9ujCY6OCFxQxDIxaeeg66L81KG/6OLaViWza/9
         iTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696302870; x=1696907670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9hlCad7f4/mqWpqK+voUlgMVeMuqqdsowTrGqTaaqM=;
        b=b5Pxk41s6vYDw19+tOlbb6TcSbSmPac8e1Llq7mHQJoZN8A5va1RwCwtsMyE0A/mSd
         QJ1TWm2AJEYqr6KgnE+ItIbVo8IGy92Ch3khdJpxiqbn7zU51hedjj6mnQGaA9jX+IH2
         ALrcglpg4fT+Tao/KvYL+dYoFb83+M/G3KZVdKo6cLYhy4dsZs2LmYh4M4sauwfRMZdl
         Yzxl1AqPUxS9XR4P20pszNDUJhaR/offqMATNiDlZfw0ICGgAhNT03GwQDzH/1oGnnWx
         UeY4stQ0Oc+2FqYbb9ujbBs2GVcNZtxTycD6ci1ES+VhI2PV1ys4WsFtLxbstqYXH4g+
         wphQ==
X-Gm-Message-State: AOJu0Yz11AFM5dBt+Ks08usApymV4Vw3VMC9GQw6LwvsWfptfkjrDUmB
	5hpf0SCOwGvxvtW53XREIIU4Mg==
X-Google-Smtp-Source: AGHT+IHbIEs+kM3VGBtdMvRHa9pcnImPTwV5ouHVBS4hAlwLGWNDAbunCzlqrMOp4dTaql62yu6j2g==
X-Received: by 2002:a05:6808:1804:b0:3ae:2b08:549d with SMTP id bh4-20020a056808180400b003ae2b08549dmr16176040oib.37.1696302870058;
        Mon, 02 Oct 2023 20:14:30 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090a004b00b00273fc850342sm7692550pjb.20.2023.10.02.20.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:14:29 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/3] Staging: rtl8192e: Rename variable pBA
Date: Mon,  2 Oct 2023 20:18:49 -0700
Message-ID: <20231003031849.176743-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003031849.176743-1-tdavies@darkphysics.net>
References: <20231003031849.176743-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pBA to ba to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 100 +++++++++++-----------
 drivers/staging/rtl8192e/rtllib.h         |   2 +-
 2 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 15e4b83af234..ec8edfecdb73 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -10,17 +10,17 @@
 #include "rtllib.h"
 #include "rtl819x_BA.h"
 
-static void activate_ba_entry(struct ba_record *pBA, u16 time)
+static void activate_ba_entry(struct ba_record *ba, u16 time)
 {
-	pBA->b_valid = true;
+	ba->b_valid = true;
 	if (time != 0)
-		mod_timer(&pBA->timer, jiffies + msecs_to_jiffies(time));
+		mod_timer(&ba->timer, jiffies + msecs_to_jiffies(time));
 }
 
-static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *pBA)
+static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *ba)
 {
-	pBA->b_valid = false;
-	del_timer_sync(&pBA->timer);
+	ba->b_valid = false;
+	del_timer_sync(&ba->timer);
 }
 
 static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs)
@@ -54,17 +54,17 @@ static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *ts)
 	return bSendDELBA;
 }
 
-void rtllib_reset_ba_entry(struct ba_record *pBA)
+void rtllib_reset_ba_entry(struct ba_record *ba)
 {
-	pBA->b_valid			  = false;
-	pBA->ba_param_set.short_data	  = 0;
-	pBA->ba_timeout_value		  = 0;
-	pBA->dialog_token		  = 0;
-	pBA->ba_start_seq_ctrl.short_data = 0;
+	ba->b_valid                      = false;
+	ba->ba_param_set.short_data      = 0;
+	ba->ba_timeout_value             = 0;
+	ba->dialog_token                 = 0;
+	ba->ba_start_seq_ctrl.short_data = 0;
 }
 
 static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
-				    struct ba_record *pBA,
+				    struct ba_record *ba,
 				    u16 status_code, u8 type)
 {
 	struct sk_buff *skb = NULL;
@@ -75,8 +75,8 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 	netdev_dbg(ieee->dev, "%s(): frame(%d) sentd to: %pM, ieee->dev:%p\n",
 		   __func__, type, dst, ieee->dev);
 
-	if (!pBA) {
-		netdev_warn(ieee->dev, "pBA is NULL\n");
+	if (!ba) {
+		netdev_warn(ieee->dev, "ba is NULL\n");
 		return NULL;
 	}
 	skb = dev_alloc_skb(len + sizeof(struct ieee80211_hdr_3addr));
@@ -98,21 +98,21 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 	tag = skb_put(skb, 9);
 	*tag++ = ACT_CAT_BA;
 	*tag++ = type;
-	*tag++ = pBA->dialog_token;
+	*tag++ = ba->dialog_token;
 
 	if (type == ACT_ADDBARSP) {
 		put_unaligned_le16(status_code, tag);
 		tag += 2;
 	}
 
-	put_unaligned_le16(pBA->ba_param_set.short_data, tag);
+	put_unaligned_le16(ba->ba_param_set.short_data, tag);
 	tag += 2;
 
-	put_unaligned_le16(pBA->ba_timeout_value, tag);
+	put_unaligned_le16(ba->ba_timeout_value, tag);
 	tag += 2;
 
 	if (type == ACT_ADDBAREQ) {
-		memcpy(tag, (u8 *)&pBA->ba_start_seq_ctrl, 2);
+		memcpy(tag, (u8 *)&ba->ba_start_seq_ctrl, 2);
 		tag += 2;
 	}
 
@@ -124,7 +124,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 }
 
 static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
-				    struct ba_record *pBA,
+				    struct ba_record *ba,
 				    enum tr_select TxRxSelect, u16 ReasonCode)
 {
 	union delba_param_set DelbaParamSet;
@@ -140,7 +140,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	memset(&DelbaParamSet, 0, 2);
 
 	DelbaParamSet.field.initiator = (TxRxSelect == TX_DIR) ? 1 : 0;
-	DelbaParamSet.field.tid	= pBA->ba_param_set.field.tid;
+	DelbaParamSet.field.tid	= ba->ba_param_set.field.tid;
 
 	skb = dev_alloc_skb(len + sizeof(struct ieee80211_hdr_3addr));
 	if (!skb)
@@ -174,11 +174,11 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 }
 
 static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *pBA)
+				 struct ba_record *ba)
 {
 	struct sk_buff *skb;
 
-	skb = rtllib_ADDBA(ieee, dst, pBA, 0, ACT_ADDBAREQ);
+	skb = rtllib_ADDBA(ieee, dst, ba, 0, ACT_ADDBAREQ);
 
 	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
@@ -187,11 +187,11 @@ static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
 }
 
 static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *pBA, u16 status_code)
+				 struct ba_record *ba, u16 status_code)
 {
 	struct sk_buff *skb;
 
-	skb = rtllib_ADDBA(ieee, dst, pBA, status_code, ACT_ADDBARSP);
+	skb = rtllib_ADDBA(ieee, dst, ba, status_code, ACT_ADDBARSP);
 	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
 	else
@@ -199,12 +199,12 @@ static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
 }
 
 static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
-			      struct ba_record *pBA, enum tr_select TxRxSelect,
+			      struct ba_record *ba, enum tr_select TxRxSelect,
 			      u16 ReasonCode)
 {
 	struct sk_buff *skb;
 
-	skb = rtllib_DELBA(ieee, dst, pBA, TxRxSelect, ReasonCode);
+	skb = rtllib_DELBA(ieee, dst, ba, TxRxSelect, ReasonCode);
 	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
 	else
@@ -216,7 +216,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	struct ieee80211_hdr_3addr *req = NULL;
 	u16 rc = 0;
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
-	struct ba_record *pBA = NULL;
+	struct ba_record *ba = NULL;
 	union ba_param_set *pBaParamSet = NULL;
 	u16 *pBaTimeoutVal = NULL;
 	union sequence_control *pBaStartSeqCtrl = NULL;
@@ -259,7 +259,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		goto OnADDBAReq_Fail;
 	}
-	pBA = &ts->rx_admitted_ba_record;
+	ba = &ts->rx_admitted_ba_record;
 
 	if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
 		rc = ADDBA_STATUS_INVALID_PARAM;
@@ -270,20 +270,20 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	rtllib_FlushRxTsPendingPkts(ieee, ts);
 
-	deactivate_ba_entry(ieee, pBA);
-	pBA->dialog_token = *pDialogToken;
-	pBA->ba_param_set = *pBaParamSet;
-	pBA->ba_timeout_value = *pBaTimeoutVal;
-	pBA->ba_start_seq_ctrl = *pBaStartSeqCtrl;
+	deactivate_ba_entry(ieee, ba);
+	ba->dialog_token = *pDialogToken;
+	ba->ba_param_set = *pBaParamSet;
+	ba->ba_timeout_value = *pBaTimeoutVal;
+	ba->ba_start_seq_ctrl = *pBaStartSeqCtrl;
 
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev) ||
 	   (ieee->ht_info->iot_action & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
-		pBA->ba_param_set.field.buffer_size = 1;
+		ba->ba_param_set.field.buffer_size = 1;
 	else
-		pBA->ba_param_set.field.buffer_size = 32;
+		ba->ba_param_set.field.buffer_size = 32;
 
-	activate_ba_entry(pBA, 0);
-	rtllib_send_ADDBARsp(ieee, dst, pBA, ADDBA_STATUS_SUCCESS);
+	activate_ba_entry(ba, 0);
+	rtllib_send_ADDBARsp(ieee, dst, ba, ADDBA_STATUS_SUCCESS);
 
 	return 0;
 
@@ -464,24 +464,24 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
 			   u8 policy, u8	bOverwritePending)
 {
-	struct ba_record *pBA = &pTS->TxPendingBARecord;
+	struct ba_record *ba = &pTS->TxPendingBARecord;
 
-	if (pBA->b_valid && !bOverwritePending)
+	if (ba->b_valid && !bOverwritePending)
 		return;
 
-	deactivate_ba_entry(ieee, pBA);
+	deactivate_ba_entry(ieee, ba);
 
-	pBA->dialog_token++;
-	pBA->ba_param_set.field.amsdu_support = 0;
-	pBA->ba_param_set.field.ba_policy = policy;
-	pBA->ba_param_set.field.tid = pTS->TsCommonInfo.TSpec.f.TSInfo.field.ucTSID;
-	pBA->ba_param_set.field.buffer_size = 32;
-	pBA->ba_timeout_value = 0;
-	pBA->ba_start_seq_ctrl.field.seq_num = (pTS->TxCurSeq + 3) % 4096;
+	ba->dialog_token++;
+	ba->ba_param_set.field.amsdu_support = 0;
+	ba->ba_param_set.field.ba_policy = policy;
+	ba->ba_param_set.field.tid = pTS->TsCommonInfo.TSpec.f.TSInfo.field.ucTSID;
+	ba->ba_param_set.field.buffer_size = 32;
+	ba->ba_timeout_value = 0;
+	ba->ba_start_seq_ctrl.field.seq_num = (pTS->TxCurSeq + 3) % 4096;
 
-	activate_ba_entry(pBA, BA_SETUP_TIMEOUT);
+	activate_ba_entry(ba, BA_SETUP_TIMEOUT);
 
-	rtllib_send_ADDBAReq(ieee, pTS->TsCommonInfo.addr, pBA);
+	rtllib_send_ADDBAReq(ieee, pTS->TsCommonInfo.addr, ba);
 }
 
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index bdbd27e382b9..f02f1c96d14a 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1819,7 +1819,7 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 void rtllib_ba_setup_timeout(struct timer_list *t);
 void rtllib_tx_ba_inact_timeout(struct timer_list *t);
 void rtllib_rx_ba_inact_timeout(struct timer_list *t);
-void rtllib_reset_ba_entry(struct ba_record *pBA);
+void rtllib_reset_ba_entry(struct ba_record *ba);
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *addr,
 	   u8 TID, enum tr_select TxRxSelect, bool bAddNewTs);
 void rtllib_ts_init(struct rtllib_device *ieee);
-- 
2.39.2

