Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CEF7E
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 04:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lQa2hFfy"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9a5adc8cefso3110308276.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 21:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1697258396; x=1697863196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3p4Okgx4XgnfPEk0qlyDp2kdSWTE4Yw2JPS7XRRWXKU=;
        b=lQa2hFfyfqkBWmRq84W1990DIMZyCJ/90uk13jZNtDW/37EXhNKizrejmsCVlBayca
         PxIW7lfNCeppRL91AO9tU5t6/rBdJCP3VV7C4haYm2+1Aw27UqafqSkCUfoYqz/ptKLC
         d2kUsyu/qT0cWsTZt+6nwVImYdWCAt4wxhxH+6tudMDBbEap0zLrjaFFsLy1vH5IBjsW
         X0SaefsGCqNklG+IyXb4P14IlV2qzXSQVFSU5483dO70poW32fZ1GCiCv08FRqPdnSOA
         rfK6iHf2pHkIW7w5o4W4ng4tMzd7xH5vb5vd1vRNbuzVO3p3Sl1tzJZh0DLwEx35oOx9
         4k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697258396; x=1697863196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3p4Okgx4XgnfPEk0qlyDp2kdSWTE4Yw2JPS7XRRWXKU=;
        b=uR+MuPq6RoAmiIXycQ8Xt3KhYxzb2WLcf0a8a9em0DH9pTNUvbQdu6W4Zh0oJ8nT/M
         Zt3m9ShAfVs7jLqnvaOENb4pHgXaxBYcNjiC/bdEkUdyxgkK6lCYKjEFOuRDlORLHa/k
         V8mr+ctq37EMRDXwEOtUyqVPTEwKRdjBaM0mudDTkSqsi5YLd4FBvzek6olzoNdf7Jmv
         afFp6fAxpH/SA/lqW7+5Hl0bSR9LU6hpgfLFnAmeI4Awjp59QO/9aRHr4+omoaX34zHs
         921gw6NiSt6kMgJ25vo+VqPsz5mzPmcY+KXKgXup+DGXL+2wovrh88NYunRLgOWq3rWd
         KOZQ==
X-Gm-Message-State: AOJu0YyBGouLog+DDb0MCZYGVPooz2jvU2Qm8c+I2mnbvV+AK3veGBnS
	+Y93pzDJEBS9vdtY61ATZLMP4g==
X-Google-Smtp-Source: AGHT+IGOm4VbjmfX1M+04K7SHGsvYD4Af/ZHbQ1I2dUB4WYp6pgyJp2GGtzKt+QJxwbyW/FYiNDBlg==
X-Received: by 2002:a25:c702:0:b0:d9a:c946:bb47 with SMTP id w2-20020a25c702000000b00d9ac946bb47mr6573250ybe.5.1697258396095;
        Fri, 13 Oct 2023 21:39:56 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y6-20020aa78046000000b006934350c3absm14271926pfm.109.2023.10.13.21.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 21:39:55 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/4] Staging: rtl8192e: Rename variable TSInfo
Date: Fri, 13 Oct 2023 21:44:33 -0700
Message-ID: <20231014044435.11947-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231014044435.11947-1-tdavies@darkphysics.net>
References: <20231014044435.11947-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TSInfo to ts_info to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_Qos.h    | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index a2a0573c3444..a5165fe88217 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -474,7 +474,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
 	ba->dialog_token++;
 	ba->ba_param_set.field.amsdu_support = 0;
 	ba->ba_param_set.field.ba_policy = policy;
-	ba->ba_param_set.field.tid = pTS->TsCommonInfo.TSpec.f.TSInfo.field.ucTSID;
+	ba->ba_param_set.field.tid = pTS->TsCommonInfo.TSpec.f.ts_info.field.ucTSID;
 	ba->ba_param_set.field.buffer_size = 32;
 	ba->ba_timeout_value = 0;
 	ba->ba_start_seq_ctrl.field.seq_num = (pTS->TxCurSeq + 3) % 4096;
diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 0499711ea2bf..37677366c397 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -60,7 +60,7 @@ union tspec_body {
 	u8		charData[55];
 
 	struct {
-		union qos_tsinfo TSInfo;
+		union qos_tsinfo ts_info;
 		u16	NominalMSDUsize;
 		u16	MaxMSDUsize;
 		u32	MinServiceItv;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index eaa2a82558f1..16d5164e860d 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -201,8 +201,8 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 			continue;
 		list_for_each_entry(pRet, psearch_list, List) {
 			if (memcmp(pRet->addr, addr, 6) == 0 &&
-			    pRet->TSpec.f.TSInfo.field.ucTSID == TID &&
-			    pRet->TSpec.f.TSInfo.field.ucDirection == dir)
+			    pRet->TSpec.f.ts_info.field.ucTSID == TID &&
+			    pRet->TSpec.f.ts_info.field.ucDirection == dir)
 				break;
 		}
 		if (&pRet->List  != psearch_list)
@@ -242,7 +242,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 {
 	u8	UP = 0;
 	union tspec_body TSpec;
-	union qos_tsinfo *ts_info = &TSpec.f.TSInfo;
+	union qos_tsinfo *ts_info = &TSpec.f.ts_info;
 	struct list_head *pUnusedList;
 	struct list_head *pAddmitList;
 	enum direction_value Dir;
-- 
2.39.2

