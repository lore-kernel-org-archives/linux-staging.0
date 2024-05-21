Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D3546433
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261448; cv=none; b=YRFEAOT/pxt2V2qPL6hp3Dnl7Gq7LCoaxlbtQVXJlUe6+Hw8lAWQmYrRU5jaZYtG3vlpdY/tbEaJJMQRcgidWOux/+3qcstLwKvbMh0CCqqLKnEB8Hr3aLgjv1QBj1AqAQQKxBuERkte1WYs1QCcfzC8AKtT3Emo997nk+EQrac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261448; c=relaxed/simple;
	bh=HAcGEyiHKCIG8JO/8aUs7l9AldiL5WVCu/Fjjtl3Q6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZrL4T4ZqKQBEjKwMlq2ctJtSKeX/B+fhRv5llbRsPNWaYI3cHYQUP/z6VSxelL/B5ggFZO9aNrePS/9yp+ReczpkzaddeBBOqyA96bnRpih9Q2xY3PBZ8ekJrQxGJtootkLMuTsBfe0L70x7ZtX2PI0rxez5IZ40YGKKMnSk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=mjZcrlsM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="mjZcrlsM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f3105f3597so1963395ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261446; x=1716866246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd9btt6pVE9LpJ5n8h41Qkxs4h4F6F4P2g3ly8ex9yE=;
        b=mjZcrlsM8kOBJTWoY+2JH1b8alltrUe5a8NLBnfAzKGV+fUVrmHMBBssvxGSXTdcZT
         7ZGA0o6JgGgKzZYd7e4xU0E2W0LYJ6p3JVdY3X+sYjOtGrk9qcEVSjWskiIKp+zeSoPG
         v0ksBnHyWnEkGYygnUUDzC2kc3w8xqApAG3i/GawLtwae/hgGHzgZzHcZsl7Ajdg42i6
         V0mLtvloqLXEeVNhXQbNMEZEmKRJ/ycrJwsfQnSTyF0gDhIrOZi/oKX5si3vlmR2jAPd
         t7+91UO0u/txi7VxwzzgkgVBD+lhhTNi+UXm1g/Q1rsRSNTFBRmmONNrkXe4mzT/MGDF
         BEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261446; x=1716866246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vd9btt6pVE9LpJ5n8h41Qkxs4h4F6F4P2g3ly8ex9yE=;
        b=hi7xlPoh8Io0ev4qMemdmfWBEqWcmLcQU20wfSUnQWMKJGeNyNo6ndT6yOqYM+GBbw
         gR4xaURRCcIFhltWdKdKmvNrQhNRaEfiys06Q7NNk+MOz2lRX8kYXSgzTOGQe04Ql6wH
         ywlwgvixmNc4VMIwDoix52TzopSE7/8O5KTLVpLRcQd+s/x+A8/Ub7J/b16LpSMhtFPP
         p7uTWGnEaF3mmj/Q2TiSDGnj2c8I2RqOjg8sVm1fAnsIF3xp+DcwY+U8RJeZCT816VXL
         q9Xi/os3ebiRpVqgKoOIDVow+wsoQs8ulMkIeiTt2t1spDIPjaKbIxp3Efwa0uVjRNpE
         vJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwuLCdj8GImCaPF6yBWaMB1HJqrUmGnvGrpx8m1cyoymILp989w/PQEH36JT60JPdFkZWQzLQWu5SBIiNdHOv1LNMA+ZboV4h4Phv9vA==
X-Gm-Message-State: AOJu0YyfW2g+rsigxAGM42QUvMdGhovmEbP1B2Gt91ZHukOoWgNc+mj2
	4xMNRhQAtpwSECET5OzDdPzyHuPhGoK/J0hIP0DPJHN0v1XeSSvuS3UO7pPqWQA=
X-Google-Smtp-Source: AGHT+IHeKS24eWCSBCMhzaXtqlNvcFXLY1ze4ihnnHNRG1rQx5z2MKpVvn9kkaMUz9VJXr/TqxzhJw==
X-Received: by 2002:a17:902:e809:b0:1f3:695:eeda with SMTP id d9443c01a7336-1f30695f16bmr35379215ad.61.1716261446316;
        Mon, 20 May 2024 20:17:26 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:25 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 06/31] Staging: rtl8192e: Rename variable MBssid
Date: Mon, 20 May 2024 20:16:53 -0700
Message-Id: <20240521031718.17852-7-tdavies@darkphysics.net>
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

Rename variable MBssid to mb_ssid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ce0cd1f557c3..7f1c2f49227e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -916,7 +916,7 @@ struct rtllib_network {
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
 	u8	MBssidMask;
-	u8	MBssid[ETH_ALEN];
+	u8	mb_ssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
 	u8	bss_ccx_ver_number;
 	/* These are network statistics */
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4e7c491c0aaf..c29efa3eef6f 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1823,9 +1823,9 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->bMBssidValid = true;
 				network->MBssidMask = 0xff <<
 						      (network->MBssidMask);
-				ether_addr_copy(network->MBssid,
+				ether_addr_copy(network->mb_ssid,
 						network->bssid);
-				network->MBssid[5] &= network->MBssidMask;
+				network->mb_ssid[5] &= network->MBssidMask;
 			} else {
 				network->bMBssidValid = false;
 			}
@@ -2351,7 +2351,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->MBssidMask = src->MBssidMask;
 	dst->bMBssidValid = src->bMBssidValid;
-	memcpy(dst->MBssid, src->MBssid, 6);
+	memcpy(dst->mb_ssid, src->mb_ssid, 6);
 	dst->bWithCcxVerNum = src->bWithCcxVerNum;
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
 }
-- 
2.30.2

