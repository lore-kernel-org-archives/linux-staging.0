Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7314421
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:32 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59e77e4f707so6356347b3.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266492; x=1695871292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVi5XTsc2kiTuYoQoZkEz6aZVmR8nv1VQ4FqXeg+0PE=;
        b=XamC6E/Oukm3rZRrhJNwmzAQSWjALilNuWCXQVcA68qBemHQEHNmVOAgvWCAz3FS9u
         AQmU6vXk5F9eIadOgHNhEkL1i0aG9exfVZweAB3jMywe9USEpf8gCwrkFdQ3xIitL7+o
         WD5+/yb1TDAib1zlu8w7KZy7dq9AFdyHlMFpExQdt3t6yNrTgGXL9A7bwHcvscU3CxMp
         bOAFpmdlsvSE1jYWudM4H1beccPRyypcOxRX3urZ/wnWI5G/rnmx0u1PSQ2P/I313EJS
         dwSDR/BF2eCEd7yLT3GqdRJH3CgNaI5HofQ6mE/ZXi99nJO2bM51bN+OUDWyg8vbUTZD
         gILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266492; x=1695871292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVi5XTsc2kiTuYoQoZkEz6aZVmR8nv1VQ4FqXeg+0PE=;
        b=fjvS2YTOJt6nUWoUHI223MxMS93Kdz1wyt72FB9Vx5KSiwvJYYJuC8nJA+JHKb0lXk
         3xgpr+z1hIQTzZPjnReJISaZKCr0f/jm8a6Y6UYPzc73xG5IVQoIf5noj2iernNZehDa
         PiEqsa9rmgLqcytazadlnmcddVtEifD13rCnfj1gVUsKS9htM0yg4/JGOEMupkKLctNb
         CGXoWFjnl++29R26GAs6cUCbunkWnSqftHTz8uw75WTHhI7VWAY9zJ1AsE14xvw71pDb
         pCW/7GLrMNy3zIQNQ47tVTc77/r7OB5lUI3e8sKeXxMp3M2PcFtaODGqTVeKT9WuOjUt
         VkEQ==
X-Gm-Message-State: AOJu0Yx0R7XeoGWaA7T7E2rvh+aAWFnrcSVqN2QsEYke3zyfnFx08I7V
	8VknqAn5WJbJ1VarNDMB9EEceQ==
X-Google-Smtp-Source: AGHT+IGrFr6AZ9BvGBTRPvD0jFAw5HM2faRyDv/ejRoRuRC/qaE98vNqmyUV6xj3yB0gvdakwGe61g==
X-Received: by 2002:a0d:e609:0:b0:58f:ae13:462b with SMTP id p9-20020a0de609000000b0058fae13462bmr4631868ywe.4.1695266491684;
        Wed, 20 Sep 2023 20:21:31 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:31 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/11] Staging: rtl8192e: Rename variable Addr
Date: Wed, 20 Sep 2023 20:25:10 -0700
Message-ID: <20230921032515.96152-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Addr to addr to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 10 +++----
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 32 +++++++++++------------
 drivers/staging/rtl8192e/rtllib.h         |  4 +--
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index e6892bb7958c..3468bdcea7fc 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -481,7 +481,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
 
 	activate_ba_entry(pBA, BA_SETUP_TIMEOUT);
 
-	rtllib_send_ADDBAReq(ieee, pTS->TsCommonInfo.Addr, pBA);
+	rtllib_send_ADDBAReq(ieee, pTS->TsCommonInfo.addr, pBA);
 }
 
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
@@ -493,7 +493,7 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 			 (struct tx_ts_record *)pTsCommonInfo;
 
 		if (tx_ts_delete_ba(ieee, pTxTs))
