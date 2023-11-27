Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E975663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="YqD0MBue"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cfaaa79766so17844575ad.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063393; x=1701668193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtJK7mZuXOY4guA3qIV1p7LNy/r3mdWBevupreTz+OE=;
        b=YqD0MBueH1ZQDXRnIrZIMOXabigVwPPmH65zTHLPeoDZm4QujE3rVVgo+YeWKHkd8C
         VThU7QwpbgIyqUI75Qqn8YtF5Tqn365mmsxD8Qhb4nWX8S84EinvJ6xXWlM7uN/hLeGF
         v11drmMAQ0Ldn5+UolxFWIwze/NOki4pGEUiB4n97bsHwNPBNWiD6OAVa6WYRlzFyGu5
         U78zrmvrp/e6C84XmhI7bi4X9JAWDCU17mdUn16w6TkRsfTwkNZbrDz9aHzGXl+HQHJ0
         t/DaltU81jfjhOazUk4I2CG4w3qS52ahLCfkZrhiHuB6ERMWg3NMojYeuo5Y1kiU4hOM
         djCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063393; x=1701668193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtJK7mZuXOY4guA3qIV1p7LNy/r3mdWBevupreTz+OE=;
        b=IX4zKlGkNg/WfCOp9YcCVk56ErUrGyvawdn+INqSGlo4E8E/ubfJJOzc6FLDsm26XM
         W+mb58eP0DCZ/XcMA+cRduTn/tC7Mvo17p4LWeXBo55DapTIeC2Iy1b2v1T8X1g+7Kn4
         CxBOzkStl/iI3nz2eLnk6e2EPbbQ4d16cHlOwVTwfDP6MmaS6j7IouyK6/ieOgw//8B0
         ipEvGEZAmx6Rsrr3STAmtAsEoowgMgPIVoNJX7XuuzDjAXjSA7DSODx4+LaR/R5Z+onq
         8ZQMEvJcUeqbFgNeNIGXMjewSy6xItY7iygPWW7kti4zTo2YBiVoft01RN4UQrWhstAE
         a7nQ==
X-Gm-Message-State: AOJu0YxF30YAdU1VzIYDUq9gUXqa3Umzw4NA2arwiAqXCLAAamy2GIeM
	7w3PFB0n3TiDpyB4LQ/0Rk+VtA==
X-Google-Smtp-Source: AGHT+IFXlVDHEwAHNFRKsqffoUtfvXLUe5l1y2FnOIdBYfL9VJdypsffTSG4o7KRc9BzrmANrieclQ==
X-Received: by 2002:a17:902:e80e:b0:1cf:daca:2b5e with SMTP id u14-20020a170902e80e00b001cfdaca2b5emr134321plg.38.1701063393392;
        Sun, 26 Nov 2023 21:36:33 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:32 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/15] Staging: rtl8192e: Rename variable pAdmittedBA
Date: Sun, 26 Nov 2023 21:43:04 -0800
Message-ID: <20231127054305.148276-15-tdavies@darkphysics.net>
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

Rename variable pAdmittedBA to admitted_ba to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 964029df310e..b00d0f7c7517 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -303,7 +303,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *rsp = NULL;
-	struct ba_record *pending_ba, *pAdmittedBA;
+	struct ba_record *pending_ba, *admitted_ba;
 	struct tx_ts_record *ts = NULL;
 	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
 	u16 *status_code = NULL, *ba_timeout_value = NULL;
@@ -346,9 +346,9 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	ts->add_ba_req_in_progress = false;
 	pending_ba = &ts->tx_pending_ba_record;
-	pAdmittedBA = &ts->tx_admitted_ba_record;
+	admitted_ba = &ts->tx_admitted_ba_record;
 
-	if (pAdmittedBA->b_valid) {
+	if (admitted_ba->b_valid) {
 		netdev_dbg(ieee->dev, "%s(): ADDBA response already admitted\n",
 			   __func__);
 		return -1;
@@ -369,17 +369,17 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	if (*status_code == ADDBA_STATUS_SUCCESS) {
 		if (ba_param_set->field.ba_policy == BA_POLICY_DELAYED) {
 			ts->add_ba_req_delayed = true;
-			deactivate_ba_entry(ieee, pAdmittedBA);
+			deactivate_ba_entry(ieee, admitted_ba);
 			reason_code = DELBA_REASON_END_BA;
 			goto OnADDBARsp_Reject;
 		}
 
-		pAdmittedBA->dialog_token = *dialog_token;
-		pAdmittedBA->ba_timeout_value = *ba_timeout_value;
-		pAdmittedBA->ba_start_seq_ctrl = pending_ba->ba_start_seq_ctrl;
-		pAdmittedBA->ba_param_set = *ba_param_set;
-		deactivate_ba_entry(ieee, pAdmittedBA);
-		activate_ba_entry(pAdmittedBA, *ba_timeout_value);
+		admitted_ba->dialog_token = *dialog_token;
+		admitted_ba->ba_timeout_value = *ba_timeout_value;
+		admitted_ba->ba_start_seq_ctrl = pending_ba->ba_start_seq_ctrl;
+		admitted_ba->ba_param_set = *ba_param_set;
+		deactivate_ba_entry(ieee, admitted_ba);
+		activate_ba_entry(admitted_ba, *ba_timeout_value);
 	} else {
 		ts->add_ba_req_delayed = true;
 		ts->disable_add_ba = true;
-- 
2.39.2

