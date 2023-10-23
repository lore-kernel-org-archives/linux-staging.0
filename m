Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83C6FAA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T865NO1V"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9c6f0530929so66446266b.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043220; x=1698648020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TeDhj4M7bfk1ZuzV/MaUrRjjWL2B2L9H9sMD0IpBps=;
        b=T865NO1Vj7JvBweBYPHMJW+fAqPiQY/oFVcaN6hc8rJqRBmAh9g+pEobqOMPWwsuyE
         +GVIKwMWAVWPsc+dUBr34/RRcB8SyODJcTLwQEhFeQpAhDbRkIhHfd7yKuij7xEHypla
         f67vbk+YPu3gUTFuKIsWDe/xBYTlifg1XNY6zHYbAS3mj07+2+EzUbsMGPKOJzGi4RU/
         zkQjTa6y5qxrop5VLPoUGiyubGljAXjDdowdZCws4bUo+EyAjcFajL/9oFdUpMT+Y4yr
         YjyLxKzEVQSsba8aQ0WcGRe6GVgLgLLAwA2cKlFBNOE4pcnvPS0fSUhMh/UGfVrpH35q
         3QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043220; x=1698648020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TeDhj4M7bfk1ZuzV/MaUrRjjWL2B2L9H9sMD0IpBps=;
        b=BPu6HuFjM27rbTV1ssBcyhPQWkzNT4/r9nNu+5EE/iEA0PBILNQOTigA4oNk8mI+d2
         5eKlRskdSnPF6v1+iVXN2VW8kByopFVctXX0uvglKWa3+z7vLsrDmPbD0OZ6vtrr/VaY
         R9F4nb5LE5yCGKoS4TT8FJDFYo/rRucVvq8ncChVVg9rMcScR0QVIyYilWJLBsUEFAvN
         2HgGkNQKZUtyoGXm6MNelmrhum8J9kC4YZVD2KivQmx2cntpIb36CLSsBJb0vMielGhf
         hGOBgZ4n+2sX2hLioVe9nhWNptw/N5Xfo8Il8w1Y6DKtE2Uw/DQ29MTes8CE7vZdRFxp
         blPw==
X-Gm-Message-State: AOJu0Yytb5VIQtlyHZWY0UOebLXWEdH7pDQTCG5AoUuxGFoAs9vBS4tK
	IbfHfFQF1QtG72J+VpFtFXA=
X-Google-Smtp-Source: AGHT+IEVl5rNN4V55TPK/F5/vTw4pBk90mC64nnhAXlgmL+QPISSIUKWfCwD+kz26kb6HojEESAXrQ==
X-Received: by 2002:a17:906:225c:b0:9be:f78a:d438 with SMTP id 28-20020a170906225c00b009bef78ad438mr6701960ejr.5.1698043219752;
        Sun, 22 Oct 2023 23:40:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906279500b009c7558b39fasm6164323ejc.194.2023.10.22.23.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:40:19 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:40:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: rtl8192e: Replace union qos_tsinfo with
 embedded struct
Message-ID: <3bedc504ad678332e4ab2a3d99f2a94ab5aed03a.1698042685.git.philipp.g.hortmann@gmail.com>
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

Replace union qos_tsinfo with embedded struct as it has only one element.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c |  2 +-
 drivers/staging/rtl8192e/rtl819x_Qos.h    |  8 +++-----
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 18 +++++++++---------
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index f01fb7131c7e..4af8055d2489 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -474,7 +474,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 	ba->dialog_token++;
 	ba->ba_param_set.field.amsdu_support = 0;
 	ba->ba_param_set.field.ba_policy = policy;
-	ba->ba_param_set.field.tid = ts->TsCommonInfo.TSpec.field.ucTSID;
+	ba->ba_param_set.field.tid = ts->TsCommonInfo.TSpec.ucTSID;
 	ba->ba_param_set.field.buffer_size = 32;
 	ba->ba_timeout_value = 0;
 	ba->ba_start_seq_ctrl.field.seq_num = (ts->TxCurSeq + 3) % 4096;
diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 73fdf6aaed67..64a1e6aa501b 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -7,11 +7,9 @@
 #ifndef __INC_QOS_TYPE_H
 #define __INC_QOS_TYPE_H
 
-union qos_tsinfo {
-	struct {
-		u8		ucTSID:4;
-		u8		ucDirection:2;
-	} field;
+struct qos_tsinfo {
+	u8		ucTSID:4;
+	u8		ucDirection:2;
 };
 
 struct octet_string {
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index ed77763bb1fc..b63edb815902 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -20,7 +20,7 @@ enum tr_select {
 struct ts_common_info {
 	struct list_head		List;
 	u8				addr[ETH_ALEN];
-	union qos_tsinfo TSpec;
+	struct qos_tsinfo TSpec;
 	union qos_tclas TClass[TCLAS_NUM];
 	u8				TClasProc;
 	u8				TClasNum;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 969418031f5f..fbbe538f0632 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -94,7 +94,7 @@ static void TsAddBaProcess(struct timer_list *t)
 static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
 {
 	eth_zero_addr(pTsCommonInfo->addr);
-	memset(&pTsCommonInfo->TSpec, 0, sizeof(union qos_tsinfo));
+	memset(&pTsCommonInfo->TSpec, 0, sizeof(struct qos_tsinfo));
 	memset(&pTsCommonInfo->TClass, 0, sizeof(union qos_tclas) * TCLAS_NUM);
 	pTsCommonInfo->TClasProc = 0;
 	pTsCommonInfo->TClasNum = 0;
@@ -201,8 +201,8 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 			continue;
 		list_for_each_entry(pRet, psearch_list, List) {
 			if (memcmp(pRet->addr, addr, 6) == 0 &&
-			    pRet->TSpec.field.ucTSID == TID &&
-			    pRet->TSpec.field.ucDirection == dir)
+			    pRet->TSpec.ucTSID == TID &&
+			    pRet->TSpec.ucDirection == dir)
 				break;
 		}
 		if (&pRet->List  != psearch_list)
@@ -215,7 +215,7 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 }
 
 static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
-			union qos_tsinfo *pTSPEC, union qos_tclas *pTCLAS,
+			struct qos_tsinfo *pTSPEC, union qos_tclas *pTCLAS,
 			u8 TCLAS_Num, u8 TCLAS_Proc)
 {
 	u8	count;
@@ -227,7 +227,7 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
 
 	if (pTSPEC)
 		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
-			sizeof(union qos_tsinfo));
+			sizeof(struct qos_tsinfo));
 
 	for (count = 0; count < TCLAS_Num; count++)
 		memcpy((u8 *)(&(pTsCommonInfo->TClass[count])),
@@ -241,8 +241,8 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	   u8 *addr, u8 TID, enum tr_select TxRxSelect, bool bAddNewTs)
 {
 	u8	UP = 0;
-	union qos_tsinfo TSpec;
-	union qos_tsinfo *ts_info = &TSpec;
+	struct qos_tsinfo TSpec;
+	struct qos_tsinfo *ts_info = &TSpec;
 	struct list_head *pUnusedList;
 	struct list_head *pAddmitList;
 	enum direction_value Dir;
@@ -318,8 +318,8 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		netdev_dbg(ieee->dev,
 			   "to init current TS, UP:%d, Dir:%d, addr: %pM ppTs=%p\n",
 			   UP, Dir, addr, *ppTS);
-		ts_info->field.ucTSID = UP;
-		ts_info->field.ucDirection = Dir;
+		ts_info->ucTSID = UP;
+		ts_info->ucDirection = Dir;
 
 		MakeTSEntry(*ppTS, addr, &TSpec, NULL, 0, 0);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
-- 
2.42.0

