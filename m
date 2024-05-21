Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34876049
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261462; cv=none; b=Pfd6tHEdOAiTE5a7QStsd8q1kpjWUuErXHe6iCi1GBrlwGdfMqGZqoQI71UQNqcTvHj3JCwO4RcpqccZysTjuSj6c/6hQvbu5TUuDxV02Z7byIgTzFZl8mDbknzIK8845XaEufpxv06L7FMa43G1TCktobXrOL1oDGE8raLXlik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261462; c=relaxed/simple;
	bh=CuSkbWzRNmgEhaFefmBeplAIbDah/SxhcN3EtVvQ+Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8dfuKpvTYkzUL6m+ceZ5aGrjllrlEtPubCewWdPM2Aco4l//7FC13viAdRZEHTp6oMloRDCXUTZNyt0KtIAVyUzOuCNalQmS7Ex4K/T21mHPC6BK2BFnAyDC5vcn76B9LOdqxz5E6TBPRhtRl3rcGPY2TQ0i09xNBBQwqKFY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=cfib5vcc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="cfib5vcc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso96482745ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261460; x=1716866260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sIarUzF2tCuO5H11FbEf7IvlQmJwJFaix8anRhpZwQ=;
        b=cfib5vccEo2yzr67FKiaUHw/5LcNQMmv7UzC+jlChriEBuygNnjkfusdPW+P2TSfnA
         19zvk8LM7S/dTIrmHYcFKh+dwWGhlZgxNOtUSj1fZteBqOdFLWGpk5pLOekbftFo78pX
         CIYqWJ69FFHLfPRGlwUGaOY/HE1cYw6+RFBDRbjTIMmwBIhRuiu+0mk7pldIzFIz1HBw
         ceVpZvPt3Kcsmjqm8lnLLcDk/rZ9ulempfQ4R4Yul315TYx6lblstSLlTnmK10z0kHHd
         8rhaa0vnkJVUGUxBvPK7UxA3bYieaAF0t5le5Ssj8rBSbybUjAA47SFITDFOccIFpWpP
         iSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261460; x=1716866260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sIarUzF2tCuO5H11FbEf7IvlQmJwJFaix8anRhpZwQ=;
        b=JhiB1c0XHUTeQFZAHyZ566FmFsc1VQEAiLmMo063egi10tJUmxTpikcnrRNPiRomMQ
         MdF/dSm3pDzKaKEYXs8kWvgGcq9+6u0znQ6Ut1Ej6OsWxWQqRFPpRclLdM/X3ZS9A8J6
         HnKSnenbk9GMogqrVrJQQ6Qm5jEAEDWIpa04G6JjygD8qRc+e0Z5ZciFGzZTOgYLIKDp
         ykO3ICtekWAY4DKB02GnLm1jbUIn2+t9tf5dm7G7j1P0czSwH2V67b/r2ZXcUyzLvWhT
         ZEftfChQMPWnz0YoFt2He5ZrgNOigv6sW5Ulj7ZLoCMrieqnmzYEfu5blkWq7rTcoVKz
         ewCg==
X-Forwarded-Encrypted: i=1; AJvYcCV3X79WGEAc7GCa2NZm+dSn2nB5Hhk8XVnSMBsTZrHS1Q+5s3luGtkwrpBe5I6BQ/IPqv+NeCyzda8PLeUuOkuo49yqweeC7zYpBCfH/Q==
X-Gm-Message-State: AOJu0YxdjlKY0RMOjVLcc8OFBAUNxfzpzpn6r4DfYzvyuSWsj9sdCB/Y
	ivDRDgiwIrb5Gs3Ow7gBQQikmDb12deqXrDSEDyH3AY9VDrh3MEIpiLClADln+M=
X-Google-Smtp-Source: AGHT+IFVS9fZKUBesDxli8IK6MdEI1+1J7dFgtFOdibJVi6iwJ1Q2AG8ffB5ZIrhDQU89OpkPSdFcQ==
X-Received: by 2002:a05:6a21:1518:b0:1b0:9b7:bbe3 with SMTP id adf61e73a8af0-1b009b7c0d3mr22886121637.0.1716261460190;
        Mon, 20 May 2024 20:17:40 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:39 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 24/31] Staging: rtl8192e: Rename variable bMBssidValid
Date: Mon, 20 May 2024 20:17:11 -0700
Message-Id: <20240521031718.17852-25-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bMBssidValid to mb_ssid_valid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0914ba37f42f..91164a3b01aa 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -914,7 +914,7 @@ struct rtllib_network {
 	bool	ckip_supported;
 	bool	ccx_rm_enable;
 	u8	CcxRmState[2];
-	bool	bMBssidValid;
+	bool	mb_ssid_valid;
 	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 7e41519d997a..480d4bf8df4f 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1817,14 +1817,14 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->ccx_rm_enable = false;
 			network->mb_ssid_mask = network->CcxRmState[1] & 0x07;
 			if (network->mb_ssid_mask != 0) {
-				network->bMBssidValid = true;
+				network->mb_ssid_valid = true;
 				network->mb_ssid_mask = 0xff <<
 						      (network->mb_ssid_mask);
 				ether_addr_copy(network->mb_ssid,
 						network->bssid);
 				network->mb_ssid[5] &= network->mb_ssid_mask;
 			} else {
-				network->bMBssidValid = false;
+				network->mb_ssid_valid = false;
 			}
 		} else {
 			network->ccx_rm_enable = false;
@@ -2347,7 +2347,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
 	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->mb_ssid_mask = src->mb_ssid_mask;
-	dst->bMBssidValid = src->bMBssidValid;
+	dst->mb_ssid_valid = src->mb_ssid_valid;
 	memcpy(dst->mb_ssid, src->mb_ssid, 6);
 	dst->bWithCcxVerNum = src->bWithCcxVerNum;
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
-- 
2.30.2

