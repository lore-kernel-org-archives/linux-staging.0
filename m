Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15640178399
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823599; cv=none; b=WMh2DGkQh8xdKmVIzrhNYZbJTAoynsSST+5GAS03JaMJjFgyaaHb/utOxVeovdbqPANm9UcxUGZTPf9QvEVf6JVT9e4kEr74x83p88LE0EfQSOdnWHuhfXsriQKVfxVRQA0+jNEqum0nHWwxduJszyCD5+Ulp7xx5pCeYIr/WuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823599; c=relaxed/simple;
	bh=xScMRekyrWd3mUiQ7E0L3/MfqmlH5JFDA/Bn1zYmYeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i7ZSA+rie7EUHoOlgMbG9m4lIVg1SUaNGJI5C7AaZmkfBY7PK7IWxt279lnCwK3AalFopS4tms0jo3dTptpaPdVmJeLuZnNkSqB+uxRX42KWsp8BkmlBl+fmFCJLIvBLG4eNNA8DE3zSPUQPLr+Gwx02Evm/2D3yeXT6LemyE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=eCjzh+8E; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="eCjzh+8E"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7d4fbe62bf5so2335572a12.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823597; x=1726428397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwXZUX4Z+vcVxrrhy8ieqDIViAshGkVvuwYrqufxEM4=;
        b=eCjzh+8ElpJgo20lT7T85iB9V0GAGsPfsesk2tnkAMKmmeIuq7KI4TvhPi6fvXTMC9
         CWtov0bFXlgCDLKavElMJ5UWm4eutjwumWbBjvIr034rS4Od0EUFc8s5SYpz1tUHfYK9
         lD0zFytHaaCXI5RqRJNNnQdprqKzKEVFqb7Y43BH6OFZsmaO6jyZakAzqfg4/Hi/jC1W
         mUifax+IVd2r21ls3DcZmWbZ9VgJl/yoPdlFH32TeKaxmBGYDKfivkoLReofM4BEQDEK
         MI3nB3xjDp9p2pSF9SP3Tx70bEopII/0JrpXnLR22cJOwaa/ltZW3WL+7okTwII9f9rn
         7AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823597; x=1726428397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwXZUX4Z+vcVxrrhy8ieqDIViAshGkVvuwYrqufxEM4=;
        b=Bnbj90/4pTZbBNGY4eY5sgxfmkIEvqXMS0YlInVbptDYY9uqgnjcOXMcXMtmwWXNmr
         nN2MC1m62kE5tjYTUl4jNWgntrCyCI9RKgfsqRDA5rX5RiJ+OHMj1NctYScyVIeA2+jS
         AmkhmYj1MQhUGyDQ+qIb8wO5IsvPxhtFvLtt/QPV1Szzs7stVtiCD+l4kRTtU+BM3kYe
         zKhYCtoAkcYjzOyP2dibOJs93saskEFoJGBN+SN2qhknsxq/n9KcR8I2EqLeyk2QVCBA
         MapV00HBBxOAW5v1huoBgy7DtHOVC/FT0HAp+DG7albpWFC8uzd7Tga0xLAGO2Aed6PL
         ro9w==
X-Gm-Message-State: AOJu0YzpnYg6LeKR32wHyCInTQ879kGeWoJ+6YMiJyw3Cy+VuPTOF32A
	/255v200Arrx+y/KK42sxB3IVOfjAXr73u0hKN4pMrTy2KPFPS0bM7RS0QJOKPw=
X-Google-Smtp-Source: AGHT+IFqoRo27AOGROybqNX+oapincC/8GNKCPEbxqvSBUXbpCpbzrJ22xGg5K4nn2C0xHkwKlFINQ==
X-Received: by 2002:a17:902:ce81:b0:1fb:1afb:b864 with SMTP id d9443c01a7336-206f049d07amr77361585ad.5.1725823597113;
        Sun, 08 Sep 2024 12:26:37 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:36 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/16] Staging: rtl8192e: Rename variable pReorderEntry
