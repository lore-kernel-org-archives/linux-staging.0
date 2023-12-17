Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AF4BAAB
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="kdiFsHqu"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6d9f8578932so2205083a34.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 15:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702857328; x=1703462128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXLxevf4aUXA3wWWgPdFXar5eXPkWv3zOFKTufedNbo=;
        b=kdiFsHquOYDBP7helk8PEguPmlFdPVqN0OWlyAgiE/x5epaWPdmHDAyLwk/GX8Q0iY
         C0Lnazy85z1ML8N6pJuSnwINaCremsJp/h3zevrkphowovRQVOoINZmYG54w+64ZSRy8
         cXqddKAYMcStTA9bn00JFIiILBOSGT7xK4n09vzBCf+9Kcqj810Ga2TXjO8c9xMBqeDm
         o743SGk4Ng9GLIttaT8+Ifn0ethzholSt+c3gKfNub9w8uwRAlHfDYZP+E1bRSdCKOwJ
         XR7fUik5wyaT0Y0Gd47USml8LN7W6UFa/5c0HL8ZRQaDqmKRDQFi3kVeaDG4z4Ez8mc9
         bB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702857328; x=1703462128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXLxevf4aUXA3wWWgPdFXar5eXPkWv3zOFKTufedNbo=;
        b=I9HiTk8iOjgDBobhLZ7RxX1n5m3y6TzRviYxiDI2deXSFo38AiwWHFuEUu+IzbBr7M
         ZX7EqirfEa0kzYh97vvMIMqzRoBM3IZCp2Aldj+T+Lyp8PJrOLYVRCLNI1mBtQUIPO1I
         w9nB6+cb58OS9eznomgYkfrih4vsSD4kRf9OMlGR4ZICNCQmQ4iQJFMaaH1hdACg369/
         T5f39ku2KVAuwTihvP8DCb3PVz9vBmCunQmnaH6qaoHKk+AmiqbgfF9U0j1OJqEEJw91
         RGpQ6pPIUKgKZXtfLjysGlBEKODncQa0yGaVjnmpqdYy1VPi0P6EIJqQwnN+YogcvoHi
         0N9w==
X-Gm-Message-State: AOJu0YwDIVypqp0kczkW18gwC9AULN/gsTl3OjcyB0St66GHeocDhswH
	NyToF9XNRCODvcJcnSRq4Irc0A==
X-Google-Smtp-Source: AGHT+IFoDEcFFi84M0TkMIePMPCmlNMXHemUSrGClgJxG96jTzzaqKgtRjJRCgD8WpaQ+GxXtCuDbA==
X-Received: by 2002:a05:6358:e48b:b0:172:d78b:d2eb with SMTP id by11-20020a056358e48b00b00172d78bd2ebmr1473446rwb.10.1702857328274;
        Sun, 17 Dec 2023 15:55:28 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm9036176pjy.10.2023.12.17.15.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:55:27 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 5/6] Staging: rtl8192e: Rename variable TxRxSelect
Date: Sun, 17 Dec 2023 15:55:19 -0800
Message-Id: <20231217235520.30377-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217235520.30377-1-tdavies@darkphysics.net>
References: <20231217235520.30377-1-tdavies@darkphysics.net>
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
index 2fd54312c04f..b816f94336f0 100644
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
index ad4d9e4c9b63..43b1e70b218b 100644
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
 			  struct ts_common_info, List);
 		list_del_init(&(*ppTS)->List);
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
index d8da772b0f39..870720a12a48 100644
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

