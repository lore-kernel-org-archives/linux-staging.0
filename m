Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED16FAA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToiZLw4R"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5221bd8f62eso992225a12.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043212; x=1698648012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAg5aOPrhHSpwz3YYSAWUDYY5nI8Lv/rAsYemdyOjfQ=;
        b=ToiZLw4Rr51HYZFfMajLpDwKEPSHGNoGdlpwXv9eFzhbfjyJz59q7aib9CVXFiY249
         fw1Q7NGOAbmwtGu0DRFEluUrRfa9kng58vyFsZe7EOarELAlQAyhWDcSIXrz1vkhLRKz
         Il85MYUaVE/vWV/k59RjO5Manntg6l0SznB2wr9GnLefjOHDxxKKIxJYbdXMotTnb/y3
         fL4GI5nFB9Luk8bv5wzO4LTSyrARzAykj83WX/pUI1IOtqFj2NfhSc2LgD11xPehIwlK
         Qco0SGj3zIZH/iJ3dJ6UaPg25YvBAbqFltkx/yIkd+uuwiRU3dvny6tX8qjfZ/UwS8+b
         BNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043212; x=1698648012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAg5aOPrhHSpwz3YYSAWUDYY5nI8Lv/rAsYemdyOjfQ=;
        b=TolJpeqfM6wIYwsjSK4GyEtMaRyO0Dd93Iv3aDIbhnHC1dQ5gaEFrpDWR4KggXMK0l
         DKmcn1paffaef3GykU5NtIaR1dgOvNCJKV2LY5AlRQ1OETcA6IEn5QpxwS42nDFPc/be
         dPuW0VlFPzs/jHBHilMTQuCTyDwYuTBZSGGb/7PnEUJZY3BY6bhB9UeGq9/roAU0yf7p
         oVT28924om0LuQ9KsmAxJjn9cECHrVsFDCfDS/fkFw1rLa0lZO0c7K0suEadkbY6R62R
         VJcI4UG3zm21ewLDTp6c/2AhYqPXaw/CfK92V937667cHsObfVa0c25W1QunS/c6dygI
         LMdA==
X-Gm-Message-State: AOJu0Yy+FK5DACyw+p7Q4fpj3tfuQDbQHt/Y1Le5dmP78KOF6PjiPKUT
	ev7fQC50SztnB4tVUhyn2wQ=
X-Google-Smtp-Source: AGHT+IFHOEYzDi5J8//nYm81RM+jNIwzQ45UxSrIvCWXnqmy6JN1axrcPrq+KLj+1Y3gt+WyYtr6lw==
X-Received: by 2002:a05:6402:e8b:b0:540:488:dfd8 with SMTP id h11-20020a0564020e8b00b005400488dfd8mr4258103eda.4.1698043212567;
        Sun, 22 Oct 2023 23:40:12 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id dm28-20020a05640222dc00b0053def18ee8bsm5766997edb.20.2023.10.22.23.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:40:12 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:40:10 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] staging: rtl8192e: Replace union tspec_body including
 embedded struct
Message-ID: <be3e7cc62c2cdce652c24d3d3dbf7651b6ca71bc.1698042685.git.philipp.g.hortmann@gmail.com>
References: <cover.1698042685.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698042685.git.philipp.g.hortmann@gmail.com>

Replace union tspec_body including embedded struct with embedded union as
it has only one element. This will increase readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c |  2 +-
 drivers/staging/rtl8192e/rtl819x_Qos.h    |  6 ------
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 14 +++++++-------
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 93b566482149..f01fb7131c7e 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -474,7 +474,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 	ba->dialog_token++;
 	ba->ba_param_set.field.amsdu_support = 0;
 	ba->ba_param_set.field.ba_policy = policy;
-	ba->ba_param_set.field.tid = ts->TsCommonInfo.TSpec.f.ts_info.field.ucTSID;
+	ba->ba_param_set.field.tid = ts->TsCommonInfo.TSpec.field.ucTSID;
 	ba->ba_param_set.field.buffer_size = 32;
 	ba->ba_timeout_value = 0;
 	ba->ba_start_seq_ctrl.field.seq_num = (ts->TxCurSeq + 3) % 4096;
diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index ac321952f7b3..73fdf6aaed67 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -14,12 +14,6 @@ union qos_tsinfo {
 	} field;
 };
 
-union tspec_body {
-	struct {
-		union qos_tsinfo ts_info;
-	} f;
-};
-
 struct octet_string {
 	u8 *Octet;
 	u16 Length;
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index a9770592a8c9..ed77763bb1fc 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -20,7 +20,7 @@ enum tr_select {
 struct ts_common_info {
 	struct list_head		List;
 	u8				addr[ETH_ALEN];
-	union tspec_body TSpec;
+	union qos_tsinfo TSpec;
 	union qos_tclas TClass[TCLAS_NUM];
 	u8				TClasProc;
 	u8				TClasNum;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 879e169539c8..969418031f5f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -94,7 +94,7 @@ static void TsAddBaProcess(struct timer_list *t)
 static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
 {
 	eth_zero_addr(pTsCommonInfo->addr);
-	memset(&pTsCommonInfo->TSpec, 0, sizeof(union tspec_body));
+	memset(&pTsCommonInfo->TSpec, 0, sizeof(union qos_tsinfo));
 	memset(&pTsCommonInfo->TClass, 0, sizeof(union qos_tclas) * TCLAS_NUM);
 	pTsCommonInfo->TClasProc = 0;
 	pTsCommonInfo->TClasNum = 0;
@@ -201,8 +201,8 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 			continue;
 		list_for_each_entry(pRet, psearch_list, List) {
 			if (memcmp(pRet->addr, addr, 6) == 0 &&
-			    pRet->TSpec.f.ts_info.field.ucTSID == TID &&
-			    pRet->TSpec.f.ts_info.field.ucDirection == dir)
+			    pRet->TSpec.field.ucTSID == TID &&
+			    pRet->TSpec.field.ucDirection == dir)
 				break;
 		}
 		if (&pRet->List  != psearch_list)
@@ -215,7 +215,7 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 }
 
 static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
-			union tspec_body *pTSPEC, union qos_tclas *pTCLAS,
+			union qos_tsinfo *pTSPEC, union qos_tclas *pTCLAS,
 			u8 TCLAS_Num, u8 TCLAS_Proc)
 {
 	u8	count;
@@ -227,7 +227,7 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
 
 	if (pTSPEC)
 		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
-			sizeof(union tspec_body));
+			sizeof(union qos_tsinfo));
 
 	for (count = 0; count < TCLAS_Num; count++)
 		memcpy((u8 *)(&(pTsCommonInfo->TClass[count])),
@@ -241,8 +241,8 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	   u8 *addr, u8 TID, enum tr_select TxRxSelect, bool bAddNewTs)
 {
 	u8	UP = 0;
-	union tspec_body TSpec;
-	union qos_tsinfo *ts_info = &TSpec.f.ts_info;
+	union qos_tsinfo TSpec;
+	union qos_tsinfo *ts_info = &TSpec;
 	struct list_head *pUnusedList;
 	struct list_head *pAddmitList;
 	enum direction_value Dir;
-- 
2.42.0

