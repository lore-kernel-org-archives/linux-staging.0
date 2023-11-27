Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FCE566C
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="B3wjORau"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cfc985c92dso4753655ad.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063392; x=1701668192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PM44Sv5UeHigK85eZavancsIZjjcHcgvzRmLXENl9Y=;
        b=B3wjORauXnBVA/A9RyXlKMaDxRwz7jdKeMzDadx9CavWdHMl6T88hFaZW9UEL4NNvj
         5+UCXU+f45OcgCDINFgTfJbEdgTsz6+/vxSbeTDb3CoKx+BS94O9vyIsVOE3IZp4PJIZ
         gHfx5BMl1tN3hMrSFYgfR87VkIYlBzrzYhI0oimyB55D/hoYmrU4jNg1S9I1Fa95jOY5
         CRVEbjYDAgQ97h19Joy3czGKjk+fbvGtBsxhhboQBZh7EpPR5ZGWolh7YfG+c8E+lRII
         B8tgrvFVpt5BBIbzEcddmdyDrDaWiWf2Bxyuf8a1XzfgPmemyzZaMcT74CXzVDKzIPX8
         4q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063392; x=1701668192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PM44Sv5UeHigK85eZavancsIZjjcHcgvzRmLXENl9Y=;
        b=B6wfquM4z2A6n4m5G/LnR8kCJ41sISZYCfet5SBtdXqCTPoJ/DpbPGikbavK2LEvTZ
         Om6BWmLNfCzizRH9t5DdqMQN8BaeOAtv+8C8OM+Mm+bApW5m/n52gqh0C0YaUqrLpz6j
         JLlhPdgIQtQScAjacSjYjTJ1o4x+5rCcpO8ifa2Q/PW4ddItD/GKNyiCfDHdHbO98ESB
         y/z08FQdKd8gPEo0/m4zZcNdcq+3uOtt/aVng99IBu0jItzer4laPMbHoo7L3Gtj0qFQ
         xaxWV03l1J4HQ440nQI2pTbiDrBe+2YhVmX8dcjikdeh/NQYWjpVJtxIHLGAcwaUWtAI
         opvA==
X-Gm-Message-State: AOJu0YyR46cxKeYWyfoHHAQIIkwrRgGGGYp79tvllbQC9S7w4CQt/6xj
	NFaIc/mY9NoXGCfwTVweCI+JdA==
X-Google-Smtp-Source: AGHT+IFP7ca8LnS/ff2C5FxTGyRUwr0BTpndq+nmeSNpa6zzaFA2shgCbOSShnZbIQKF3odmIc6JkA==
X-Received: by 2002:a17:902:db0d:b0:1cf:cc0d:9600 with SMTP id m13-20020a170902db0d00b001cfcc0d9600mr2677263plx.24.1701063391864;
        Sun, 26 Nov 2023 21:36:31 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:31 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/15] Staging: rtl8192e: Rename variable pBaTimeoutVal
Date: Sun, 26 Nov 2023 21:43:03 -0800
Message-ID: <20231127054305.148276-14-tdavies@darkphysics.net>
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

Rename variable pBaTimeoutVal to ba_timeout_value to fix checkpatch
warning Avoid CamelCase, and make the name consistent with variables
of same name/type.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 7074a01ad2e8..964029df310e 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -218,7 +218,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
 	struct ba_record *ba = NULL;
 	union ba_param_set *ba_param_set = NULL;
-	u16 *pBaTimeoutVal = NULL;
+	u16 *ba_timeout_value = NULL;
 	union sequence_control *pBaStartSeqCtrl = NULL;
 	struct rx_ts_record *ts = NULL;
 
@@ -240,7 +240,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	tag += sizeof(struct ieee80211_hdr_3addr);
 	dialog_token = tag + 2;
 	ba_param_set = (union ba_param_set *)(tag + 3);
-	pBaTimeoutVal = (u16 *)(tag + 5);
+	ba_timeout_value = (u16 *)(tag + 5);
 	pBaStartSeqCtrl = (union sequence_control *)(req + 7);
 
 	if (!ieee->current_network.qos_data.active ||
@@ -273,7 +273,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	deactivate_ba_entry(ieee, ba);
 	ba->dialog_token = *dialog_token;
 	ba->ba_param_set = *ba_param_set;
-	ba->ba_timeout_value = *pBaTimeoutVal;
+	ba->ba_timeout_value = *ba_timeout_value;
 	ba->ba_start_seq_ctrl = *pBaStartSeqCtrl;
 
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev) ||
@@ -292,7 +292,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 		struct ba_record BA;
 
 		BA.ba_param_set = *ba_param_set;
-		BA.ba_timeout_value = *pBaTimeoutVal;
+		BA.ba_timeout_value = *ba_timeout_value;
 		BA.dialog_token = *dialog_token;
 		BA.ba_param_set.field.ba_policy = BA_POLICY_IMMEDIATE;
 		rtllib_send_ADDBARsp(ieee, dst, &BA, rc);
@@ -306,7 +306,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	struct ba_record *pending_ba, *pAdmittedBA;
 	struct tx_ts_record *ts = NULL;
 	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
-	u16 *status_code = NULL, *pBaTimeoutVal = NULL;
+	u16 *status_code = NULL, *ba_timeout_value = NULL;
 	union ba_param_set *ba_param_set = NULL;
 	u16			reason_code;
 
@@ -323,7 +323,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	dialog_token = tag + 2;
 	status_code = (u16 *)(tag + 3);
 	ba_param_set = (union ba_param_set *)(tag + 5);
-	pBaTimeoutVal = (u16 *)(tag + 7);
+	ba_timeout_value = (u16 *)(tag + 7);
 
 	if (!ieee->current_network.qos_data.active ||
 	    !ieee->ht_info->current_ht_support ||
@@ -375,11 +375,11 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		}
 
 		pAdmittedBA->dialog_token = *dialog_token;
-		pAdmittedBA->ba_timeout_value = *pBaTimeoutVal;
+		pAdmittedBA->ba_timeout_value = *ba_timeout_value;
 		pAdmittedBA->ba_start_seq_ctrl = pending_ba->ba_start_seq_ctrl;
 		pAdmittedBA->ba_param_set = *ba_param_set;
 		deactivate_ba_entry(ieee, pAdmittedBA);
-		activate_ba_entry(pAdmittedBA, *pBaTimeoutVal);
+		activate_ba_entry(pAdmittedBA, *ba_timeout_value);
 	} else {
 		ts->add_ba_req_delayed = true;
 		ts->disable_add_ba = true;
-- 
2.39.2

