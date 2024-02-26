Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EF31CD3D
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919963; cv=none; b=Agq1lObADBJQlgxoo6qmrNSpEydsroQxoELGGXZL9DsrvLWi28De+SmgHDI5FvTtAFkyx5N7QsBpibdGVkvb+yC0Zfr6O08nwXSr9AcWo3r/ygQZxJ/qCSC996QQl+TWcOjGAHEAfCO4oe9ihEPUPmf1ZuV5yyQ69zg6mNxm/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919963; c=relaxed/simple;
	bh=9dOFkhnaSWEiTNeTcyRPAntKh09djoq4BBpWP88iABk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kFZJIWuOMPQbKMxLMYZlUB8CxQExveQPpbpJuIJX/gLV7vrXVcQjJkceRd+e2erB/Sg3RTpRbigr5I9HQlwmH4byrwQqiYghT5dX1FC8Q4QiKFAIPerVGz0VRHQ0fJStCaWeuIODGatKWFOIubARVXcYDCiSBITAr4TMPpWD0mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=WL4FLSbc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="WL4FLSbc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dca8b86ee7so1468655ad.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919961; x=1709524761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88SDs5w2MY5mWdpm7KClCN1gnNwWnjOc3NGMH26ZbvA=;
        b=WL4FLSbcJ1msjxX366fElHXzwitj5TKAvemiP8Yn27GGU5QjBuMikciKhFIoI3xWRr
         1mvE/xsJjVWurOerDNm2gKVcFEGNk1uFHJYYTWEUmAk84Ug2umkMwn88VA86PcMY3rLp
         KLrbA7TD8YiEfi5g85cl8EyNMCC2vNmpits22uGOnhNzU6xDw6LJeqnYZLV6Lkk1qVeJ
         c5iiTSV8Ohj+hj+KuRuexwgXZTM21McLENFO6o8CCGyZ1QN10Q9dlGK7RHC23ORZqX/z
         4IbIPIfMIKg31LYyz7yMdqU7AY4ibIx915QUt9LvHVmO6hE5BuPE4bnxUcy5YaGhQScT
         NL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919961; x=1709524761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88SDs5w2MY5mWdpm7KClCN1gnNwWnjOc3NGMH26ZbvA=;
        b=wqcc5jGMT0JOLAiK6aRsxq54BZomqu5y5wT2KNgEl363gkA207CXv8a3fg6RvIRRup
         5noNhGztCUcFGXmijEoWyMxgbluzlXFI70cwHnwmTYYAtgwjhYt0e9ZS+Aus9sEAuzth
         5QSblNRjIy4TlN78VG2iYh8cQEIhU2RP9Ry5KSZB8icM9Oq0dP8POSrN/X5JMhqJhLST
         g0y4ZPaP1PHi5Kmfc6/ELvkvmHkl3aqiq87eJDpp4jt8kNyNEU1vkF4f1Zc44cZnd8um
         sMTJUn3Dk40cs6dvG64EBSdbVdxgb+Yxltv/k7lN6x93OF8ZHsRVDrEk531YjGL2ROfs
         wLtw==
X-Gm-Message-State: AOJu0YxngI0IxI9ii/GpbySRqqRaDUb7XDskJFzTkDlLC3J5pydA46oZ
	xqWR18YB7j4bBUnQLC8GxHLEsznMPAzFAOp6s2+m6sWeoK18iilS5yxkaBIVu74=
X-Google-Smtp-Source: AGHT+IHHKA7WbMNfON9AlIWpadoT5wUcsmIO9ZwMI88sw4QwOntJPm3qi0ddoq5Mspb1oo2nJBuAAA==
X-Received: by 2002:a17:903:120c:b0:1dc:1831:8ede with SMTP id l12-20020a170903120c00b001dc18318edemr5950697plh.53.1708919961518;
        Sun, 25 Feb 2024 19:59:21 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:20 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/8] Staging: rtl8192e: Rename variable TxRxSelect
Date: Sun, 25 Feb 2024 19:59:09 -0800
Message-Id: <20240226035915.370478-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TxRxSelect to tx_rx_select to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 18 ++++++++---------
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 24 +++++++++++------------
 drivers/staging/rtl8192e/rtllib.h         |  4 ++--
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index c06633867641..030e0a87c931 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -125,7 +125,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 
 static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 				    struct ba_record *ba,
-				    enum tr_select TxRxSelect, u16 reason_code)
+				    enum tr_select tx_rx_select, u16 reason_code)
 {
 	union delba_param_set del_ba_param_set;
 	struct sk_buff *skb = NULL;
@@ -139,7 +139,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 
 	memset(&del_ba_param_set, 0, 2);
 
-	del_ba_param_set.field.initiator = (TxRxSelect == TX_DIR) ? 1 : 0;
+	del_ba_param_set.field.initiator = (tx_rx_select == TX_DIR) ? 1 : 0;
 	del_ba_param_set.field.tid	= ba->ba_param_set.field.tid;
 
 	skb = dev_alloc_skb(len + sizeof(struct ieee80211_hdr_3addr));
@@ -199,12 +199,12 @@ static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
 }
 
 static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
