Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D04CB2F
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="NlFN4mgd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28659348677so1761855a91.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 15:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702857329; x=1703462129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Xh9057HjSReuOSkTJHqLjqeYxKmFJY7/nLpPeU9NVU=;
        b=NlFN4mgdHCgvHMU3j0gp+sO71HzqDgo7/mlNxzsCA+q+sXwedPU1811VbONxZUGjoG
         xakqN9OnWw0fOQ9MDDxfw7NwUiHhNANeIfq2sV1OwOLfEcpy9FNJ54I0W+xaMEqLkLKM
         W+fxeNhBFPd9CYouqCTSWxS0RbaOQcXJga9+TLftkaUwQWsgXnXBjbEcQ6FL9YU0WzBk
         kgFT8AO1lG+rZBwDgBdiak1EWCEeM9YsllfAn+HPvkQbL4X7pGOPrOlYJRHA/INI2C4U
         bD5QF3zu5p3qe2VxKneDUWYJAXE26w+oHXDqjGWkSqIpMNgivyUebPCARHPM+0ok4xEI
         N9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702857329; x=1703462129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Xh9057HjSReuOSkTJHqLjqeYxKmFJY7/nLpPeU9NVU=;
        b=xDWn0AZf7/UnqGSZWZTkUUXFNo9z3JC42lehjFKMkodN2jJbOOaf/87IgEnVS11/bf
         JfoY8XBjZtWz8rmFs4uIaAH5RJNSWAsb7EylJFJNoUV/SwpzMcBJwWb8DR8xwY5uazjT
         mGQL3JBzmZ/KRB/YAYB9NO1dWo85dMMhEJ8nWNxWgiiv4zowxcZkZ6tWC+hDmJOmjcMJ
         xVe/OqXCB1dPSToF0Vc5ctmiBxhov971q2SCwotdveMdkMoY3TwUC22kvpRb2tOAGAbE
         qbyH4I7Ys75nOxKBlmzHbDdKOCzZq/j5bbF2FhcBqBFJs/xNtos8F9ujpguAp77LvY3F
         TGEQ==
X-Gm-Message-State: AOJu0YzE9kBqU+X76bDybt+W2iRMZ+qDV0f5pTfr5Uor3VeKKRmRwQNK
	XMk8dxiGelsOUfFxdO02C7AWrA==
X-Google-Smtp-Source: AGHT+IFb2n5v3YoFspuLtRt+lyzQo9g1VO/PMtFjwsN0/BR9zn2VrKZerGUAbdGHdA6juw82EwWWrQ==
X-Received: by 2002:a17:90a:c705:b0:28b:5cd5:9ff9 with SMTP id o5-20020a17090ac70500b0028b5cd59ff9mr2713446pjt.39.1702857329474;
        Sun, 17 Dec 2023 15:55:29 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm9036176pjy.10.2023.12.17.15.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:55:28 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 6/6] Staging: rtl8192e: Rename variable pBaStartSeqCtrl
Date: Sun, 17 Dec 2023 15:55:20 -0800
Message-Id: <20231217235520.30377-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217235520.30377-1-tdavies@darkphysics.net>
References: <20231217235520.30377-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pBaStartSeqCtrl to ba_start_seq_ctrl to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index b816f94336f0..3db7dcc3bd23 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -219,7 +219,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	struct ba_record *ba = NULL;
 	union ba_param_set *ba_param_set = NULL;
 	u16 *ba_timeout_value = NULL;
-	union sequence_control *pBaStartSeqCtrl = NULL;
+	union sequence_control *ba_start_seq_ctrl = NULL;
 	struct rx_ts_record *ts = NULL;
 
 	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 9) {
@@ -241,7 +241,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	dialog_token = tag + 2;
 	ba_param_set = (union ba_param_set *)(tag + 3);
 	ba_timeout_value = (u16 *)(tag + 5);
-	pBaStartSeqCtrl = (union sequence_control *)(req + 7);
+	ba_start_seq_ctrl = (union sequence_control *)(req + 7);
 
 	if (!ieee->current_network.qos_data.active ||
 	    !ieee->ht_info->current_ht_support ||
@@ -274,7 +274,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	ba->dialog_token = *dialog_token;
 	ba->ba_param_set = *ba_param_set;
 	ba->ba_timeout_value = *ba_timeout_value;
-	ba->ba_start_seq_ctrl = *pBaStartSeqCtrl;
+	ba->ba_start_seq_ctrl = *ba_start_seq_ctrl;
 
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev) ||
 	   (ieee->ht_info->iot_action & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
-- 
2.39.2

