Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26D5663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="YvVrz6qM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cfc3f50504so5658275ad.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063385; x=1701668185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVZx2znymTutkOywVzUkt2j2sn+uTemk2vkexBlkB8A=;
        b=YvVrz6qMRSovAvDaIyylVGWw8y2s9kBR/NRYhKRER/+yoYXg9qquVzFu3UEPMmGoxX
         aVJzY8TSIh5P4fo2LUBSmbYEPlRTidBmk4UyA6+/XXHN7F8BV7zWuWnVwnL4CdlDkAkX
         KypbJXWo7b+8yoC9OI32AfiWoYQ3i7Fp6QFH9az/2JJ4OcindwDeTcZWxH0jdg3ExmRl
         ESpugJsLF2jz+5I+/I0lLavGgjg0C6c4evlK4FMeS+Mk9wwRztowivF85LFP7fwu/6p2
         YjkHMV9dOmTG6ry+aEWo3Q1CbFNbbQY+3pUhF2Oj+78175VpGxRcn3xIb56361dDPPk7
         EQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063385; x=1701668185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVZx2znymTutkOywVzUkt2j2sn+uTemk2vkexBlkB8A=;
        b=JGSPwhksRXtipI6l9iZ77UkhaCyzZ49OSnkA1pbaayLHrB6rU6jXCw2Pq5KyB2EeCd
         1qdsBgGmwFli4Q3XyJJUV4e1jhgMp2S6EfCF0C5CPtnVOAuJe5NcAlQvVAX5vv8pVgv3
         htfbLEVjoq3xL/0+fRO+dCJlbVZrybLUQnBiC+Kbtv/EqQOqX17Bi10LLuUh78uFal+7
         y+GarEP/Qn7vY2tnBKgWPPcSr4A8peuKevr9Rjxc4qSp+u/RPCQJa5EccCXnAJj4zzlq
         khEpZ4BANJv5/FesTiBdmE1qfMWdX9cdoNdl+Rre7fuO+3gjMLVtBf762zsBng6ncpI0
         RfVA==
X-Gm-Message-State: AOJu0YzTceNuVfQmEH2/Vj+PX/NMv6TGEyETeINv29uxhmR0F7MHN5wx
	f6hDkwaSaJdrIH+U6a2O63BOjA==
X-Google-Smtp-Source: AGHT+IFgTjNmDfa98uCeE9DnBvPC5kZubca/TiaCBOiEBfJvfJgqdUncaAbgjCkb8hDdxr4iO7033A==
X-Received: by 2002:a17:902:ec85:b0:1cf:a9c4:7f4b with SMTP id x5-20020a170902ec8500b001cfa9c47f4bmr9325205plg.24.1701063384760;
        Sun, 26 Nov 2023 21:36:24 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:24 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/15] Staging: rtl8192e: Rename variable pDialogToken
Date: Sun, 26 Nov 2023 21:42:57 -0800
Message-ID: <20231127054305.148276-8-tdavies@darkphysics.net>
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

Rename variable pDialogToken to dialog_token to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 51deab720e76..78da79ebd775 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -215,7 +215,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *req = NULL;
 	u16 rc = 0;
-	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
+	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
 	struct ba_record *ba = NULL;
 	union ba_param_set *pBaParamSet = NULL;
 	u16 *pBaTimeoutVal = NULL;
@@ -238,7 +238,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	tag = (u8 *)req;
 	dst = (u8 *)(&req->addr2[0]);
 	tag += sizeof(struct ieee80211_hdr_3addr);
-	pDialogToken = tag + 2;
+	dialog_token = tag + 2;
 	pBaParamSet = (union ba_param_set *)(tag + 3);
 	pBaTimeoutVal = (u16 *)(tag + 5);
 	pBaStartSeqCtrl = (union sequence_control *)(req + 7);
@@ -271,7 +271,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	rtllib_FlushRxTsPendingPkts(ieee, ts);
 
 	deactivate_ba_entry(ieee, ba);
-	ba->dialog_token = *pDialogToken;
+	ba->dialog_token = *dialog_token;
 	ba->ba_param_set = *pBaParamSet;
 	ba->ba_timeout_value = *pBaTimeoutVal;
 	ba->ba_start_seq_ctrl = *pBaStartSeqCtrl;
@@ -293,7 +293,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 
 		BA.ba_param_set = *pBaParamSet;
 		BA.ba_timeout_value = *pBaTimeoutVal;
-		BA.dialog_token = *pDialogToken;
+		BA.dialog_token = *dialog_token;
 		BA.ba_param_set.field.ba_policy = BA_POLICY_IMMEDIATE;
 		rtllib_send_ADDBARsp(ieee, dst, &BA, rc);
 		return 0;
@@ -305,7 +305,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	struct ieee80211_hdr_3addr *rsp = NULL;
 	struct ba_record *pending_ba, *pAdmittedBA;
 	struct tx_ts_record *ts = NULL;
-	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
+	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
 	u16 *status_code = NULL, *pBaTimeoutVal = NULL;
 	union ba_param_set *pBaParamSet = NULL;
 	u16			reason_code;
@@ -320,7 +320,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	tag = (u8 *)rsp;
 	dst = (u8 *)(&rsp->addr2[0]);
 	tag += sizeof(struct ieee80211_hdr_3addr);
-	pDialogToken = tag + 2;
+	dialog_token = tag + 2;
 	status_code = (u16 *)(tag + 3);
 	pBaParamSet = (union ba_param_set *)(tag + 5);
 	pBaTimeoutVal = (u16 *)(tag + 7);
@@ -353,7 +353,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			   __func__);
 		return -1;
 	} else if (!pending_ba->b_valid ||
-		   (*pDialogToken != pending_ba->dialog_token)) {
+		   (*dialog_token != pending_ba->dialog_token)) {
 		netdev_warn(ieee->dev,
 			    "%s(): ADDBA Rsp. BA invalid, DELBA!\n",
 			    __func__);
@@ -374,7 +374,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			goto OnADDBARsp_Reject;
 		}
 
-		pAdmittedBA->dialog_token = *pDialogToken;
+		pAdmittedBA->dialog_token = *dialog_token;
 		pAdmittedBA->ba_timeout_value = *pBaTimeoutVal;
 		pAdmittedBA->ba_start_seq_ctrl = pending_ba->ba_start_seq_ctrl;
 		pAdmittedBA->ba_param_set = *pBaParamSet;
-- 
2.39.2