-			      struct ba_record *ba, enum tr_select TxRxSelect,
+			      struct ba_record *ba, enum tr_select tx_rx_select,
 			      u16 reason_code)
 {
 	struct sk_buff *skb;
 
-	skb = rtllib_DELBA(ieee, dst, ba, TxRxSelect, reason_code);
+	skb = rtllib_DELBA(ieee, dst, ba, tx_rx_select, reason_code);
 	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
 	else
@@ -486,9 +486,9 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 			   struct ts_common_info *ts_common_info,
-			   enum tr_select TxRxSelect)
+			   enum tr_select tx_rx_select)
 {
-	if (TxRxSelect == TX_DIR) {
+	if (tx_rx_select == TX_DIR) {
 		struct tx_ts_record *ts =
 			 (struct tx_ts_record *)ts_common_info;
 
@@ -497,14 +497,14 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 					  (ts->tx_admitted_ba_record.b_valid) ?
 					 (&ts->tx_admitted_ba_record) :
 					(&ts->tx_pending_ba_record),
-					 TxRxSelect, DELBA_REASON_END_BA);
-	} else if (TxRxSelect == RX_DIR) {
+					 tx_rx_select, DELBA_REASON_END_BA);
+	} else if (tx_rx_select == RX_DIR) {
 		struct rx_ts_record *ts =
 				 (struct rx_ts_record *)ts_common_info;
 		if (rx_ts_delete_ba(ieee, ts))
 			rtllib_send_DELBA(ieee, ts_common_info->addr,
 					  &ts->rx_admitted_ba_record,
-					  TxRxSelect, DELBA_REASON_END_BA);
+					  tx_rx_select, DELBA_REASON_END_BA);
 	}
 }
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index e9a193b5ab10..9903fe3f3c77 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -171,14 +171,14 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 
 static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 						  u8 *addr, u8 TID,
-						  enum tr_select TxRxSelect)
+						  enum tr_select tx_rx_select)
 {
 	u8	dir;
 	bool	search_dir[4] = {0};
 	struct list_head *psearch_list;
 	struct ts_common_info *pRet = NULL;
 
-	if (TxRxSelect == TX_DIR) {
+	if (tx_rx_select == TX_DIR) {
 		search_dir[DIR_UP] = true;
 		search_dir[DIR_BI_DIR] = true;
 		search_dir[DIR_DIRECT] = true;
@@ -188,7 +188,7 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 		search_dir[DIR_DIRECT] = true;
 	}
 
-	if (TxRxSelect == TX_DIR)
+	if (tx_rx_select == TX_DIR)
 		psearch_list = &ieee->Tx_TS_Admit_List;
 	else
 		psearch_list = &ieee->Rx_TS_Admit_List;
@@ -225,7 +225,7 @@ static void MakeTSEntry(struct ts_common_info *ts_common_info, u8 *addr,
 }
 
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
-	   u8 *addr, u8 TID, enum tr_select TxRxSelect, bool bAddNewTs)
+	   u8 *addr, u8 TID, enum tr_select tx_rx_select, bool bAddNewTs)
 {
 	u8	UP = 0;
 	struct qos_tsinfo tspec;
@@ -265,7 +265,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		}
 	}
 
-	*ppTS = SearchAdmitTRStream(ieee, addr, UP, TxRxSelect);
+	*ppTS = SearchAdmitTRStream(ieee, addr, UP, tx_rx_select);
 	if (*ppTS)
 		return true;
 
@@ -274,21 +274,21 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		return false;
 	}
 
-	pUnusedList = (TxRxSelect == TX_DIR) ?
+	pUnusedList = (tx_rx_select == TX_DIR) ?
 				(&ieee->Tx_TS_Unused_List) :
 				(&ieee->Rx_TS_Unused_List);
 
-	pAddmitList = (TxRxSelect == TX_DIR) ?
+	pAddmitList = (tx_rx_select == TX_DIR) ?
 				(&ieee->Tx_TS_Admit_List) :
 				(&ieee->Rx_TS_Admit_List);
 
-	Dir = ((TxRxSelect == TX_DIR) ? DIR_UP : DIR_DOWN);
+	Dir = ((tx_rx_select == TX_DIR) ? DIR_UP : DIR_DOWN);
 
 	if (!list_empty(pUnusedList)) {
 		(*ppTS) = list_entry(pUnusedList->next,
 			  struct ts_common_info, list);
 		list_del_init(&(*ppTS)->list);
-		if (TxRxSelect == TX_DIR) {
+		if (tx_rx_select == TX_DIR) {
 			struct tx_ts_record *tmp =
 				container_of(*ppTS,
 				struct tx_ts_record,
@@ -321,11 +321,11 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 }
 
 static void RemoveTsEntry(struct rtllib_device *ieee,
-			  struct ts_common_info *pTs, enum tr_select TxRxSelect)
+			  struct ts_common_info *pTs, enum tr_select tx_rx_select)
 {
-	rtllib_ts_init_del_ba(ieee, pTs, TxRxSelect);
+	rtllib_ts_init_del_ba(ieee, pTs, tx_rx_select);
 
-	if (TxRxSelect == RX_DIR) {
+	if (tx_rx_select == RX_DIR) {
 		struct rx_reorder_entry *pRxReorderEntry;
 		struct rx_ts_record *ts = (struct rx_ts_record *)pTs;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index aa915d09bd63..05abc001507c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1778,13 +1778,13 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 			   u8 policy, u8 overwrite_pending);
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 			   struct ts_common_info *ts_common_info,
-			   enum tr_select TxRxSelect);
+			   enum tr_select tx_rx_select);
 void rtllib_ba_setup_timeout(struct timer_list *t);
 void rtllib_tx_ba_inact_timeout(struct timer_list *t);
 void rtllib_rx_ba_inact_timeout(struct timer_list *t);
 void rtllib_reset_ba_entry(struct ba_record *ba);
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *addr,
-	   u8 TID, enum tr_select TxRxSelect, bool bAddNewTs);
+	   u8 TID, enum tr_select tx_rx_select, bool bAddNewTs);
 void rtllib_ts_init(struct rtllib_device *ieee);
 void TsStartAddBaProcess(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
-- 
2.39.2

