Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3209566C
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="E/nVA4VZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cfbda041f3so9183045ad.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063381; x=1701668181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSWu4uGFFfQhQmuUasXzTA2bl0qaMckYxBPrKB/bvN8=;
        b=E/nVA4VZCs0Mz3PX7C74ImjOe5OoR4zQKoDbO/wwQXQH71ESsLZkyFUiQE3fGSqkid
         TDG0yEzfkowxyNADMRwGu95kQ2aUszHID4rdaGte+tUyZhZJGTvUMEvPGyaYaHqQR7zy
         a1mnMsYrUTOj1JN8ew6yy/BLl6hEypA/8R/y5xwZGBmU9wwg1LAH/ubfbRBaAdfYhgU6
         65wXj5L9fnvKDnZOo1mrX92rT7L2qvkg0KzWyIMv3lKy0wVmGykHLZiVrDwORu88WT7y
         vQIBGUV+DPUeSQBf2rg78yaDHJatVKPh/h5J66e3DbZSxgNe4AeiiUpmHBR6y55WcWBc
         sTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063381; x=1701668181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSWu4uGFFfQhQmuUasXzTA2bl0qaMckYxBPrKB/bvN8=;
        b=s1+4kQCE6aCvaeYh9XRvCrvsVotpkB6fNlQYdu2Zwl58At3C0k8v2taUgC+441Pzlv
         2xKac7FFPTGITD5C6OHp3Gc4Up0qjM77UcsRcroUYfw/vQt9ONuJ5kRv9ongb5yt0LHT
         o078u6zimjC2tsvkUsLMLSrICn+bfxZ4w2rySa0WlZQouTvUtPIrv27SBuXMw8TOvjoM
         /8UdPokrJwhqKiDDfygrSzU0xZJq3cl0tP34pdGTd9hhHuhmu+RsrHVQw4r7B/9i3P2i
         SjlvtAZwtEFlqU3vqPDYndMMego21Q4NZNzmnUvmU0NFMYHljAtpbmpfQ02FAcBgCdoP
         rDaQ==
X-Gm-Message-State: AOJu0YyNren8COuCNykFup82ES8bPjoDDNl9n6tpzXkVb0x6Q1bSAiq+
	dI7PdPhTpd3wOp/Qd0XjTrPQqg+Sc0RFrQFHjhM=
X-Google-Smtp-Source: AGHT+IG9zsMtaxazmqVWmdOzqH/Oz69e+MfWSKGg/wU+gjSjEdOmvtli7gZHl/eLoW7O1VsLZFXmUQ==
X-Received: by 2002:a17:902:6947:b0:1cf:c2dc:1c1c with SMTP id k7-20020a170902694700b001cfc2dc1c1cmr5407619plt.29.1701063381031;
        Sun, 26 Nov 2023 21:36:21 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:20 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/15] Staging: rtl8192e: Rename variable TSpec
Date: Sun, 26 Nov 2023 21:42:54 -0800
Message-ID: <20231127054305.148276-5-tdavies@darkphysics.net>
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

Rename variable TSpec to tspec to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c |  2 +-
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 06aaae68aa6a..bf8d42668990 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -474,7 +474,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 	ba->dialog_token++;
 	ba->ba_param_set.field.amsdu_support = 0;
 	ba->ba_param_set.field.ba_policy = policy;
-	ba->ba_param_set.field.tid = ts->TsCommonInfo.TSpec.ucTSID;
+	ba->ba_param_set.field.tid = ts->TsCommonInfo.tspec.ucTSID;
 	ba->ba_param_set.field.buffer_size = 32;
 	ba->ba_timeout_value = 0;
 	ba->ba_start_seq_ctrl.field.seq_num = (ts->TxCurSeq + 3) % 4096;
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 742f575ea637..f2bd53268e3a 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -19,7 +19,7 @@ enum tr_select {
 struct ts_common_info {
 	struct list_head		List;
 	u8				addr[ETH_ALEN];
-	struct qos_tsinfo TSpec;
+	struct qos_tsinfo tspec;
 };
 
 struct tx_ts_record {
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 01d077bf0155..039f070aadd1 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -94,7 +94,7 @@ static void TsAddBaProcess(struct timer_list *t)
 static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
 {
 	eth_zero_addr(pTsCommonInfo->addr);
-	memset(&pTsCommonInfo->TSpec, 0, sizeof(struct qos_tsinfo));
+	memset(&pTsCommonInfo->tspec, 0, sizeof(struct qos_tsinfo));
 }
 
 static void ResetTxTsEntry(struct tx_ts_record *ts)
@@ -198,8 +198,8 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 			continue;
 		list_for_each_entry(pRet, psearch_list, List) {
 			if (memcmp(pRet->addr, addr, 6) == 0 &&
-			    pRet->TSpec.ucTSID == TID &&
-			    pRet->TSpec.ucDirection == dir)
+			    pRet->tspec.ucTSID == TID &&
+			    pRet->tspec.ucDirection == dir)
 				break;
 		}
 		if (&pRet->List  != psearch_list)
@@ -220,7 +220,7 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
 	memcpy(pTsCommonInfo->addr, addr, 6);
 
 	if (pTSPEC)
-		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
+		memcpy((u8 *)(&(pTsCommonInfo->tspec)), (u8 *)pTSPEC,
 			sizeof(struct qos_tsinfo));
 }
 
@@ -228,8 +228,8 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	   u8 *addr, u8 TID, enum tr_select TxRxSelect, bool bAddNewTs)
 {
 	u8	UP = 0;
-	struct qos_tsinfo TSpec;
-	struct qos_tsinfo *ts_info = &TSpec;
+	struct qos_tsinfo tspec;
+	struct qos_tsinfo *ts_info = &tspec;
 	struct list_head *pUnusedList;
 	struct list_head *pAddmitList;
 	enum direction_value Dir;
@@ -308,7 +308,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		ts_info->ucTSID = UP;
 		ts_info->ucDirection = Dir;
 
-		MakeTSEntry(*ppTS, addr, &TSpec);
+		MakeTSEntry(*ppTS, addr, &tspec);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
 
 		return true;
-- 
2.39.2

