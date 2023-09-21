Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310C4411
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:33 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3adcec86a8cso323834b6e.3
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266493; x=1695871293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdTofcyZS0AKt9ZBJvnueeLkRS3GUhVVwU6EDW/iNno=;
        b=LeV7jMOrzFd9gqlkJbYVvNEvq0wwJN4LuQ3x7p6eFs0yi7+9gxRrrQcZYItAZJCSf+
         mSgerpv3OXiLaXFdRUCxsLYl252/S6GXEd3Zao5M8sPnlRa+8x+LlIoG6aln5QNvfMc6
         pmDzRUccqzLxGFZ+9tz2kDTgJaf/s84CAck4ecZSECJmAdG6KXkQ8OVQ3Eo+Fqe3lVmv
         jzOSV5r+dUCNUGL27gefxP4Ss1frk9uCDWUoI0md4ojlb1ahsRGpf3of/baX8KB62Kag
         /MyVNxTdqUDZsQaUtcg0qGl00ldZhuGWtJVmb+9NLkzvLFDhOiCBCUba1dVtgCMr05mQ
         mpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266493; x=1695871293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdTofcyZS0AKt9ZBJvnueeLkRS3GUhVVwU6EDW/iNno=;
        b=g6+sfG7EQalQsnZpxUiHOzRyy6OEftGf1xrjrV5UEaJ2ymA2WwJ51U1T2uIrTgYcyc
         iAsm1KrlJ24DZtGugMsmOGKFG5t7+cQm202c1S8EWseQib33tJBJ8iAIWXP5mB/zK3SD
         FRVndQN1b0/U7RKqRRblduP4Ow9tOuAx/xsjLPW6Rgs+T6jgkuc8hDlEapqs3VBBviCw
         20/17jc5+dydOOZ9AkZzqodLnNjLRmGNnQ2IeTKYXYtD09mRMc5Q6fD1MBErMRCe/AvD
         gis1ylYKjP5iNncOdWiyVwS/YGv0i1tO82Zxr59qZk+zNsGrup6TU/bP+Dw1krJjQR6N
         /ndg==
X-Gm-Message-State: AOJu0YyfMODCt1F3zOsxSN2CAfwePOEc0KL4pc2QlqTx2HoVXljjuI4g
	ydSqkcZ1kCO+WYSRXHhJFN5rgA==
X-Google-Smtp-Source: AGHT+IFggucz4dCbL4PulcvIsH7OS6MECN6T5307nBCOQYoCjWyEZ92QQjMxWX0V6iIgaZbBc04Dcg==
X-Received: by 2002:a05:6808:158c:b0:3a7:a548:d92a with SMTP id t12-20020a056808158c00b003a7a548d92amr4929603oiw.5.1695266492786;
        Wed, 20 Sep 2023 20:21:32 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:32 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/11] Staging: rtl8192e: Rename variable pStatusCode
Date: Wed, 20 Sep 2023 20:25:11 -0700
Message-ID: <20230921032515.96152-8-tdavies@darkphysics.net>
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

Rename variable pStatusCode to status_code to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 3468bdcea7fc..a5676f01855b 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -306,7 +306,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	struct ba_record *pending_ba, *pAdmittedBA;
 	struct tx_ts_record *pTS = NULL;
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
-	u16 *pStatusCode = NULL, *pBaTimeoutVal = NULL;
+	u16 *status_code = NULL, *pBaTimeoutVal = NULL;
 	union ba_param_set *pBaParamSet = NULL;
 	u16			ReasonCode;
 
@@ -321,7 +321,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	dst = (u8 *)(&rsp->addr2[0]);
 	tag += sizeof(struct ieee80211_hdr_3addr);
 	pDialogToken = tag + 2;
-	pStatusCode = (u16 *)(tag + 3);
+	status_code = (u16 *)(tag + 3);
 	pBaParamSet = (union ba_param_set *)(tag + 5);
 	pBaTimeoutVal = (u16 *)(tag + 7);
 
@@ -362,11 +362,11 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	} else {
 		netdev_dbg(ieee->dev,
 			   "%s(): Recv ADDBA Rsp. BA is admitted! Status code:%X\n",
-			   __func__, *pStatusCode);
+			   __func__, *status_code);
 		deactivate_ba_entry(ieee, pending_ba);
 	}
 
-	if (*pStatusCode == ADDBA_STATUS_SUCCESS) {
+	if (*status_code == ADDBA_STATUS_SUCCESS) {
 		if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
 			pTS->bAddBaReqDelayed = true;
 			deactivate_ba_entry(ieee, pAdmittedBA);
-- 
2.39.2

