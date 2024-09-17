Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C21156250
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551126; cv=none; b=IB9SsHXH5ucrkQbHg3/46hHSTHmK97B4LYDJnTtiPDv8/9WsFTkyhWvh3FGXmkDjnU3hT/gGTahUnfUtGCVAE95T6YzDroQkurnKIIEC+vlLCfTx2VN7nrfBtIAH5UTCgLn7q9QOYjOB9SmnCxDDtuveMUhNRZvvECi0m+9aqFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551126; c=relaxed/simple;
	bh=1ZpytcgFRiHzmjOy4J7+IdFtedWgkkFzLBa2U01mfyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fz54lsEd1noUhfebNkSnv9QUb3I1c4Htr7VBeXuXDhUUCobHRObzC4aXzE50cyw1n0x3klxi4qRdPvyfk6uYY3lTXU9cECuJYbQbaSp1cLVH1zTzBZ6JQYsVmmOT+KRcDynxyJ97ispd2WCWf96q/vdYxmZJRHgJU6CSG/iSN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=IrTtCes5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="IrTtCes5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3074671a12.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551124; x=1727155924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUB+JecfnYMNvmsR8/Vhr8yi67xfZjHyzFp0HKa0zfo=;
        b=IrTtCes5yc6L6mf242GaVjZNgsFrWCfg+k+CneHTJbOALNrsnUkJeg6IhjXi7NVNfA
         SlpXhhYPwMHHsPD/+ZtJW9G3IzN2Lo0lwQpg0c5yG6B6veu2LdOrwMfxrzK6Qn/B/BGv
         uGTa5PNZujodiKGoE3pG52yRT5qt78gbKenlx+ipZ0rmUzndaMTAXKi9+vWMRKNlN/kz
         NQPePdpTj4F+RrkS4qB2jIS89UPJG0ykDCUj4rPJGfeaB/XW0z5sb1ZeE2rJljCPmHlZ
         8oNE6px+fPutDWImK4tdhgDuKne72aCo8G01sWuh6auv7VLcp9L2do7n+PlhwXt+SjRv
         vxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551124; x=1727155924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUB+JecfnYMNvmsR8/Vhr8yi67xfZjHyzFp0HKa0zfo=;
        b=eJc8CjLyy0ml/tTTP+e3EiDN0xlO2vIXpBpWI6mnnW1XGJNsi3Ft7QR93b3IZcTWrV
         dE0tbcrpL6Twcsdo097D+WqAER2B7jL6ZZzLIys3PIZSFhe3k6H21h1lhqyp+VIb4liM
         O5PhjT46y7bdzunH2gZiSwzoPz57owmhM1HEIilnOYRIdk3Jba2bD4L+jT+J2EMkXFbU
         5piO1liV8vRp+WkFdFfihlujC0c2PQG4mf8iFHUFXOToUu96mdI+zzjBw4uCH3UAV3oe
         Na8JKb9MTkU68+jG35n9TI5LKULAeQZqBrEIwrU+g9zpdEknY8l+B+c7lCokxSqcIM5e
         7Seg==
X-Gm-Message-State: AOJu0YxDCqkctElh78PCbcDahxiAd6brHa7K3P8kRu2EeTM+1Tg/Jrke
	VnSfpS60bbFXlKO50faDkaAEGo7t8WU6weILWUuHbE81W8hCWEFlrqO838THMm8=
X-Google-Smtp-Source: AGHT+IFXwqocyNmAaCmmv/b4UvuRab091Ae92HvkA1VA+sLkrdbpYsUsYApZGFVAr35aYhQMT52yrg==
X-Received: by 2002:a05:6a20:d80d:b0:1cf:215f:1055 with SMTP id adf61e73a8af0-1cf76238568mr25753544637.48.1726551123623;
        Mon, 16 Sep 2024 22:32:03 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:03 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/18] Staging: rtl8192e: Rename variable Rx_TS_Pending_List
Date: Mon, 16 Sep 2024 22:31:45 -0700
Message-Id: <20240917053152.575553-12-tdavies@darkphysics.net>
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

Rename variable Rx_TS_Pending_List to rx_ts_pending_list
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 89092cd434de..efadb2b778b1 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -144,7 +144,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 	}
 
 	INIT_LIST_HEAD(&ieee->Rx_TS_Admit_List);
-	INIT_LIST_HEAD(&ieee->Rx_TS_Pending_List);
+	INIT_LIST_HEAD(&ieee->rx_ts_pending_list);
 	INIT_LIST_HEAD(&ieee->Rx_TS_Unused_List);
 	for (count = 0; count < TOTAL_TS_NUM; count++) {
 		rxts->num = count;
@@ -384,7 +384,7 @@ void remove_peer_ts(struct rtllib_device *ieee, u8 *addr)
 		}
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Pending_List, list) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->rx_ts_pending_list, list) {
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, ts, RX_DIR);
 			list_del_init(&ts->list);
@@ -418,7 +418,7 @@ void remove_all_ts(struct rtllib_device *ieee)
 		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Pending_List, list) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->rx_ts_pending_list, list) {
 		RemoveTsEntry(ieee, ts, RX_DIR);
 		list_del_init(&ts->list);
 		list_add_tail(&ts->list, &ieee->Rx_TS_Unused_List);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b0f01d940efa..c43d5b8298f1 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1199,7 +1199,7 @@ struct rtllib_device {
 	struct list_head		Tx_TS_Unused_List;
 	struct tx_ts_record tx_ts_records[TOTAL_TS_NUM];
 	struct list_head		Rx_TS_Admit_List;
-	struct list_head		Rx_TS_Pending_List;
+	struct list_head		rx_ts_pending_list;
 	struct list_head		Rx_TS_Unused_List;
 	struct rx_ts_record rx_ts_records[TOTAL_TS_NUM];
 	struct rx_reorder_entry RxReorderEntry[128];
-- 
2.30.2

