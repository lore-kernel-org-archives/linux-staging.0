Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9FF4F1F2
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008925; cv=none; b=ov4h+QQ6XgY9W7FnJzCmuEo0tmYP6ueZrQASc8Du4v1nSVZvXKB5qr/4hteGy2GGYklTs42RTeSV7m9EFw4OFeTDLOI5ksKPllcdmNgcdyT7GVYAipqcqbDQdC0Quv0W+U9CDAzOHUeCxrX1UMxk079YIDZGr1TnuujIx2e0Vq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008925; c=relaxed/simple;
	bh=vtE0HQO5CTViHYJ0FOlOi3jB0yEXi4DyKJph2TmqnIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QmhV7IT8mpduedTT4ao20yJzD/CfEhgNdMT5YSpr8iXmhyqBMPXzwPU17gy+b8LE63oVEA+xauhk/4pD/r9E9I3RQsOac+ex5U8HNXwR62J9fQw/urEwZqYfz+WHc5jc/YQFwWkmNkE/XU5jUjn03n0d4K0fuMliBC8n3clRwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=LFrog13r; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="LFrog13r"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso3008495b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008923; x=1709613723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTeGqJBlqp2POB710RiU2T4uCXKoM61haRgZvOEZzlA=;
        b=LFrog13r4o1IdTtxqhIg+T4/O0EFtSN6J6PSOEz3B0zjHDwxDI8CD4W25BAvr+lfgq
         lsFmcuIuMEkzrUMnXt0+7aJohf77dEvajUlieW+94oc59M6dxJbfeWJx5r/fMIh/cpLs
         tDSSRdxF4tIbV1H/YA1FyVoVfdL36lVCR+tZG00PUwuWWMcmt1uUqzedn+JeX8285t7I
         do8cZIXU2Ao8P6OKuYujASuJpI86MmVvnFQno91wFDKwvOybm+wfH/k1kkJYwhuEFsBN
         acO2Zog9dZFX96O+psF7w7LiLOMTn+kIvXhiW0E8e9q1tE4zEJH/p1hmA1q3BV7LGRr7
         P5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008923; x=1709613723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTeGqJBlqp2POB710RiU2T4uCXKoM61haRgZvOEZzlA=;
        b=tHunGFedYzeI+NB5ZZJa6ULLESp5u+9zzAnV1HnjC0oxTnCs1M55rzbkUK5sIHTllJ
         X3668N0gtbypSQqUCPn9rZMiq2BB5PsIho2tvIvPCJQT1ZC77gCaLP2B2F+RYC0S4fvM
         qa+MEgnxZjVNqIS48LNuLrJx54v7k8aobBS8ba3x3WneBVKrR3a8wo2mK0bLIbLeXUz2
         Z0MhIs228uakSowYrhzISSXaITQEuJbTMOvcDJ2rIxYvnxIJWSe/q4ceyoazw0w8zPUX
         +ybvF9F04g30b91EhfKszhx+uwly3uNHaB4N6Fh23PDoIHeAavUlQ6mpq07F66HT/6g1
         oxfA==
X-Gm-Message-State: AOJu0YwrOyWFUK+ANLfS8RIUird/HgstVp/zv/uirZ1e1B8gSAV58csC
	Vv7MdFjtPdno+rxe9bQty94a6YAh8oWN9hVuCBOK//nsPUYo9hIGfDzO9wKtNeg=
X-Google-Smtp-Source: AGHT+IGbLpjLMTPjyTpkHFwmvsp2AmwhppLWePj/eaCxc6WMrzBVGYy/wC2YCbh6OTvPYkuWDbqzTQ==
X-Received: by 2002:a05:6a00:d4a:b0:6e4:3a32:49e1 with SMTP id n10-20020a056a000d4a00b006e43a3249e1mr7265336pfv.11.1709008922890;
        Mon, 26 Feb 2024 20:42:02 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:02 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 01/20] Staging: rtl8192e: Rename function rtllib_rx_ADDBAReq()
Date: Mon, 26 Feb 2024 20:41:38 -0800
Message-Id: <20240227044157.407379-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_rx_ADDBAReq to rtllib_rx_add_ba_req to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Fix 75 char line limit checkpatch warning
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index da7319c124e7..bd1d86e0323d 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -211,7 +211,7 @@ static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate DELBA packet.\n");
 }
 
-int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
+int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *req = NULL;
 	u16 rc = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 348644998744..95a8e9416f61 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1771,7 +1771,7 @@ u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame);
 void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
-int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
+int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 2545ac8963c4..f12ee685e989 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1551,7 +1551,7 @@ static void rtllib_process_action(struct rtllib_device *ieee,
 	case ACT_CAT_BA:
 		switch (*act) {
 		case ACT_ADDBAREQ:
-			rtllib_rx_ADDBAReq(ieee, skb);
+			rtllib_rx_add_ba_req(ieee, skb);
 			break;
 		case ACT_ADDBARSP:
 			rtllib_rx_add_ba_rsp(ieee, skb);
-- 
2.39.2

