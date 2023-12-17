Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E84B132
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 23:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="XYKclKBc"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35f56f06142so24836215ab.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 15:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702857325; x=1703462125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlIlq7rrvboEhaW2FAIKDo9AZsxFYdYIP5zRDMCBPuc=;
        b=XYKclKBcuQacCsvPUAz1ccZZirNB1FwirxSexpiu+gvtpNPKRZBHbCV8d2Psk7CaGa
         nnFpoC8egsJWP3CtqjNbd+nWqAQruEvKvaSd0FixfjxWV1D5kaa2e/RGG0N4CEywCXcp
         IOe45hXhxv5wAUb5+xHePokBbRfciRDSVSEea1WaNnFWQsF2In+AcUuKkSaRlueWeAHf
         8CmVtUlP8bDfYqTTFI3RDBfXgF7+IkU2bzaEVOmVshPqkj4ss7hH4IOwrCm9bhlfj3NW
         TX0titVlE2Cp9RXPvsCk6zIUpr/KCyYxysMVlrF2hZ2FJgSDsd+OFhfKMdoxwhjLqmNq
         28sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702857325; x=1703462125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlIlq7rrvboEhaW2FAIKDo9AZsxFYdYIP5zRDMCBPuc=;
        b=n6xCZa3q8FUhbFiAgi2cPReX9X7mv8OSqjdsE7tUsQCoqYCIAmyCk44zP0wV2O2quU
         baff3OY8H9GpmEaKILftSQN5kdnrDyyxIecLjo/JisFZS+4btqbp9gYv0g6JPnFbzGqj
         UfxvHajsGj5RrwtKuKvtr3mG4OUYXNBVGcuBR0I1VTQbR4Psolwyo5N1W2tRH1gi7xRC
         voHFhg1hWgQ6AvGoeAMvxnNRvoVj7HJI+9EpzkRv7QK8LNpbwL98Zs9PABRG+qIKACyG
         OPvLdr1wIx2AgLhlv6UUCshhFUdmaEmx/LXPYUG3iOH/p7Pul3yoSKsjN0HXSdAPcue5
         dPwQ==
X-Gm-Message-State: AOJu0YzNZHNiYy4BdmB84WVJ+2RDArjxv1CKyw6pwjXMxOR5HF2DSamL
	wiQCoKHlEDDphZ0nFMKeAJ9p1g==
X-Google-Smtp-Source: AGHT+IGjV+FP//5kKSDOp3LMi7b3ZkUoCSpDUFLiW2Dbmec94LzKeDbbpeXD4QlwM7/d7TeBkW+bJw==
X-Received: by 2002:a05:6e02:1baa:b0:35f:a8fb:e6ad with SMTP id n10-20020a056e021baa00b0035fa8fbe6admr4077531ili.53.1702857325084;
        Sun, 17 Dec 2023 15:55:25 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm9036176pjy.10.2023.12.17.15.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:55:24 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/6] Staging: rtl8192e: Rename array variable TxTsRecord
Date: Sun, 17 Dec 2023 15:55:16 -0800
Message-Id: <20231217235520.30377-3-tdavies@darkphysics.net>
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

Rename array variable TxTsRecord to tx_ts_records to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 401b9efb25aa..cdbda65b4d50 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -523,7 +523,7 @@ void rtllib_tx_ba_inact_timeout(struct timer_list *t)
 	struct tx_ts_record *ts = from_timer(ts, t,
 					      tx_admitted_ba_record.timer);
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
-				     TxTsRecord[ts->num]);
+				     tx_ts_records[ts->num]);
 	tx_ts_delete_ba(ieee, ts);
 	rtllib_send_DELBA(ieee, ts->ts_common_info.addr,
 			  &ts->tx_admitted_ba_record, TX_DIR,
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index d23d35d5dce1..489261831462 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -85,7 +85,7 @@ static void TsAddBaProcess(struct timer_list *t)
 	struct tx_ts_record *ts = from_timer(ts, t, ts_add_ba_timer);
 	u8 num = ts->num;
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
-				     TxTsRecord[num]);
+				     tx_ts_records[num]);
 
 	rtllib_ts_init_add_ba(ieee, ts, BA_POLICY_IMMEDIATE, false);
 	netdev_dbg(ieee->dev, "%s(): ADDBA Req is started\n", __func__);
@@ -119,7 +119,7 @@ static void ResetRxTsEntry(struct rx_ts_record *ts)
 
 void rtllib_ts_init(struct rtllib_device *ieee)
 {
-	struct tx_ts_record *pTxTS  = ieee->TxTsRecord;
+	struct tx_ts_record *pTxTS  = ieee->tx_ts_records;
 	struct rx_ts_record *rxts  = ieee->rx_ts_records;
 	struct rx_reorder_entry *pRxReorderEntry = ieee->RxReorderEntry;
 	u8				count = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e7d4ed9eb899..d8da772b0f39 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1225,7 +1225,7 @@ struct rtllib_device {
 	struct list_head		Tx_TS_Admit_List;
 	struct list_head		Tx_TS_Pending_List;
 	struct list_head		Tx_TS_Unused_List;
-	struct tx_ts_record TxTsRecord[TOTAL_TS_NUM];
+	struct tx_ts_record tx_ts_records[TOTAL_TS_NUM];
 	struct list_head		Rx_TS_Admit_List;
 	struct list_head		Rx_TS_Pending_List;
 	struct list_head		Rx_TS_Unused_List;
-- 
2.39.2

