Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107C10A3B
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345274; cv=none; b=ikenGP35TOQAiAk5kWCQmQXOl2mTbP05C+4uBZOHggpIs2JwQuJaeRAn+zrhJe9O2x+7nYTaPwNYwg/lTLUJGkxHZ0NGPjv/c83xa44oSQkGYjDUbMuerALlRGMbIvMh2crBB+Bjcgdm80qtVv9zBupb1wcPdDTzzP8XbUo4cPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345274; c=relaxed/simple;
	bh=l1N7ppwQAFsdyrxlamyLKMlCpeI3ctv4JREfJWzeHj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gMnwuJaNWQjn1VnO4zbftZPNaCFWy8SPGrCoFFcVmYMgEt+ql/CxmSIkWVRNF8SVxeFQUtpPJxbCpjeZ9gln7dXGHUAnpFHHBaGOChPvIRmoXisEZOK/gSOA5RKn0oTSBNPb9UUgl+BtVC36VOCYb2b5hk+ggM0ya/Uu1hyYKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=B3y5oaN/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="B3y5oaN/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ad8fb779d2so3234919a91.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345271; x=1714950071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KENCVx6uegL7ew41ijCYKGsXuud/xPQNe/tRNshJuk=;
        b=B3y5oaN/GAZhkLYTkkH/Be0VWn48Ty+MK1klqp6o3hRZZPMzehHJ7Il0nwG/cL2QSK
         CBdIMuy+2E8+RRCUlb0Tpqo3IGFDqcHXXBmXfVyGGAq8ePw0l6Au15OK3NnsOL6zdU1K
         9x30kZglPU1FhrRvuIFqEnHToaWqVFoOawmMfEyknieEbmBrSohCS8Kp4gZnurok7oZR
         a0iyPtxFSQobnh3StiuCdL5Xs5cV2rdHy9/bePHxhtWAFF9lseQ4wXQzbpnoM1FMTr5w
         rDhNQbPoKG3H1XZSbJ1169Fr6wLMQu6ZN+ejmRGm797qCpglKt5pkcsMSk4Talg12fle
         126A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345271; x=1714950071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KENCVx6uegL7ew41ijCYKGsXuud/xPQNe/tRNshJuk=;
        b=FXMB7bn3jxefPUUIEgHvkHjZ1k/NKhvG4jcDa6zQN2dBK+znWf2F2aWNKkoxAVKyuA
         yoQUT9gsiMJSloAonpOSorGc10H40NZgAkgiFlXg+98uCQ9eMAKWhkWaLAQ5UcSFCp8x
         p9700tNJISygWOTQJgsYd3OtvTCn3pTdWJT3bosEqqteoWtBb5zV4CGwBTQM4Yp3s6gm
         bhE1KYFyFkdYrNtgKiYb2opvvkRU13hslnFtUGdqxmCLYiVkbFPYaEmJpB71J4x7S/WA
         AIGAJCAwJsDpJ1/IyUK/ujvwKMggZNvQzHZJtYY0cFMXEO9e8tMyUqUBKowfrjmOYgNg
         U3+g==
X-Gm-Message-State: AOJu0YwiVWUS/6sXKplTZveSi/zB3sCQE69AjbgQrDG3LOrm88MPBtOF
	+CLXblS8YsxTeOuR6JzjAn6LnG9koyblCLoR8XHmXF6jkWqtE2mxQWdkloGTFsQ=
X-Google-Smtp-Source: AGHT+IFVEu6gQBfsHHhNIwJLCMTct8XdvZOfNrf8MZU2TBod0vCG9bXbxCA+vqYoaWeprrpR86u2UQ==
X-Received: by 2002:a17:90a:1548:b0:2a4:b9db:acf5 with SMTP id y8-20020a17090a154800b002a4b9dbacf5mr7428162pja.24.1714345270986;
        Sun, 28 Apr 2024 16:01:10 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:10 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/18] Staging: rtl8192e: Rename variable CurrentAMPDUFactor
Date: Sun, 28 Apr 2024 16:00:50 -0700
Message-Id: <20240428230106.6548-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CurrentAMPDUFactor to current_ampdu_factor
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib_tx.c      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index eeb5a5eb94be..b789d0f17156 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -104,7 +104,7 @@ struct rt_hi_throughput {
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
 	u8 ampdu_factor;
-	u8 CurrentAMPDUFactor;
+	u8 current_ampdu_factor;
 	u8 current_mpdu_density;
 	u8 forced_ampdu_factor;
 	u8 forced_mpdu_density;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index e82e8c50c090..3982c37f208c 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -470,12 +470,12 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 
 	if (ieee->current_network.bssht.bd_rt2rt_aggregation) {
 		if (ieee->pairwise_key_type != KEY_TYPE_NA)
-			ht_info->CurrentAMPDUFactor =
+			ht_info->current_ampdu_factor =
 					 pPeerHTCap->MaxRxAMPDUFactor;
 		else
-			ht_info->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
+			ht_info->current_ampdu_factor = HT_AGG_SIZE_64K;
 	} else {
-		ht_info->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
+		ht_info->current_ampdu_factor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
 						    HT_AGG_SIZE_32K);
 	}
 
@@ -514,7 +514,7 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_40mhz = false;
 
 	ht_info->current_mpdu_density = 0;
-	ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
+	ht_info->current_ampdu_factor = ht_info->ampdu_factor;
 
 	memset((void *)(&ht_info->self_ht_cap), 0,
 	       sizeof(ht_info->self_ht_cap));
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 54100dd81505..1aeb207a3fee 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -313,7 +313,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 		}
 		if (ieee->iw_mode == IW_MODE_INFRA) {
 			tcb_desc->ampdu_enable = true;
-			tcb_desc->ampdu_factor = ht_info->CurrentAMPDUFactor;
+			tcb_desc->ampdu_factor = ht_info->current_ampdu_factor;
 			tcb_desc->ampdu_density = ht_info->current_mpdu_density;
 		}
 	}
-- 
2.30.2

