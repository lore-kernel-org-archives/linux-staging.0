Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FDA1494AD
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551128; cv=none; b=ZPnvDcKUF1DMrA54ceNVaz77j9ILAxH6H8b/FGkbtErlyvwFpW5LUyGQgaNgWg3k4RFBVPb0lCEkoXZseOxbbcCZAX3s+gROQB+IyRUYsYZBi2OMBd/4iESfpMVeZjd12xyg150AeR0rgTTtXc0a73o9hHbAN7dCok2XaP1yy1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551128; c=relaxed/simple;
	bh=vgE8gng8p5gjnoJi7u04bQWwGLfibxjizyrtPFsAySo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QqQ5v+3G42dZFM6BmmHd/Ub9HJ7AhQ8XDgsqb62FvcudEOLpPiZBeZFsoYPQtMDQpJVF1IdF9SVyseMBarfIur5kfLPMnJCf2fEcRkuY9rAk0I+voGajCtQVSmVruYt4Rc1KQhlOtBG3zNaQq8bvZ7P+RPDEo4ilddyd2Vn/wQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=SON475+d; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SON475+d"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71971d2099cso535414b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551126; x=1727155926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUc8RkI1FPSHCZ6I8f+u2bX+PWnQZjFpuKFwB7QBvYw=;
        b=SON475+dp/ogSN4aSRxnG5yBNcGv2/l0SbsVwPBtrp3XZalsLeJPuBO3hLBDIZjmKh
         r/UC+DoB1EbPXlUt10sDCjseVbIlZmNYg5+jhXQdaG5JUYWG0Av1Oiu7cvL0GM/gdMhl
         NSq5dvINN/Ti2nkownqRbUqLVap+Q70cPNWEx3YZOC1j56F9lZ3p52v6ZBJX7lI2zYoR
         LmZ+MnAReLOKy1iulcvqj2+5RqFAASadUeyKj/aYH+uMA4V3EuqmeJpTxBtsV2CGvhcf
         AimuftzzF4fqDnfjDQz5svQo41sLuS8nREEOvACXbzchbZ1VTQZU/56ZjkqJiA/Et/ST
         g5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551126; x=1727155926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUc8RkI1FPSHCZ6I8f+u2bX+PWnQZjFpuKFwB7QBvYw=;
        b=hRe9jh+/XJmIwP5k+6y2C1vmBxwy5/tfnzmojKIx82PN42ZYAiI6wf2SwrfBdN511B
         xacoe4fj4hM6Zy+cpwEb5OxVmyj618x8FwbUl1ecQCh/fHt2Q1uCWhDs+TJgu8brf4aP
         NQr9ySS18ETADUSRcEaYweW1Iu3gSF9UEnMw4zEcecYbiMPtkefM90d9jezyCTdr91Ty
         EF/C+S4sBvqsHdTK4OPI1Ah9YsiwKRKwtqoF/NV9xgcnMFu5HDYs1tRa6uHEM7Rrvx3A
         vjlJK63/C6sIi/LO4jcL9UxdrgAij8vQ9LLU1+alaNtLRhLlSjTmlc8GY28PVoxCoZhs
         ik2A==
X-Gm-Message-State: AOJu0YwM17RlCjW3NN23Gv0T3yhZR7xoSNsVDTKp0+IgzghaTtw1XZoo
	7SF3vT37A3fDTosq5hksOSptYxQMJwMXZZu7IDXZ98TW2QfZx3VKJRxAYfUeFcM=
X-Google-Smtp-Source: AGHT+IHoaqWaQ+deAiUVjkPdOieSjbc4vo8dgefLXeDO11W1V5KwLZxOksMjYxWEhWY+eBmAeZEmJg==
X-Received: by 2002:a05:6a21:2d8c:b0:1cf:374f:40c9 with SMTP id adf61e73a8af0-1d112e8737emr24378350637.38.1726551126429;
        Mon, 16 Sep 2024 22:32:06 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:06 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/18] Staging: rtl8192e: Rename variable Tx_TS_Pending_List
Date: Mon, 16 Sep 2024 22:31:49 -0700
Message-Id: <20240917053152.575553-16-tdavies@darkphysics.net>
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

Rename variable Tx_TS_Pending_List to tx_ts_pending_list
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index e87d2926f47c..0b906d618a90 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -125,7 +125,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 	u8				count = 0;
 
 	INIT_LIST_HEAD(&ieee->tx_ts_admit_list);
-	INIT_LIST_HEAD(&ieee->Tx_TS_Pending_List);
+	INIT_LIST_HEAD(&ieee->tx_ts_pending_list);
 	INIT_LIST_HEAD(&ieee->Tx_TS_Unused_List);
 
 	for (count = 0; count < TOTAL_TS_NUM; count++) {
@@ -366,7 +366,7 @@ void remove_peer_ts(struct rtllib_device *ieee, u8 *addr)
 
 	netdev_info(ieee->dev, "===========>%s, %pM\n", __func__, addr);
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Pending_List, list) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->tx_ts_pending_list, list) {
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, ts, TX_DIR);
 			list_del_init(&ts->list);
@@ -406,7 +406,7 @@ void remove_all_ts(struct rtllib_device *ieee)
 {
 	struct ts_common_info *ts, *pTmpTS;
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Pending_List, list) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->tx_ts_pending_list, list) {
 		RemoveTsEntry(ieee, ts, TX_DIR);
 		list_del_init(&ts->list);
 		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 3544054b78fc..ff6b59874fed 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1195,7 +1195,7 @@ struct rtllib_device {
 	atomic_t	atm_swbw;
 
 	struct list_head		tx_ts_admit_list;
-	struct list_head		Tx_TS_Pending_List;
+	struct list_head		tx_ts_pending_list;
 	struct list_head		Tx_TS_Unused_List;
 	struct tx_ts_record tx_ts_records[TOTAL_TS_NUM];
 	struct list_head		Rx_TS_Admit_List;
-- 
2.30.2

