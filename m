Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F07E566B
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="V9AHamG2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cf7a8ab047so27686855ad.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063383; x=1701668183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t+OYK182Y2YaDvus2aSQWjkkPId6oQnfxA8XGPoAC0=;
        b=V9AHamG2jxAJjlQ+Gqc3Z/3A3DHlaV2jf0HzEYZ5Zyt3j1vrW4pOU3u11P2u8L9By9
         tZ9NEsmVPkaJdqu+bIyNFN6Jv96i5icMqcGq883b/VHX+sIRgT3qa9lRVC3lil72QiGH
         R9v9TE+VQpM12dS5mvW7GXaMsO1IU2LPWm/ck49HDmSlrTSUM8+21zDJuRhQ7yfBgPf/
         ZhmYJu348SxRs5QM6N7hK+IY1biR105JGCTY+1FfFBzYSd81G/Lr5nukV1oLpBim/g4s
         d6lx+69lp5CD1b3mpplsiGQ9/4Wx9T81o3za8VtE/t3x3gPUMcT8obV+1U5u4zjKjZzm
         HqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063383; x=1701668183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t+OYK182Y2YaDvus2aSQWjkkPId6oQnfxA8XGPoAC0=;
        b=FoojZtlWlKpv8xYYL9LZEkfRkjKavpJ/fe8hdZYWsx8Mc3UYpJuGjMEe4ArzZC37S+
         ycYQhEmTxG7BHJs0RsDXJ7iu4QG87F2N/FymT4d1tqAyDYx/ZcfGTJeOMn2wXtt/iTam
         gJxH/essTJKP2biU+iv5ao2zDOXTbULvSi2d9/WAf7xb9u5xmbM4+illEG/dqB7+JtZJ
         f6OyoS0qCrE4hQYl3Ubi8NlboAOSXCmLyROeDHOCLHua0kYSnAIevHPMbIN+aXVq90rH
         VjC8xmy6KZYXMYny3aXDwjFTUnj1hJsq9rNUd7zEzssIVz5nR7f2eDxMpAr4rt1WUHH4
         OlLg==
X-Gm-Message-State: AOJu0Yz9R5256cwH7VPrkMY4oH154CKQa5yLpmaJivy1FjkFUw7pXLFn
	qd/K9r5KOFK6Scj8aah/D60+kA==
X-Google-Smtp-Source: AGHT+IE57QNdCEPZbFQdAjj4hB6nPCp4P/v3sfj6qw9fmnuQ8lkMcFbQ3JqOoxc7Wvl2rp47jrRATw==
X-Received: by 2002:a17:902:a9c5:b0:1cf:b55d:a11d with SMTP id b5-20020a170902a9c500b001cfb55da11dmr4353516plr.24.1701063383569;
        Sun, 26 Nov 2023 21:36:23 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:23 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/15] Staging: rtl8192e: Rename variable TxPendingBARecord
Date: Sun, 26 Nov 2023 21:42:56 -0800
Message-ID: <20231127054305.148276-7-tdavies@darkphysics.net>
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

Rename variable TxPendingBARecord to tx_pending_ba_record to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index db529559592b..51deab720e76 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -26,7 +26,7 @@ static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *ba
 static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *ts)
 {
 	struct ba_record *admitted_ba = &ts->tx_admitted_ba_record;
-	struct ba_record *pending_ba = &ts->TxPendingBARecord;
+	struct ba_record *pending_ba = &ts->tx_pending_ba_record;
 	u8 send_del_ba = false;
 
 	if (pending_ba->b_valid) {
@@ -345,7 +345,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	}
 
 	ts->add_ba_req_in_progress = false;
-	pending_ba = &ts->TxPendingBARecord;
+	pending_ba = &ts->tx_pending_ba_record;
 	pAdmittedBA = &ts->tx_admitted_ba_record;
 
 	if (pAdmittedBA->b_valid) {
@@ -464,7 +464,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 			   u8 policy, u8	overwrite_pending)
 {
-	struct ba_record *ba = &ts->TxPendingBARecord;
+	struct ba_record *ba = &ts->tx_pending_ba_record;
 
 	if (ba->b_valid && !overwrite_pending)
 		return;
@@ -496,7 +496,7 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 			rtllib_send_DELBA(ieee, pTsCommonInfo->addr,
 					  (ts->tx_admitted_ba_record.b_valid) ?
 					 (&ts->tx_admitted_ba_record) :
-					(&ts->TxPendingBARecord),
+					(&ts->tx_pending_ba_record),
 					 TxRxSelect, DELBA_REASON_END_BA);
 	} else if (TxRxSelect == RX_DIR) {
 		struct rx_ts_record *ts =
@@ -511,11 +511,11 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 void rtllib_ba_setup_timeout(struct timer_list *t)
 {
 	struct tx_ts_record *ts = from_timer(ts, t,
-					      TxPendingBARecord.timer);
+					      tx_pending_ba_record.timer);
 
 	ts->add_ba_req_in_progress = false;
 	ts->add_ba_req_delayed = true;
-	ts->TxPendingBARecord.b_valid = false;
+	ts->tx_pending_ba_record.b_valid = false;
 }
 
 void rtllib_tx_ba_inact_timeout(struct timer_list *t)
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 40b0ed4fefaf..fdd5f1a2e835 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -25,7 +25,7 @@ struct ts_common_info {
 struct tx_ts_record {
 	struct ts_common_info TsCommonInfo;
 	u16				TxCurSeq;
-	struct ba_record TxPendingBARecord;
+	struct ba_record tx_pending_ba_record;
 	struct ba_record tx_admitted_ba_record;
 	u8				add_ba_req_in_progress;
 	u8				add_ba_req_delayed;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 0e59a3155c4a..ed14e8e1ed93 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -106,7 +106,7 @@ static void ResetTxTsEntry(struct tx_ts_record *ts)
 	ts->using_ba = false;
 	ts->disable_add_ba = false;
 	rtllib_reset_ba_entry(&ts->tx_admitted_ba_record);
-	rtllib_reset_ba_entry(&ts->TxPendingBARecord);
+	rtllib_reset_ba_entry(&ts->tx_pending_ba_record);
 }
 
 static void ResetRxTsEntry(struct rx_ts_record *ts)
@@ -132,7 +132,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 		pTxTS->num = count;
 		timer_setup(&pTxTS->TsAddBaTimer, TsAddBaProcess, 0);
 
-		timer_setup(&pTxTS->TxPendingBARecord.timer, rtllib_ba_setup_timeout,
+		timer_setup(&pTxTS->tx_pending_ba_record.timer, rtllib_ba_setup_timeout,
 			    0);
 		timer_setup(&pTxTS->tx_admitted_ba_record.timer,
 			    rtllib_tx_ba_inact_timeout, 0);
-- 
2.39.2

