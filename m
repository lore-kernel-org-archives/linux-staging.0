Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469AC40DFDF
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901597; cv=none; b=uxGJbbczXUbPHe9pBE7JzEmFORDbe/07SxTZd+n1hw7OxcRUrV7zWXXIgUlyQDEBCjSwK0SEtd5eRll/HeCG6VLDNqj/LJQvDJpJCU+omf8F2Kal6ov9MH502h+G0y27607bSmyhKBBNf+ToajtIZGaP5Fw7IL7/aV2xoegJaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901597; c=relaxed/simple;
	bh=IWzRBK7yZLv5/LuGuwE7ds2/nn6NnLWIT8wBa+Wt7mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hl1hhRQUAP1MNLzuDtQtTyURMW+Q1MTUN23zWJp6lGAcMu1T+h7K9uEJIMQ0t+YxWUhII7AFLbP5t2UhgaouLY6dHDhsdcSPKYp2g6uYF8/ZMTYKUJDyf7EtWdRkALZwi2o0c0LkyRtL+9GwpF1XAbJjLO0vSjRwcuRLHomASH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HytKCZCr; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HytKCZCr"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4670464029eso419669b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 23:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773901595; x=1774506395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeL0PGol9P+fZjiED2N5BcwRBJQEArDL1vipr1fxFGE=;
        b=HytKCZCr/fouK1izFDYVrSqQYBscqLdeyRmZXxxzeDkNJEibYD7jZ7EmQsaiczVsWg
         sNN9j0f24g4wfCduZTT8HcijNPGewmDH3Q1Zh+liPd6AkWztDnXXcd54aWrGmLObFfsS
         F8VCa1VwWqpFr/n0Sjvdbwhx5Fu9yrV2xCrzc+/Ag8UWEWQCedtiwQiQloryprY140tT
         pJqb8C089/tY6I9DtxTxHU+23IB3fvMjy1g6abVQXOTye/UlswFZqJdNK+E2sjsmYgpr
         gqtDqA51DEIg2e+n1zt0SMh75Ik8uVFLs+YTDhk6Ocmiwf4u7/+gfH6rcHS0ux3nLc/K
         hGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901595; x=1774506395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeL0PGol9P+fZjiED2N5BcwRBJQEArDL1vipr1fxFGE=;
        b=Y79JODxvrM11jDaoa4y7ytB2VhLfxoxTneNnYISdeu+ZxJcwOJIllBrbzLAnGC/qef
         2Co3U1YuExf9YqsoKFLAT8Hnkl8x22Y8STD3XWqwjQSVd95FngnwnGyQ612F2yx/MOFD
         guota6idIVR/XHH9YNEbGG1ojvE3P76ndaDoivkLihB0/DBeDG2IGJh3s1xM9V/gf31C
         nIoDGiClig0FxU3xHFO6GvEgLXPHfGr00fXAOl8r1ii5Kk6ltQZhFWKfsbdSeC2FxG1Q
         +coI5GJ5EXczX8nIeV3zztCeUsHxn0hVIsSXaygVdVbxuWWyScF10zbzFfsEn+V9zeAK
         YL0g==
X-Gm-Message-State: AOJu0Yy4dgSWhJIPLJ+vapzkZ+7TBVyUi6BDMAUnBNaNwxwZL1+X6PLR
	DhorST0XHtncvqkuVybS5kb5fpESPhMrkZfiiFjeovAt1CT450patbmD
X-Gm-Gg: ATEYQzyr4AOHyqRyJOCzkGlhuG8M9B2NtwKaqETDsGM2GnfDZyposr46Fj5YFimAdW7
	r8WhUYy3EVWRif51VFy733uTl7n7LW9f9SXLgd0KJ0n5Igi/JTJTQcT2WYg0GoxcEoPGZj0bCqT
	TzdIYB5xbhOLzgznHhsJcrua+0PWBGtlDDFlACdznuznbvvS79X5qcCYiVavCCCqaYFgKbb/cQr
	OMDdw2+2XEJBjllzyzefeGAgPA07kAICp8jHCmbHT3I9Ci83ThBPLzl49ROEL2BSTZeQRXnb0w5
	mb3FrH4ntXRvWgf1VDO9MbzUqKt1FfhA+hgvr4bhsPL2TFNi++GffayRPcuuEzuYzoke+EUOh+3
	eywqAj033TMfa77JkQukaqalvf14KX96UXoyT6zwtPGZdUbQk8M29HJM64WQ5Czr8oUZ4EVux2p
	9Fic1hIgn/LbQ=
X-Received: by 2002:a05:6808:c195:b0:467:4a7:e3f6 with SMTP id 5614622812f47-467ba0c1a8dmr3264312b6e.2.1773901595167;
        Wed, 18 Mar 2026 23:26:35 -0700 (PDT)
Received: from arch ([177.249.162.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-467baaccdccsm3093124b6e.16.2026.03.18.23.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:26:34 -0700 (PDT)
From: Marco Antonio Solis Segura <mshdevv@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marco Antonio Solis Segura <mshdevv@gmail.com>
Subject: [PATCH] staging: rtl8723bs: split multiple assignment in rtw_mgmt_xmitframe_coalesce
Date: Thu, 19 Mar 2026 00:26:26 -0600
Message-ID: <20260319062626.605200-1-mshdevv@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup the multiple assignment of tmp_buf and BIP_AAD to fix the
checkpatch.pl CHECK: "Multiple assignments should be avoided".

Additionally, reorder the assignments to ensure tmp_buf is assigned
only after BIP_AAD has been validated as non-NULL.

Signed-off-by: Marco Antonio Solis Segura <mshdevv@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 19758e2f5903..d75f60efb7b6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1194,12 +1194,13 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
-	tmp_buf = BIP_AAD = kzalloc(ori_len, GFP_ATOMIC);
-	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
+	BIP_AAD = kzalloc(ori_len, GFP_ATOMIC);
 
 	if (!BIP_AAD)
 		return _FAIL;
 
+	tmp_buf = BIP_AAD;
+	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 	spin_lock_bh(&padapter->security_key_mutex);
 
 	/* only support station mode */
-- 
2.53.0

