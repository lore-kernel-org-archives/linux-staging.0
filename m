Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1AA40
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:30 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-689f9576babso1547826b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492330; x=1693097130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiaXJj0k6MyiMU1PMvQA9CUDFVjljfiUN/JbuRuq1Dc=;
        b=XrrVCuhGYWjrB+tArkHmMKlhX3yFQgOaO10yJ1N4hrDYCNB4Ahik8qUUwyAjZnk3FB
         JXZClb8QVucU3/i+EyOlqGvSScjG1Y+uT996Q0KAFMHRzfVeaNLdzLyiUNFOG5I3lklJ
         wJcQaztVayFWYDforkCS7K9azvPgMd47FVHN/QU7eS5fsPHlwB/qwx5aRw9h9ujuaH6N
         F7mb00ev/4DqkAeTE3tL5tuMC8e/Mr5HAl4Say136U8fcLkK2XO+w2y79oK3SfGXucoq
         TXQje2n+0CpATVDymQA8AdqQ16poUSQe1VFCKD80eHPF8rlRrLpjhCvU1JmdHH4s9enV
         1jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492330; x=1693097130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiaXJj0k6MyiMU1PMvQA9CUDFVjljfiUN/JbuRuq1Dc=;
        b=Tif7tIXe2CPDMH7KO+WCunBW+wf+q2531twAvzyc/IurK3+DVLS/f6r0oCGspMKh3a
         9M7DU+8GRNWOhBGcSebss2Ng5iWx/RJb0fiqkCJLhfmCNWBTgLDmhD4GeFZDK2MVjRmo
         LWeEx8KZzwkhLm+kt1E1wGrVPPFeS5low4XzxdvphwbcjlXtwZGlyHnDLqom2tNjm+h6
         jqmIi6b/D6owrIj90lTkj9hOMSoP+EaxtAQSgwdugl7qguW+O8RQD6DCyZj+g2kAY5YO
         IYFt/xneFUydwAp8ehbXk6vXv9Ioa02a8WA2/R7hUjrekNsgAxrzbI8OiSSNrw7cbUbh
         uXxg==
X-Gm-Message-State: AOJu0YxgplPKEBBcMoVEJ5f0V/GizyMoA4lOZhDpe3Gz0M8SuEa7d+RC
	KRV556XkzyJYOOkOeYyUjOTz1VPyPKPm4R/K3rVnqsTb
X-Google-Smtp-Source: AGHT+IGpuviT5f8bchhEBp6jh9HTym40Wa4W/rjV4hopJ4v4FzdD3oR612xeEYuTNRu+ljEkKoCjcA==
X-Received: by 2002:a17:90a:4963:b0:269:86ce:c3b5 with SMTP id c90-20020a17090a496300b0026986cec3b5mr1601170pjh.44.1692492329731;
        Sat, 19 Aug 2023 17:45:29 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:29 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/16] Staging: rtl8192e: Rename variable pTS in function RxReorderIndicatePacket()
Date: Sat, 19 Aug 2023 17:47:42 -0700
Message-ID: <20230820004744.278022-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pTS in function RxReorderIndicatePacket() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 58 ++++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4907468ddaa5..e97debe6a7d2 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -554,7 +554,7 @@ void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
 
 static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 				    struct rtllib_rxb *prxb,
-				    struct rx_ts_record *pTS, u16 SeqNum)
+				    struct rx_ts_record *ts, u16 SeqNum)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct rx_reorder_entry *pReorderEntry = NULL;
@@ -565,21 +565,21 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 	unsigned long flags;
 
 	netdev_dbg(ieee->dev,
-		   "%s(): Seq is %d, pTS->rx_indicate_seq is %d, WinSize is %d\n",
-		   __func__, SeqNum, pTS->rx_indicate_seq, WinSize);
+		   "%s(): Seq is %d, ts->rx_indicate_seq is %d, WinSize is %d\n",
+		   __func__, SeqNum, ts->rx_indicate_seq, WinSize);
 
 	spin_lock_irqsave(&(ieee->reorder_spinlock), flags);
 
-	WinEnd = (pTS->rx_indicate_seq + WinSize - 1) % 4096;
+	WinEnd = (ts->rx_indicate_seq + WinSize - 1) % 4096;
 	/* Rx Reorder initialize condition.*/
-	if (pTS->rx_indicate_seq == 0xffff)
-		pTS->rx_indicate_seq = SeqNum;
+	if (ts->rx_indicate_seq == 0xffff)
+		ts->rx_indicate_seq = SeqNum;
 
 	/* Drop out the packet which SeqNum is smaller than WinStart */
