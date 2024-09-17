Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC6158A13
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551130; cv=none; b=Al+8G4dSEaZ/OLXgNJRTAP6jY2aArxxEJw89wYidBH3Bh4KJtlYwhN2xFpWj/fv77jZTyNi3PkxTIq6YNfo0WcGgTwYRmvsfGZvWOfu+NHiG5fTv+P/D7wzo4qy520m1977r2iz+EXBHsEH6zywY+GKOj2yWIPN71X+Pf1skSA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551130; c=relaxed/simple;
	bh=FsvVG7s50X+ytswfAcPQQ1Q+R0b3F3TkCKt25TGq3/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uVccjAyZ1/p+ICsxMHih3MHBXmqiCWlyfRuCU8uxNoGdIZx1E7he0bmunjELuYrptx2YEB1NyilSJKbNNlqdBwgw7RLuA0ZoSF1azxMB2VaBSpjjQEtUmFO3S57cSkQA7x0dxYbUKLSC7XTtH4+HM0H888P45IuwNanr39uh53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Q4nQ+vbh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Q4nQ+vbh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20536dcc6e9so29348215ad.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551127; x=1727155927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6i9Xtd5Jmry75nRJO1mTVFWPGfZ1jgJ3uQyB9QmMbQg=;
        b=Q4nQ+vbhATOwPERcig8KMQ6fogqaw6cPRuEWirsAk9sf39ytsxZtnrRFGs0KUSL9Zp
         ++rtiAHr7fBuZ2u0Uc8G+qht7FTXaL7h5LnT7Is3FTSHSLMdEcSHLULSzpZYVcWtPmH2
         dWjf36zOOx9P2M7D8i+hrWdZfLuyqw6qCKP6atdm8kz6LgWiglc8NjgTPr64WIAXH1rt
         TCOvdgIbmO87/w+/7N/FAnvlTFTMCFT73L7SnEOsyQdYS3OOJJG1ziCXD5xGTh5HanNN
         K3smmPvWNFknvQR93l/7iDDSfFb6OFCezgDe72yUkkFI8rNJaoMC736u5DG4sTWNOlMZ
         W7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551127; x=1727155927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i9Xtd5Jmry75nRJO1mTVFWPGfZ1jgJ3uQyB9QmMbQg=;
        b=kPoCIeSwmha2Z/lQ47weVwBjZYz0yyE5DPEsENSlzF0na9hp/GapcLHwbtgf3mwhl3
         NCSpqo/STv6cSEkpS7VI1r6J8Cd/CP2BAc2E4Il9ehveiwryRRz8aIjbrKDwT0p9ZqB6
         NZQXPaqT5quVSant69YS6uhDorq1Cmu/t7ht3BlZ7LTEx5Sx4xUcu+bj2qXvIBM5GrUk
         Jcu8XjdOc2KU0AEeiCdn6XDKOEc8GEijIOAO8BfQHfQHfLnRFsfZrKIyiHO3RYq7w/CD
         M8/IPm6LH8y1hPNEGXgorSvEqkuWaOQlbrS+vyAWMD5M3E6WvflQvW3fnrxabNvhO3CB
         76xA==
X-Gm-Message-State: AOJu0Yy/RohE5QgrCja+/qdcfkqYGSHfoRs+/soVEnv9B42mfoZFKW4q
	yB6JjyaemtZbAV4gwyNgSs176wYIPVRnO7GOxmuLptGGEji0zOBuZd8nkRU4AWg=
X-Google-Smtp-Source: AGHT+IEVl9XCVV/EDxTzSGvNLFsw2+ukL89kw5qYphDBjuaGpF/3AbmLYRhpfYB/A/kvDncLmc1dmQ==
X-Received: by 2002:a17:902:da86:b0:207:6e51:41af with SMTP id d9443c01a7336-20782be4b5cmr211092595ad.43.1726551127106;
        Mon, 16 Sep 2024 22:32:07 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:06 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/18] Staging: rtl8192e: Rename variable Tx_TS_Unused_List
Date: Mon, 16 Sep 2024 22:31:50 -0700
Message-Id: <20240917053152.575553-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Tx_TS_Unused_List to tx_ts_unused_list
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 0b906d618a90..ecbe3bd67a0c 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -126,7 +126,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 
 	INIT_LIST_HEAD(&ieee->tx_ts_admit_list);
 	INIT_LIST_HEAD(&ieee->tx_ts_pending_list);
-	INIT_LIST_HEAD(&ieee->Tx_TS_Unused_List);
+	INIT_LIST_HEAD(&ieee->tx_ts_unused_list);
 
 	for (count = 0; count < TOTAL_TS_NUM; count++) {
 		pTxTS->num = count;
@@ -139,7 +139,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 
 		ResetTxTsEntry(pTxTS);
 		list_add_tail(&pTxTS->ts_common_info.list,
-				&ieee->Tx_TS_Unused_List);
+				&ieee->tx_ts_unused_list);
 		pTxTS++;
 	}
 
@@ -275,7 +275,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	}
 
 	pUnusedList = (tx_rx_select == TX_DIR) ?
-				(&ieee->Tx_TS_Unused_List) :
+				(&ieee->tx_ts_unused_list) :
 				(&ieee->Rx_TS_Unused_List);
 
 	pAddmitList = (tx_rx_select == TX_DIR) ?
@@ -370,7 +370,7 @@ void remove_peer_ts(struct rtllib_device *ieee, u8 *addr)
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, ts, TX_DIR);
 			list_del_init(&ts->list);
-			list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
+			list_add_tail(&ts->list, &ieee->tx_ts_unused_list);
 		}
 	}
 
@@ -380,7 +380,7 @@ void remove_peer_ts(struct rtllib_device *ieee, u8 *addr)
 				    "====>remove Tx_TS_admin_list\n");
 			RemoveTsEntry(ieee, ts, TX_DIR);
 			list_del_init(&ts->list);
-			list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
+			list_add_tail(&ts->list, &ieee->tx_ts_unused_list);
 		}
 	}
 
@@ -409,13 +409,13 @@ void remove_all_ts(struct rtllib_device *ieee)
 	list_for_each_entry_safe(ts, pTmpTS, &ieee->tx_ts_pending_list, list) {
 		RemoveTsEntry(ieee, ts, TX_DIR);
 		list_del_init(&ts->list);
-		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
+		list_add_tail(&ts->list, &ieee->tx_ts_unused_list);
 	}
 
 	list_for_each_entry_safe(ts, pTmpTS, &ieee->tx_ts_admit_list, list) {
 		RemoveTsEntry(ieee, ts, TX_DIR);
 		list_del_init(&ts->list);
-		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
+		list_add_tail(&ts->list, &ieee->tx_ts_unused_list);
 	}
 
 	list_for_each_entry_safe(ts, pTmpTS, &ieee->rx_ts_pending_list, list) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ff6b59874fed..074cd837c708 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1196,7 +1196,7 @@ struct rtllib_device {
 
 	struct list_head		tx_ts_admit_list;
 	struct list_head		tx_ts_pending_list;
-	struct list_head		Tx_TS_Unused_List;
+	struct list_head		tx_ts_unused_list;
 	struct tx_ts_record tx_ts_records[TOTAL_TS_NUM];
 	struct list_head		Rx_TS_Admit_List;
 	struct list_head		rx_ts_pending_list;
-- 
2.30.2