-			rtllib_send_DELBA(ieee, pTsCommonInfo->Addr,
+			rtllib_send_DELBA(ieee, pTsCommonInfo->addr,
 					  (pTxTs->TxAdmittedBARecord.b_valid) ?
 					 (&pTxTs->TxAdmittedBARecord) :
 					(&pTxTs->TxPendingBARecord),
@@ -502,7 +502,7 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 		struct rx_ts_record *ts =
 				 (struct rx_ts_record *)pTsCommonInfo;
 		if (rx_ts_delete_ba(ieee, ts))
-			rtllib_send_DELBA(ieee, pTsCommonInfo->Addr,
+			rtllib_send_DELBA(ieee, pTsCommonInfo->addr,
 					  &ts->rx_admitted_ba_record,
 					  TxRxSelect, DELBA_REASON_END_BA);
 	}
@@ -525,7 +525,7 @@ void rtllib_tx_ba_inact_timeout(struct timer_list *t)
 	struct rtllib_device *ieee = container_of(pTxTs, struct rtllib_device,
 				     TxTsRecord[pTxTs->num]);
 	tx_ts_delete_ba(ieee, pTxTs);
-	rtllib_send_DELBA(ieee, pTxTs->TsCommonInfo.Addr,
+	rtllib_send_DELBA(ieee, pTxTs->TsCommonInfo.addr,
 			  &pTxTs->TxAdmittedBARecord, TX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
@@ -538,7 +538,7 @@ void rtllib_rx_ba_inact_timeout(struct timer_list *t)
 				     RxTsRecord[ts->num]);
 
 	rx_ts_delete_ba(ieee, ts);
-	rtllib_send_DELBA(ieee, ts->ts_common_info.Addr,
+	rtllib_send_DELBA(ieee, ts->ts_common_info.addr,
 			  &ts->rx_admitted_ba_record, RX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 0e851d4221a7..a9770592a8c9 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -19,7 +19,7 @@ enum tr_select {
 
 struct ts_common_info {
 	struct list_head		List;
-	u8				Addr[ETH_ALEN];
+	u8				addr[ETH_ALEN];
 	union tspec_body TSpec;
 	union qos_tclas TClass[TCLAS_NUM];
 	u8				TClasProc;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 9f93186b5ed5..f7682f11dc65 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -93,7 +93,7 @@ static void TsAddBaProcess(struct timer_list *t)
 
 static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
 {
-	eth_zero_addr(pTsCommonInfo->Addr);
+	eth_zero_addr(pTsCommonInfo->addr);
 	memset(&pTsCommonInfo->TSpec, 0, sizeof(union tspec_body));
 	memset(&pTsCommonInfo->TClass, 0, sizeof(union qos_tclas) * TCLAS_NUM);
 	pTsCommonInfo->TClasProc = 0;
@@ -173,7 +173,7 @@ void TSInitialize(struct rtllib_device *ieee)
 }
 
 static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
-						  u8 *Addr, u8 TID,
+						  u8 *addr, u8 TID,
 						  enum tr_select TxRxSelect)
 {
 	u8	dir;
@@ -207,7 +207,7 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 		if (!search_dir[dir])
 			continue;
 		list_for_each_entry(pRet, psearch_list, List) {
-			if (memcmp(pRet->Addr, Addr, 6) == 0 &&
+			if (memcmp(pRet->addr, addr, 6) == 0 &&
 			    pRet->TSpec.f.TSInfo.field.ucTSID == TID &&
 			    pRet->TSpec.f.TSInfo.field.ucDirection == dir)
 				break;
@@ -221,7 +221,7 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 	return NULL;
 }
 
-static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *Addr,
+static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
 			union tspec_body *pTSPEC, union qos_tclas *pTCLAS,
 			u8 TCLAS_Num, u8 TCLAS_Proc)
 {
@@ -230,7 +230,7 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *Addr,
 	if (!pTsCommonInfo)
 		return;
 
-	memcpy(pTsCommonInfo->Addr, Addr, 6);
+	memcpy(pTsCommonInfo->addr, addr, 6);
 
 	if (pTSPEC)
 		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
@@ -245,7 +245,7 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *Addr,
 }
 
 bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
-	   u8 *Addr, u8 TID, enum tr_select TxRxSelect, bool bAddNewTs)
+	   u8 *addr, u8 TID, enum tr_select TxRxSelect, bool bAddNewTs)
 {
 	u8	UP = 0;
 	union tspec_body TSpec;
@@ -254,7 +254,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	struct list_head *pAddmitList;
 	enum direction_value Dir;
 
-	if (is_multicast_ether_addr(Addr)) {
+	if (is_multicast_ether_addr(addr)) {
 		netdev_warn(ieee->dev, "Get TS for Broadcast or Multicast\n");
 		return false;
 	}
@@ -285,7 +285,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		}
 	}
 
-	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
+	*ppTS = SearchAdmitTRStream(ieee, addr, UP, TxRxSelect);
 	if (*ppTS)
 		return true;
 
@@ -324,7 +324,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 
 		netdev_dbg(ieee->dev,
 			   "to init current TS, UP:%d, Dir:%d, addr: %pM ppTs=%p\n",
-			   UP, Dir, Addr, *ppTS);
+			   UP, Dir, addr, *ppTS);
 		pTSInfo->field.ucTrafficType = 0;
 		pTSInfo->field.ucTSID = UP;
 		pTSInfo->field.ucDirection = Dir;
@@ -335,7 +335,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		pTSInfo->field.ucTSInfoAckPolicy = 0;
 		pTSInfo->field.ucSchedule = 0;
 
-		MakeTSEntry(*ppTS, Addr, &TSpec, NULL, 0, 0);
+		MakeTSEntry(*ppTS, addr, &TSpec, NULL, 0, 0);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
 
 		return true;
@@ -387,14 +387,14 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
 	}
 }
 
-void RemovePeerTS(struct rtllib_device *ieee, u8 *Addr)
+void RemovePeerTS(struct rtllib_device *ieee, u8 *addr)
 {
 	struct ts_common_info *pTS, *pTmpTS;
 
-	netdev_info(ieee->dev, "===========>%s, %pM\n", __func__, Addr);
+	netdev_info(ieee->dev, "===========>%s, %pM\n", __func__, addr);
 
 	list_for_each_entry_safe(pTS, pTmpTS, &ieee->Tx_TS_Pending_List, List) {
-		if (memcmp(pTS->Addr, Addr, 6) == 0) {
+		if (memcmp(pTS->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, pTS, TX_DIR);
 			list_del_init(&pTS->List);
 			list_add_tail(&pTS->List, &ieee->Tx_TS_Unused_List);
@@ -402,7 +402,7 @@ void RemovePeerTS(struct rtllib_device *ieee, u8 *Addr)
 	}
 
 	list_for_each_entry_safe(pTS, pTmpTS, &ieee->Tx_TS_Admit_List, List) {
-		if (memcmp(pTS->Addr, Addr, 6) == 0) {
+		if (memcmp(pTS->addr, addr, 6) == 0) {
 			netdev_info(ieee->dev,
 				    "====>remove Tx_TS_admin_list\n");
 			RemoveTsEntry(ieee, pTS, TX_DIR);
@@ -412,7 +412,7 @@ void RemovePeerTS(struct rtllib_device *ieee, u8 *Addr)
 	}
 
 	list_for_each_entry_safe(pTS, pTmpTS, &ieee->Rx_TS_Pending_List, List) {
-		if (memcmp(pTS->Addr, Addr, 6) == 0) {
+		if (memcmp(pTS->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, pTS, RX_DIR);
 			list_del_init(&pTS->List);
 			list_add_tail(&pTS->List, &ieee->Rx_TS_Unused_List);
@@ -420,7 +420,7 @@ void RemovePeerTS(struct rtllib_device *ieee, u8 *Addr)
 	}
 
 	list_for_each_entry_safe(pTS, pTmpTS, &ieee->Rx_TS_Admit_List, List) {
-		if (memcmp(pTS->Addr, Addr, 6) == 0) {
+		if (memcmp(pTS->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, pTS, RX_DIR);
 			list_del_init(&pTS->List);
 			list_add_tail(&pTS->List, &ieee->Rx_TS_Unused_List);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5517b9df65be..b518e23ff558 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1842,12 +1842,12 @@ void rtllib_ba_setup_timeout(struct timer_list *t);
 void rtllib_tx_ba_inact_timeout(struct timer_list *t);
 void rtllib_rx_ba_inact_timeout(struct timer_list *t);
 void rtllib_reset_ba_entry(struct ba_record *pBA);
-bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *Addr,
+bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *addr,
 	   u8 TID, enum tr_select TxRxSelect, bool bAddNewTs);
 void TSInitialize(struct rtllib_device *ieee);
 void TsStartAddBaProcess(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
-void RemovePeerTS(struct rtllib_device *ieee, u8 *Addr);
+void RemovePeerTS(struct rtllib_device *ieee, u8 *addr);
 void RemoveAllTS(struct rtllib_device *ieee);
 
 static inline const char *escape_essid(const char *essid, u8 essid_len)
-- 
2.39.2