-	if (SN_LESS(SeqNum, pTS->rx_indicate_seq)) {
+	if (SN_LESS(SeqNum, ts->rx_indicate_seq)) {
 		netdev_dbg(ieee->dev,
 			   "Packet Drop! IndicateSeq: %d, NewSeq: %d\n",
-			   pTS->rx_indicate_seq, SeqNum);
+			   ts->rx_indicate_seq, SeqNum);
 		ht_info->rx_reorder_drop_counter++;
 		{
 			int i;
@@ -597,18 +597,18 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 	 * 1. Incoming SeqNum is equal to WinStart =>Window shift 1
 	 * 2. Incoming SeqNum is larger than the WinEnd => Window shift N
 	 */
-	if (SN_EQUAL(SeqNum, pTS->rx_indicate_seq)) {
-		pTS->rx_indicate_seq = (pTS->rx_indicate_seq + 1) % 4096;
+	if (SN_EQUAL(SeqNum, ts->rx_indicate_seq)) {
+		ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) % 4096;
 		bMatchWinStart = true;
 	} else if (SN_LESS(WinEnd, SeqNum)) {
 		if (SeqNum >= (WinSize - 1))
-			pTS->rx_indicate_seq = SeqNum + 1 - WinSize;
+			ts->rx_indicate_seq = SeqNum + 1 - WinSize;
 		else
-			pTS->rx_indicate_seq = 4095 -
+			ts->rx_indicate_seq = 4095 -
 					     (WinSize - (SeqNum + 1)) + 1;
 		netdev_dbg(ieee->dev,
 			   "Window Shift! IndicateSeq: %d, NewSeq: %d\n",
-			   pTS->rx_indicate_seq, SeqNum);
+			   ts->rx_indicate_seq, SeqNum);
 	}
 
 	/* Indication process.
@@ -625,7 +625,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 		/* Current packet is going to be indicated.*/
 		netdev_dbg(ieee->dev,
 			   "Packets indication! IndicateSeq: %d, NewSeq: %d\n",
-			   pTS->rx_indicate_seq, SeqNum);
+			   ts->rx_indicate_seq, SeqNum);
 		ieee->prxbIndicateArray[0] = prxb;
 		index = 1;
 	} else {
@@ -642,12 +642,12 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 			pReorderEntry->SeqNum = SeqNum;
 			pReorderEntry->prxb = prxb;
 
-			if (!AddReorderEntry(pTS, pReorderEntry)) {
+			if (!AddReorderEntry(ts, pReorderEntry)) {
 				int i;
 
 				netdev_dbg(ieee->dev,
 					   "%s(): Duplicate packet is dropped. IndicateSeq: %d, NewSeq: %d\n",
-					   __func__, pTS->rx_indicate_seq,
+					   __func__, ts->rx_indicate_seq,
 					   SeqNum);
 				list_add_tail(&pReorderEntry->List,
 					      &ieee->RxReorder_Unused_List);
@@ -659,7 +659,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 			} else {
 				netdev_dbg(ieee->dev,
 					   "Pkt insert into struct buffer. IndicateSeq: %d, NewSeq: %d\n",
-					   pTS->rx_indicate_seq, SeqNum);
+					   ts->rx_indicate_seq, SeqNum);
 			}
 		} else {
 			/* Packets are dropped if there are not enough reorder
@@ -682,16 +682,16 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 	}
 
 	/* Check if there is any packet need indicate.*/
-	while (!list_empty(&pTS->rx_pending_pkt_list)) {
+	while (!list_empty(&ts->rx_pending_pkt_list)) {
 		netdev_dbg(ieee->dev, "%s(): start RREORDER indicate\n",
 			   __func__);
 
 		pReorderEntry = (struct rx_reorder_entry *)
-					list_entry(pTS->rx_pending_pkt_list.prev,
+					list_entry(ts->rx_pending_pkt_list.prev,
 						   struct rx_reorder_entry,
 						   List);
-		if (SN_LESS(pReorderEntry->SeqNum, pTS->rx_indicate_seq) ||
-		    SN_EQUAL(pReorderEntry->SeqNum, pTS->rx_indicate_seq)) {
+		if (SN_LESS(pReorderEntry->SeqNum, ts->rx_indicate_seq) ||
+		    SN_EQUAL(pReorderEntry->SeqNum, ts->rx_indicate_seq)) {
 			/* This protect struct buffer from overflow. */
 			if (index >= REORDER_WIN_SIZE) {
 				netdev_err(ieee->dev,
@@ -703,8 +703,8 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 
 			list_del_init(&pReorderEntry->List);
 
-			if (SN_EQUAL(pReorderEntry->SeqNum, pTS->rx_indicate_seq))
-				pTS->rx_indicate_seq = (pTS->rx_indicate_seq + 1) %
+			if (SN_EQUAL(pReorderEntry->SeqNum, ts->rx_indicate_seq))
+				ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) %
 						     4096;
 
 			ieee->prxbIndicateArray[index] = pReorderEntry->prxb;
@@ -724,9 +724,9 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 	 * Rx buffering.
 	 */
 	if (index > 0) {
-		if (timer_pending(&pTS->rx_pkt_pending_timer))
-			del_timer_sync(&pTS->rx_pkt_pending_timer);
-		pTS->rx_timeout_indicate_seq = 0xffff;
+		if (timer_pending(&ts->rx_pkt_pending_timer))
+			del_timer_sync(&ts->rx_pkt_pending_timer);
+		ts->rx_timeout_indicate_seq = 0xffff;
 
 		if (index > REORDER_WIN_SIZE) {
 			netdev_err(ieee->dev,
@@ -740,10 +740,10 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 		bPktInBuf = false;
 	}
 
-	if (bPktInBuf && pTS->rx_timeout_indicate_seq == 0xffff) {
+	if (bPktInBuf && ts->rx_timeout_indicate_seq == 0xffff) {
 		netdev_dbg(ieee->dev, "%s(): SET rx timeout timer\n", __func__);
-		pTS->rx_timeout_indicate_seq = pTS->rx_indicate_seq;
-		mod_timer(&pTS->rx_pkt_pending_timer, jiffies +
+		ts->rx_timeout_indicate_seq = ts->rx_indicate_seq;
+		mod_timer(&ts->rx_pkt_pending_timer, jiffies +
 			  msecs_to_jiffies(ht_info->rx_reorder_pending_time));
 	}
 	spin_unlock_irqrestore(&(ieee->reorder_spinlock), flags);
-- 
2.41.0

