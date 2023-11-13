Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4AF23771
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZEybye6L"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ce3084c2d1so6522745ad.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 11:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1699905173; x=1700509973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRT/m2rbtV9N0AV2BHjKfpwydERRwEVgVz4ChgsF6I8=;
        b=ZEybye6Lm+6RT/WVkHElHooQ1BT8IZCF6ujrTTvoFgKfg527Mw/9ZZndm0XUVPXaNU
         L7Ux5M/RkfPLjU7LY0A8zdRUiDF4N22PlqiQc63EbwyAiaJfGa5NXCh01DAXPnH+a9Gp
         LLCh+YcxiQk/lCY0HMcnwNvrdwg2PTa/m1a6GayGe1CchwpcI+ljHBSDWn/JJ5FygbaV
         EKqFFhJ2As3xyGHH3xbVbUFODodytutOYgGA5PqOekPM0TrQz1zVT1VjwB/G/2P2xAkW
         jq03gbFTNFfNgEloiVyr6MzLRapnsR/UlHURLV6fsPZk8f4RakexVZKTtC7tMMQl0O5K
         GWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905173; x=1700509973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRT/m2rbtV9N0AV2BHjKfpwydERRwEVgVz4ChgsF6I8=;
        b=gJuOe6A8PFa5PJpaQvyihJwIAocsKx387QgqjfPJYmQgPMsekAHSZFnTk7t2gHMYZ+
         iLOid5ueavnX0FxRD13rDjWMp6gENECyuLjPkhAuBG2bhBcMd+zGlVDWHr+oOyj7mjAF
         DcU7t+4vcSmLvmb5ZalYrIQu18pqdM+Bka84M3qhIT9f6YXYCgQwtLOPqEMY1HOGX/I1
         7VDep9zbVKJvD2jxPC7bVSpEqSmztwe7qcZKpISMogm7HwnkRbD1AzEqqWPS2a6QkjZU
         8KhL7Nvs5zoliBjGxp2niZU3f2meqqq4N7QSTvzqNxyWWkkh/S9j9TWLXHp8QF8TeU/6
         /UNA==
X-Gm-Message-State: AOJu0YzIdgcN3PQksicTanJo3Zfws3/xKwYcYOi+jhX2ONdYUGLm4WkW
	h1q2N379VPPQZBQrb+0RceObG16MgZESKEQliNA=
X-Google-Smtp-Source: AGHT+IGW3Z5l4zDxvfih2rnr1N48hs2NYZ61EU9CiqxCqmlP10DkK+9ilW39OfiS+HfIfPt1brGVTw==
X-Received: by 2002:a17:903:2308:b0:1ca:29f:4b06 with SMTP id d8-20020a170903230800b001ca029f4b06mr282353plh.2.1699905172824;
        Mon, 13 Nov 2023 11:52:52 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm4395815plz.79.2023.11.13.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:52:52 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 4/7] Staging: rtl8192e: Rename variable bAddBaReqDelayed
Date: Mon, 13 Nov 2023 11:59:07 -0800
Message-ID: <20231113195910.8423-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113195910.8423-1-tdavies@darkphysics.net>
References: <20231113195910.8423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bAddBaReqDelayed to add_ba_req_delayed to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 drivers/staging/rtl8192e/rtl819x_TS.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 4d51c745e7f2..631c857c508f 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -368,7 +368,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	if (*status_code == ADDBA_STATUS_SUCCESS) {
 		if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
-			ts->bAddBaReqDelayed = true;
+			ts->add_ba_req_delayed = true;
 			deactivate_ba_entry(ieee, pAdmittedBA);
 			reason_code = DELBA_REASON_END_BA;
 			goto OnADDBARsp_Reject;
@@ -381,7 +381,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		deactivate_ba_entry(ieee, pAdmittedBA);
 		activate_ba_entry(pAdmittedBA, *pBaTimeoutVal);
 	} else {
-		ts->bAddBaReqDelayed = true;
+		ts->add_ba_req_delayed = true;
 		ts->bDisable_AddBa = true;
 		reason_code = DELBA_REASON_END_BA;
 		goto OnADDBARsp_Reject;
@@ -454,7 +454,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 
 		pTxTs->bUsingBa = false;
 		pTxTs->add_ba_req_in_progress = false;
-		pTxTs->bAddBaReqDelayed = false;
+		pTxTs->add_ba_req_delayed = false;
 		del_timer_sync(&pTxTs->TsAddBaTimer);
 		tx_ts_delete_ba(ieee, pTxTs);
 	}
@@ -514,7 +514,7 @@ void rtllib_ba_setup_timeout(struct timer_list *t)
 					      TxPendingBARecord.timer);
 
 	pTxTs->add_ba_req_in_progress = false;
-	pTxTs->bAddBaReqDelayed = true;
+	pTxTs->add_ba_req_delayed = true;
 	pTxTs->TxPendingBARecord.b_valid = false;
 }
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 276a50f98781..0bf73b625708 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -28,7 +28,7 @@ struct tx_ts_record {
 	struct ba_record TxPendingBARecord;
 	struct ba_record TxAdmittedBARecord;
 	u8				add_ba_req_in_progress;
-	u8				bAddBaReqDelayed;
+	u8				add_ba_req_delayed;
 	u8				bUsingBa;
 	u8				bDisable_AddBa;
 	struct timer_list		TsAddBaTimer;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 62414e7b8879..3a1bb512ca69 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -102,7 +102,7 @@ static void ResetTxTsEntry(struct tx_ts_record *ts)
 	ResetTsCommonInfo(&ts->TsCommonInfo);
 	ts->TxCurSeq = 0;
 	ts->add_ba_req_in_progress = false;
-	ts->bAddBaReqDelayed = false;
+	ts->add_ba_req_delayed = false;
 	ts->bUsingBa = false;
 	ts->bDisable_AddBa = false;
 	rtllib_reset_ba_entry(&ts->TxAdmittedBARecord);
@@ -436,7 +436,7 @@ void TsStartAddBaProcess(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
 	if (pTxTS->add_ba_req_in_progress == false) {
 		pTxTS->add_ba_req_in_progress = true;
 
-		if (pTxTS->bAddBaReqDelayed) {
+		if (pTxTS->add_ba_req_delayed) {
 			netdev_dbg(ieee->dev, "Start ADDBA after 60 sec!!\n");
 			mod_timer(&pTxTS->TsAddBaTimer, jiffies +
 				  msecs_to_jiffies(TS_ADDBA_DELAY));
-- 
2.39.2

