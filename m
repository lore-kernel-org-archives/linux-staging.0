Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377A6F303
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998552; cv=none; b=GAKsH14BQ38cijlgoWlOUqz2dKcd2WnR8/gs2sLEOoz9zWlrNBxi6dZkoqb+F0cHmlKM74AyL5bY3H6QzjZIdd4x8rMpfNkjHprW3XT2SEUR9tCVo4h86ny93DsRLfNXbc+klM8Q19Me3PO1Yi1+jIceP7GOUWJP0CcuaI2pTdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998552; c=relaxed/simple;
	bh=YVcm4XmaxKFLGsFGlnqdGs7uzUoAsX5VuGhTAIrezbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hBvR3w7mRNS5mSv1fSZSWM30F7GauYPdEjf64DX2qrCdnwAexff3iHlOyZuTvaBGW1fCV621z4iVwhmR4iZg5GHG1z0B/4A5FxHSWC2nOhcSQuO2fLlus1ND8oJH8NPhAEq3YAegPGJOWp46fShFIcPY1FNVjZ8S7VNR81e2chw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JYjwprBi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JYjwprBi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f717608231so2738405ad.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998550; x=1718603350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAYOYW/Y7+3GJ2/qy/cBWqG5HCUdZYjYD0EgoGUSzio=;
        b=JYjwprBiuLcOhdDXmWoYYBVcKtO+Hcxyxh+fpj+nGjdB3HnQAzTUC9xp8doO8/CkzQ
         7XKohzMNEsRHzraoaegb4xaerJ9szXOqQ77FTTiD545i30BmFc3KbD2BJ633ioyGnxMc
         QoUoePfd23W+/xysVKHYYAPBHrrmPODgzi24WlLFRJ0pSMpxSYbykkXYkQjmb5xVnmLu
         J80J4SoOl6jdAMfmzArwuwupD1Q/BTX7xJypWbUPtEmKtMZnX81wJuRX7pKKmEdMaW9B
         lsitPx/4Vp2oWjXSINUULTqJJdSKRPji9HgW3qHvDtpcLtm3aczzgJyKjrgfExzPolXn
         x6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998550; x=1718603350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAYOYW/Y7+3GJ2/qy/cBWqG5HCUdZYjYD0EgoGUSzio=;
        b=eavHLujfF02eobAgdYA5Vle73099Rut0p7VZqHwSqPEXNidTGiRQePCA+TbmZOdnrN
         16zBMaFy5qr8d2sNbBUN1EplRQuRcJyBveIbaPB8qvzwVTJqdJyRSOuPjKEV/IjnVxzu
         EAFOSlVeKcTUXefaL+yE2qv3nofpyKQbkX712J03W/PjWAwGw79a0PX3gVIr+o5EiuR7
         qGfM63/PNFg3rpEXfvXIiCQP1UjWzCBe2alOyTdJ1aJ1Iv0IScOGsTHifpa2dWziEtTX
         mkA9a6calrqjTaud5pfa53o59eN4xgrZmpekbyDAh5TZYvV347mqQGmwUj0jo7WNuuxa
         q3cQ==
X-Gm-Message-State: AOJu0Yz7DjTmNfZ3hUtVovUT1UU3sVHozag02IWrK6eYO3w9f98x28lx
	eYItHj6Q+uSOh/BzKUcgUvAnX2kCdA7r2ZoWlIKzYawWChU5a0AgX3miTFkREGU=
X-Google-Smtp-Source: AGHT+IGtrvu1a6LtbV/lfvwTRSUUSPdPNnanK5CdVgTmpwTeU4QSe/5G9DctAJxrzGYb40F4sCSsqg==
X-Received: by 2002:a17:903:2349:b0:1f7:13db:529e with SMTP id d9443c01a7336-1f713db52dcmr26400655ad.4.1717998550390;
        Sun, 09 Jun 2024 22:49:10 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:10 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 18/24] Staging: rtl8192e: Rename function rtllib_query_HTCapShortGI
Date: Sun,  9 Jun 2024 22:44:43 -0700
Message-Id: <20240610054449.71316-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_query_HTCapShortGI to
rtllib_query_ht_cap_short_gi to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 97581cd58571..183a3897687e 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -330,7 +330,7 @@ static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
 		tcb_desc->bUseShortPreamble = true;
 }
 
-static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
+static void rtllib_query_ht_cap_short_gi(struct rtllib_device *ieee,
 				      struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
@@ -871,7 +871,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			rtllib_query_short_preamble_mode(ieee, tcb_desc);
 			rtllib_tx_query_agg_cap(ieee, txb->fragments[0],
 						tcb_desc);
-			rtllib_query_HTCapShortGI(ieee, tcb_desc);
+			rtllib_query_ht_cap_short_gi(ieee, tcb_desc);
 			rtllib_query_bandwidth_mode(ieee, tcb_desc);
 			rtllib_query_protectionmode(ieee, tcb_desc,
 						    txb->fragments[0]);
-- 
2.30.2

