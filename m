Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C134411
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:31 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68fe2470d81so415127b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266490; x=1695871290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjH6iOpaG+K0VeRik6vkPL3+XconrKzqUHw5TsZ+3TU=;
        b=lNb90W7ebA3+5/vZdaLjHttjms9pJD/eN/JaMUEgffVCtdDuOuhvOXns67jlOWxjcp
         ahFEDoOp2zaMKbxKOaKDIBbMeD4GVOb46LCW+2TZ+riEMo3ELksEaguL2USG+KqmNkZR
         x9Nq7SNB2OQFIaS5d7ekFFLl963sIWkVsCugkzmyXz3bmShXa8YD0lkZkkKVR/bmAsdt
         J0RYbflMSU0bIViVy0LUPsphNIIG5VndF/QdGUhg6SDfDlUekKcZT/cEU34yUI1KDQRa
         RACkxOXWRlt0NKRapnl+M4sAkTutoA9EbYB/a+ZRg4UFfUDyLyu5jlO4sL0a7J5tX/Ak
         8z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266490; x=1695871290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjH6iOpaG+K0VeRik6vkPL3+XconrKzqUHw5TsZ+3TU=;
        b=ZSxZeUnLJnavg8lwSAxSPRVe/XEhzjpQjpYQYp2zRBwcxI1e7CWfZB6v8fx9A7DVP8
         9sDZjJX4itc86Y8DXdLXODh4ELdC50FyGTM42EV8HKLWyjHcyLGJ4D4Q5Dith+Uhio68
         pDLl8j4c2jkTDqWSPHnapMM4uWEE1cf279Sj4/yUS+DAXydV+ivTpEzMLqYDNTK/qBUT
         oJ9bYWqqsMu0+7IgsxtOIoWwO1fcansxncm9GMXrzGjayGl2brG+xsNKr7PjDNK+BHW4
         mA+ZczLF7zZb6nQ6kjDMTE2WsmT8ZiIHHP5eHZAP5MWPpRAWzdWLd90RPR6hyuuQkl9D
         GoXA==
X-Gm-Message-State: AOJu0YyDgEJCmESP364oA8Q8j7LWA4OUu3jubjJn98pQndaVmTnmMt7t
	XOpMg5hbhf/NW2sfhcRhY60dXw==
X-Google-Smtp-Source: AGHT+IHz6mW/ON4S2/COWzLpnRWQHugM656VgCdGGhnNlW1fNj473a3lOdsiCpzkMfeC5b/Ts2l9kg==
X-Received: by 2002:a05:6a00:2d08:b0:690:ce36:8b00 with SMTP id fa8-20020a056a002d0800b00690ce368b00mr5250152pfb.2.1695266490610;
        Wed, 20 Sep 2023 20:21:30 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:30 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/11] Staging: rtl8192e: Rename variable pPendingBA
Date: Wed, 20 Sep 2023 20:25:09 -0700
Message-ID: <20230921032515.96152-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pPendingBA to pending_ba to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 621dbca7716a..e6892bb7958c 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -303,7 +303,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *rsp = NULL;
-	struct ba_record *pPendingBA, *pAdmittedBA;
+	struct ba_record *pending_ba, *pAdmittedBA;
 	struct tx_ts_record *pTS = NULL;
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
 	u16 *pStatusCode = NULL, *pBaTimeoutVal = NULL;
@@ -345,15 +345,15 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	}
 
 	pTS->bAddBaReqInProgress = false;
-	pPendingBA = &pTS->TxPendingBARecord;
+	pending_ba = &pTS->TxPendingBARecord;
 	pAdmittedBA = &pTS->TxAdmittedBARecord;
 
 	if (pAdmittedBA->b_valid) {
 		netdev_dbg(ieee->dev, "%s(): ADDBA response already admitted\n",
 			   __func__);
 		return -1;
-	} else if (!pPendingBA->b_valid ||
-		   (*pDialogToken != pPendingBA->dialog_token)) {
+	} else if (!pending_ba->b_valid ||
+		   (*pDialogToken != pending_ba->dialog_token)) {
 		netdev_warn(ieee->dev,
 			    "%s(): ADDBA Rsp. BA invalid, DELBA!\n",
 			    __func__);
@@ -363,7 +363,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		netdev_dbg(ieee->dev,
 			   "%s(): Recv ADDBA Rsp. BA is admitted! Status code:%X\n",
 			   __func__, *pStatusCode);
-		deactivate_ba_entry(ieee, pPendingBA);
+		deactivate_ba_entry(ieee, pending_ba);
 	}
 
 	if (*pStatusCode == ADDBA_STATUS_SUCCESS) {
@@ -376,7 +376,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 
 		pAdmittedBA->dialog_token = *pDialogToken;
 		pAdmittedBA->ba_timeout_value = *pBaTimeoutVal;
-		pAdmittedBA->ba_start_seq_ctrl = pPendingBA->ba_start_seq_ctrl;
+		pAdmittedBA->ba_start_seq_ctrl = pending_ba->ba_start_seq_ctrl;
 		pAdmittedBA->ba_param_set = *pBaParamSet;
 		deactivate_ba_entry(ieee, pAdmittedBA);
 		activate_ba_entry(pAdmittedBA, *pBaTimeoutVal);
-- 
2.39.2

