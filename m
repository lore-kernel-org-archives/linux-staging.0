Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C082557E
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919807; cv=none; b=YVJhfn0y/YmrV7csTRUNl60RE9slVZ9LIAlVdr1RJ33P8XCLHkuq1LbNkUpm4M8KZ9woDRbk6J/NVOYCUtVD38xtAPkKSOKpOOa24ppWmEGJKUCOAY7zs/g/yogkQ5A1Sa3yZEhS+nCnH8fsi7c7XWTSMh2Y82CE0+8hDrdB/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919807; c=relaxed/simple;
	bh=bb2b3oSMK0DNg02UK1+jjSWnIX/epnr8WF+BqHgHszA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fcFHTrCjLPNXm2QoFPQGC/UfNn4KGG5EDCf2YoxTB5GI0rOZS+NdLZfc7N3Eju/XcR1s5q9BgEsWeZF3bSePLFwKcpyNH1IM7h4ZLJMFs6RvFKPKfGC2kL+NSxcBoV8RWaaUWwQptA309+e4g2EzPw0iYbRBQldjh5DapSVWgdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=SQBPxVFN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SQBPxVFN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d93edfa76dso22503935ad.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919805; x=1709524605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLI/FHiNfb+I57NxVeZ7c/ye1Dp4Vh2QKadh0HWO85c=;
        b=SQBPxVFNb1knOLuvv2wbeHpTlJZu7EvBNIUleGWtxplHvutkxcmf4ksw+RCSWTAjpv
         UluVp8eVVgr///8dB7MmRFuPEu9UE5yx3o+WX19viMcgJdplnw4KQtRM3bTebrKMeozr
         /9cRGEnPjqNu85cnBQ1rkXK+Pttqky5CVATp01natYF2vTwBoq5E8LmtLSlo5X1roKh2
         eKPStuhJP+1dRmvtODZ0scPiUj5I8OHpM4hKACZT4ump1O7+tJp/eDzE3Ls8cRfNYWOg
         EWbU0ijNzfNb/Vua6V0xtsEqqRA1NrjFPbXHnOLALR8ev62wrF1noHNYG7RRdYgFwZN+
         2hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919805; x=1709524605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLI/FHiNfb+I57NxVeZ7c/ye1Dp4Vh2QKadh0HWO85c=;
        b=lgtDeY+rsKccAh/+oW3l+im7ZUi36j4qc3e2hZdahYYkCbmnLy6U4i9bqLCZvyQNil
         CNb2JEK/tG+Kuc2pF74CIF0K9QJs9FDqWLZEW5eBE9t2//nFMN1x+T70Gg/MJDZHxM9d
         Ksj0ucmeNL+iQAbHOXiAtD8AlpND25/Nfz3AhrcjEmR3qL6vFxM7RTtxitKyIbzM9tJI
         UE1PUOP/n0lCvHSBVjm0Zz0I9wU4jiTdC4axHTzGeSFAGOhNLslnWm8LvnD2GAK6oz27
         tGCgKagtQqN66VbxupiJi/esHrieYZaG6S7hNqs1JGOpTdc9GdFxQhQ2PnewjEtwcfjL
         Jvjw==
X-Gm-Message-State: AOJu0YwLcTTYVo0M2ArleTwwtgAALhO3ew2H+kDhozumw4reoMSHpubk
	i0cyVT7D71M6MUh8NvfojPxZAMifHTVsMjrigGmKW2Uh/GdDm6W7Y1ymiEDjVqsZ/aHjIVcFYpy
	N
X-Google-Smtp-Source: AGHT+IF/vqfj/rgrk5O7lHfnT7alhQlOlfoIckREXu2cm5x+J2z40Mj4ent46Tas7EhKMKxl9ZsjKQ==
X-Received: by 2002:a17:902:e548:b0:1dc:1391:e074 with SMTP id n8-20020a170902e54800b001dc1391e074mr7755722plf.49.1708919805377;
        Sun, 25 Feb 2024 19:56:45 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:45 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 20/20] Staging: rtl8192e: Rename function MgntQuery_MgntFrameTxRate
Date: Sun, 25 Feb 2024 19:56:24 -0800
Message-Id: <20240226035624.370443-21-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function MgntQuery_MgntFrameTxRate to mgnt_query_mgnt_frame_tx_rate
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 933672ac8546..adfada92495b 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -163,7 +163,7 @@ u8 mgnt_query_tx_rate_exclude_cck_rates(struct rtllib_device *ieee)
 	return query_rate;
 }
 
-static u8 MgntQuery_MgntFrameTxRate(struct rtllib_device *ieee)
+static u8 mgnt_query_mgnt_frame_tx_rate(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	u8 rate;
@@ -201,7 +201,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 	if (ieee->disable_mgnt_queue)
 		tcb_desc->queue_index = HIGH_QUEUE;
 
-	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
+	tcb_desc->data_rate = mgnt_query_mgnt_frame_tx_rate(ieee);
 	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
@@ -277,7 +277,7 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
 	if (ieee->disable_mgnt_queue)
 		tcb_desc->queue_index = HIGH_QUEUE;
 
-	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
+	tcb_desc->data_rate = mgnt_query_mgnt_frame_tx_rate(ieee);
 	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
-- 
2.39.2