Date: Sun,  8 Sep 2024 12:26:18 -0700
Message-Id: <20240908192633.94144-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pReorderEntry to reorder_entry
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 20 +++++------
 drivers/staging/rtl8192e/rtllib_rx.c      | 44 +++++++++++------------
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index ed6a488bc7ac..abdae7e36588 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -14,7 +14,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
 						  rx_ts_records[ts->num]);
 
-	struct rx_reorder_entry *pReorderEntry = NULL;
+	struct rx_reorder_entry *reorder_entry = NULL;
 
 	unsigned long flags = 0;
 	u8 index = 0;
@@ -23,31 +23,31 @@ static void RxPktPendingTimeout(struct timer_list *t)
 	spin_lock_irqsave(&(ieee->reorder_spinlock), flags);
 	if (ts->rx_timeout_indicate_seq != 0xffff) {
 		while (!list_empty(&ts->rx_pending_pkt_list)) {
-			pReorderEntry = (struct rx_reorder_entry *)
+			reorder_entry = (struct rx_reorder_entry *)
 					list_entry(ts->rx_pending_pkt_list.prev,
 					struct rx_reorder_entry, list);
 			if (index == 0)
-				ts->rx_indicate_seq = pReorderEntry->SeqNum;
+				ts->rx_indicate_seq = reorder_entry->SeqNum;
 
-			if (SN_LESS(pReorderEntry->SeqNum,
+			if (SN_LESS(reorder_entry->SeqNum,
 				    ts->rx_indicate_seq) ||
-			    SN_EQUAL(pReorderEntry->SeqNum,
+			    SN_EQUAL(reorder_entry->SeqNum,
 				     ts->rx_indicate_seq)) {
-				list_del_init(&pReorderEntry->list);
+				list_del_init(&reorder_entry->list);
 
-				if (SN_EQUAL(pReorderEntry->SeqNum,
+				if (SN_EQUAL(reorder_entry->SeqNum,
 				    ts->rx_indicate_seq))
 					ts->rx_indicate_seq =
 					      (ts->rx_indicate_seq + 1) % 4096;
 
 				netdev_dbg(ieee->dev,
 					   "%s(): Indicate SeqNum: %d\n",
-					   __func__, pReorderEntry->SeqNum);
+					   __func__, reorder_entry->SeqNum);
 				ieee->stats_IndicateArray[index] =
-							 pReorderEntry->prxb;
+							 reorder_entry->prxb;
 				index++;
 
-				list_add_tail(&pReorderEntry->list,
+				list_add_tail(&reorder_entry->list,
 					      &ieee->RxReorder_Unused_List);
 			} else {
 				pkt_in_buf = true;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d7d59761e0f4..cba4b244f808 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -403,26 +403,26 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 }
 
 static bool add_reorder_entry(struct rx_ts_record *ts,
-			      struct rx_reorder_entry *pReorderEntry)
+			      struct rx_reorder_entry *reorder_entry)
 {
 	struct list_head *list = &ts->rx_pending_pkt_list;
 
 	while (list->next != &ts->rx_pending_pkt_list) {
-		if (SN_LESS(pReorderEntry->SeqNum, ((struct rx_reorder_entry *)
+		if (SN_LESS(reorder_entry->SeqNum, ((struct rx_reorder_entry *)
 		    list_entry(list->next, struct rx_reorder_entry,
 		    list))->SeqNum))
 			list = list->next;
-		else if (SN_EQUAL(pReorderEntry->SeqNum,
+		else if (SN_EQUAL(reorder_entry->SeqNum,
 			((struct rx_reorder_entry *)list_entry(list->next,
 			struct rx_reorder_entry, list))->SeqNum))
 			return false;
 		else
 			break;
 	}
-	pReorderEntry->list.next = list->next;
-	pReorderEntry->list.next->prev = &pReorderEntry->list;
-	pReorderEntry->list.prev = list;
-	list->next = &pReorderEntry->list;
+	reorder_entry->list.next = list->next;
+	reorder_entry->list.next->prev = &reorder_entry->list;
+	reorder_entry->list.prev = list;
+	list->next = &reorder_entry->list;
 
 	return true;
 }
@@ -524,7 +524,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 				       struct rx_ts_record *ts, u16 SeqNum)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
-	struct rx_reorder_entry *pReorderEntry = NULL;
+	struct rx_reorder_entry *reorder_entry = NULL;
 	u8 win_size = ht_info->rx_reorder_win_size;
 	u16 win_end = 0;
 	u8 index = 0;
@@ -598,25 +598,25 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 	} else {
 		/* Current packet is going to be inserted into pending list.*/
 		if (!list_empty(&ieee->RxReorder_Unused_List)) {
-			pReorderEntry = (struct rx_reorder_entry *)
+			reorder_entry = (struct rx_reorder_entry *)
 					list_entry(ieee->RxReorder_Unused_List.next,
 					struct rx_reorder_entry, list);
-			list_del_init(&pReorderEntry->list);
+			list_del_init(&reorder_entry->list);
 
 			/* Make a reorder entry and insert
 			 * into a the packet list.
 			 */
-			pReorderEntry->SeqNum = SeqNum;
-			pReorderEntry->prxb = prxb;
+			reorder_entry->SeqNum = SeqNum;
+			reorder_entry->prxb = prxb;
 
-			if (!add_reorder_entry(ts, pReorderEntry)) {
+			if (!add_reorder_entry(ts, reorder_entry)) {
 				int i;
 
 				netdev_dbg(ieee->dev,
 					   "%s(): Duplicate packet is dropped. IndicateSeq: %d, NewSeq: %d\n",
 					   __func__, ts->rx_indicate_seq,
 					   SeqNum);
-				list_add_tail(&pReorderEntry->list,
+				list_add_tail(&reorder_entry->list,
 					      &ieee->RxReorder_Unused_List);
 
 				for (i = 0; i < prxb->nr_subframes; i++)
@@ -653,12 +653,12 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 		netdev_dbg(ieee->dev, "%s(): start RREORDER indicate\n",
 			   __func__);
 
-		pReorderEntry = (struct rx_reorder_entry *)
+		reorder_entry = (struct rx_reorder_entry *)
 					list_entry(ts->rx_pending_pkt_list.prev,
 						   struct rx_reorder_entry,
 						   list);
-		if (SN_LESS(pReorderEntry->SeqNum, ts->rx_indicate_seq) ||
-		    SN_EQUAL(pReorderEntry->SeqNum, ts->rx_indicate_seq)) {
+		if (SN_LESS(reorder_entry->SeqNum, ts->rx_indicate_seq) ||
+		    SN_EQUAL(reorder_entry->SeqNum, ts->rx_indicate_seq)) {
 			/* This protect struct buffer from overflow. */
 			if (index >= REORDER_WIN_SIZE) {
 				netdev_err(ieee->dev,
@@ -668,18 +668,18 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 				break;
 			}
 
-			list_del_init(&pReorderEntry->list);
+			list_del_init(&reorder_entry->list);
 
-			if (SN_EQUAL(pReorderEntry->SeqNum, ts->rx_indicate_seq))
+			if (SN_EQUAL(reorder_entry->SeqNum, ts->rx_indicate_seq))
 				ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) %
 						     4096;
 
-			ieee->prxb_indicate_array[index] = pReorderEntry->prxb;
+			ieee->prxb_indicate_array[index] = reorder_entry->prxb;
 			netdev_dbg(ieee->dev, "%s(): Indicate SeqNum %d!\n",
-				   __func__, pReorderEntry->SeqNum);
+				   __func__, reorder_entry->SeqNum);
 			index++;
 
-			list_add_tail(&pReorderEntry->list,
+			list_add_tail(&reorder_entry->list,
 				      &ieee->RxReorder_Unused_List);
 		} else {
 			pkt_in_buf = true;
-- 
2.30.2

