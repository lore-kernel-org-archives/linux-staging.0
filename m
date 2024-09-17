Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5B16131A
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551130; cv=none; b=ntGtE21AARIqICCSOb0B/pkZbNAQcP/exf6P7+mjujm0E8b40JLnrU1Ao/0BUwRe5IXHzv7z06h7gkg4HCqL2n0XQ/VLea+uvJZZyAA5dk4iUPGbA8W/BxomCF7mibrPG2bxhBtl6Gh3qW5KHzuVZrPB11fGxR9+fzTDmeHRq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551130; c=relaxed/simple;
	bh=HBBgh4U2TbQiKhQg+3mmt7kSgvNSyjFSCv4hesHPrtg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=thcx7+4XtRYjnjXJ8sERXiSl/6owXTMlUBVCPnnOZBqsFm7HC+cbc19bXqjETeNA76FVeFA6XMK0snyuWpCtAydmv6dvPCwPrGfO0+v4XpUnlvro3wuppjkVacm+oEmxQYkfPwtQ9Ri7LSX3r1yqZqtIXSnlcWNZcJ1owl1efi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=bInZMxZ5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="bInZMxZ5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718e3c98b5aso3483674b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551128; x=1727155928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8Wt1wfr8yB8GpjkRnwYrY5PO/CblyQRQKYIXDYNbio=;
        b=bInZMxZ5wmsARw3rVBkVo8WSsbgfMB914rq/vXVHeFu36dXtEf/FvDq3qknpq/QZbJ
         CSIFvrIvCbG2QJJujjUI0Yk272eZv3xGTz1h8j4/LGgQGeevPjpHfxP+JzmcJkECarj6
         IUV9pvT8dZspDH5ANi+DsErj8tnflpjAtoOGeOY1A5bxFV6THJmo+OWMZBEHc26rzvXQ
         fUY2eF07/G5xXlIthqCMaBdU66b3FCtcwjdbtVlhb2OhDektLdeGjRJYpxBkfa9JqPe+
         sVQHNiWB3i8ZzVsdNMCfNxplx29JyjbaxjZ3z5aluI5XDcVL14+DgZ1B8ojGO+3HMoEy
         mnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551128; x=1727155928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8Wt1wfr8yB8GpjkRnwYrY5PO/CblyQRQKYIXDYNbio=;
        b=JiE4Lo6WN/i4vVwL4vKGJpOIhkmMU13BxZGvUjLLwxQLjQcPMmuEZ5Yw0axs/+fi7c
         8gJLQs1x12nPxPnS82by81H9Oi0maBfjX6dH784nBenzjxVCHLq9f5+W0CTe3IYBVZL8
         3K2KgQAh6tRNZR5lWIzH0nRyFc2rJAh9NAtwE99IYGxFkpRFKkzcWGA2oO/ADrgAfG+O
         /qig2CjJzZrPrwAk+HkzsA+FcH4xAnCfqO4gXfi7g4qXnEyhYuMC267MlbWgKU0jPBlN
         cK/p9exUHIwzj+vYcoNVq6XPWuAMyV1CirEbtdlIZjNVSlTjToLqJkKmPkVO0SsxLwxM
         NmwA==
X-Gm-Message-State: AOJu0YxFFFadB4GSam/FvASNFo4g2aM3+13QXJUFiQe25Tj3EQZ5UFay
	lNA+U31qoRSC48Wdd7TFlqXOFddald7S1h3GWkq5EAwSd+h8tioOrR/dtBEd3Ec=
X-Google-Smtp-Source: AGHT+IHrKjf+5zHzcgpeoPHGRycWKpK2MknumxH8Wq7GAa+b9vRHeq3DYP/TCto5oznPhffTAnPGrQ==
X-Received: by 2002:a05:6a00:3e29:b0:719:1df6:c114 with SMTP id d2e1a72fcca58-71926055ce7mr25012931b3a.1.1726551128465;
        Mon, 16 Sep 2024 22:32:08 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:08 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 18/18] Staging: rtl8192e: Rename variable pMCSFilter
Date: Mon, 16 Sep 2024 22:31:52 -0700
Message-Id: <20240917053152.575553-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pMCSFilter to mcs_filter
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 2eba916d7f50..ee6bc3202727 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -358,21 +358,21 @@ static u8 ht_pick_mcs_rate(struct rtllib_device *ieee, u8 *pOperateMCS)
 }
 
 u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *mcs_rate_set,
-		       u8 *pMCSFilter)
+		       u8 *mcs_filter)
 {
 	u8		i, j;
 	u8		bitMap;
 	u8		mcsRate = 0;
 	u8		availableMcsRate[16];
 
-	if (!mcs_rate_set || !pMCSFilter) {
+	if (!mcs_rate_set || !mcs_filter) {
 		netdev_warn(ieee->dev,
-			    "%s(): mcs_rate_set and pMCSFilter are null\n",
+			    "%s(): mcs_rate_set and mcs_filter are null\n",
 			    __func__);
 		return false;
 	}
 	for (i = 0; i < 16; i++)
-		availableMcsRate[i] = mcs_rate_set[i] & pMCSFilter[i];
+		availableMcsRate[i] = mcs_rate_set[i] & mcs_filter[i];
 
 	for (i = 0; i < 16; i++) {
 		if (availableMcsRate[i] != 0)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 074cd837c708..ff616c82b942 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1737,7 +1737,7 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
 				     struct rtllib_network *network);
 u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *mcs_rate_set,
-		       u8 *pMCSFilter);
+		       u8 *mcs_filter);
 extern u8 MCS_FILTER_ALL[];
 extern u16 MCS_DATA_RATE[2][2][77];
 u8 ht_c_check(struct rtllib_device *ieee, u8 *frame);
-- 
2.30.2

