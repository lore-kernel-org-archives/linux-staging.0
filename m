Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F8E5663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="MJcibTAF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cfbce92362so7261535ad.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063386; x=1701668186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnWmbSD77bZFfBCr2C5cF8GBPNk3SBRZbqkEH4Q4DFY=;
        b=MJcibTAFaajc7htIt0elr3iwzDeWR/Ci16jSlfyPjtS8yC4ZVQGqc70+sMdL38A1VH
         tg0JvWxvgjrEcwbSVgEWaTbB/8klYxfZgHi6KA5r/2IxImJ4Qzt6IExl54ZH21DIl0HD
         FmTevhQm86N4o0kWdPmiDS6NHel2ZxR09Liiad5vYp+knzdJwO4kWU6oKi0bb3DnnziB
         iP7BbHX0/ufFk8Tl0uwrNvVQt0mrkMUp13qu0SK3FJcFwVJ3/zF0iM2O2sRaEAFfbQwz
         zqGasZ/V5ys/E9PKXWTRLNKtPeILBNW4hJAC78+eBpLZ5MbCxZlxFFAUewEgkIKHf30F
         qojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063386; x=1701668186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnWmbSD77bZFfBCr2C5cF8GBPNk3SBRZbqkEH4Q4DFY=;
        b=f84m4qRMMXyJp0ihlMk8QeSc2EW6t7PgpLJRuEiWMcu4OtbnXfv54+g0gTJsgBJ48B
         ftBqWwEgxT5TfPWdNWXrnT1RlE8CzY26pPAi+pFB6AL0jmzA7OPGZO781FxlTnIMCGVi
         UlKla0m0XffE1nH+nwqNmCzaRpg+a351rKSkECjPHN500Js/T6H2dJCuBfMwhApMzbZc
         j6n+O6FEKQh+aTDso22nIw2n/xJ7wg9eEKcndzpv2mix/wmZWyTiXVY8QalmNYWJHwud
         UKxgnSN8sAj7tBoK2X3RhRgw6/OBIM1eL3lQPSWFRgktfTpoiPCzZEY+7J88e2TS5S3o
         adsw==
X-Gm-Message-State: AOJu0Yzux7E+P5lnII3qzXxoGOgDAViPZ+BsXt3L3eQuCnF3p96bOgTW
	j0Dq4vRL6Q2lk4AAhdYOPhjHOw==
X-Google-Smtp-Source: AGHT+IEhKJ19eBREPey/YsreiDKMqly62ClQzzPUbIbQxPlO5yC8nHUg9ET24Ff1ZstcsMmqXStOVg==
X-Received: by 2002:a17:903:1245:b0:1cf:6675:b313 with SMTP id u5-20020a170903124500b001cf6675b313mr15105151plh.22.1701063386692;
        Sun, 26 Nov 2023 21:36:26 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:26 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/15] Staging: rtl8192e: Rename variable TxCurSeq
Date: Sun, 26 Nov 2023 21:42:59 -0800
Message-ID: <20231127054305.148276-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TxCurSeq to tx_cur_seq to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TS.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index d11cbe3bbb31..328947fc058c 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -477,7 +477,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 	ba->ba_param_set.field.tid = ts->TsCommonInfo.tspec.ucTSID;
 	ba->ba_param_set.field.buffer_size = 32;
 	ba->ba_timeout_value = 0;
-	ba->ba_start_seq_ctrl.field.seq_num = (ts->TxCurSeq + 3) % 4096;
+	ba->ba_start_seq_ctrl.field.seq_num = (ts->tx_cur_seq + 3) % 4096;
 
 	activate_ba_entry(ba, BA_SETUP_TIMEOUT);
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index fdd5f1a2e835..4ab712634b4b 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -24,7 +24,7 @@ struct ts_common_info {
 
 struct tx_ts_record {
 	struct ts_common_info TsCommonInfo;
-	u16				TxCurSeq;
+	u16				tx_cur_seq;
 	struct ba_record tx_pending_ba_record;
 	struct ba_record tx_admitted_ba_record;
 	u8				add_ba_req_in_progress;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 2e6b705437d9..e06e563ae718 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -100,7 +100,7 @@ static void ResetTsCommonInfo(struct ts_common_info *ts_common_info)
 static void ResetTxTsEntry(struct tx_ts_record *ts)
 {
 	ResetTsCommonInfo(&ts->TsCommonInfo);
-	ts->TxCurSeq = 0;
+	ts->tx_cur_seq = 0;
 	ts->add_ba_req_in_progress = false;
 	ts->add_ba_req_delayed = false;
 	ts->using_ba = false;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 51a8286abd18..92e5be85148e 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -306,7 +306,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			goto FORCED_AGG_SETTING;
 		} else if (!ts->using_ba) {
 			if (SN_LESS(ts->tx_admitted_ba_record.ba_start_seq_ctrl.field.seq_num,
-				    (ts->TxCurSeq + 1) % 4096))
+				    (ts->tx_cur_seq + 1) % 4096))
 				ts->using_ba = true;
 			else
 				goto FORCED_AGG_SETTING;
@@ -500,8 +500,8 @@ static u16 rtllib_query_seqnum(struct rtllib_device *ieee, struct sk_buff *skb,
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)(&ts), dst,
 			   skb->priority, TX_DIR, true))
 			return 0;
-		seqnum = ts->TxCurSeq;
-		ts->TxCurSeq = (ts->TxCurSeq + 1) % 4096;
+		seqnum = ts->tx_cur_seq;
+		ts->tx_cur_seq = (ts->tx_cur_seq + 1) % 4096;
 		return seqnum;
 	}
 	return 0;
-- 
2.39.2

