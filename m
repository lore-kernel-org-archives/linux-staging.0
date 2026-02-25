Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E1328251
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009906; cv=none; b=u2FBa9m2Kg3jHw8rgh874er8H6uysF3WIiRkFp9kfC9DTX8rB3AL9iHv+ynabJcjOyLaSQet8NBXnqzOSCNLnfqCT4mpsM+WoiB5FIxoZET5vlamP9EDmvjlFNgprhm5qLMRDgGAFSbfStpT14h8e3xpNyX/7PLNCMElLiV8I5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009906; c=relaxed/simple;
	bh=697uyKGwb7webz5mIw3ot3T2MHsjbgnyUbupTtTvom8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c0Y9AHHffxprF3+gLPuCgGsA/rnBa1497EYYQ8DUhV1PvjCcDGKZuyRnoCSuFz9Pu8m9qnuA8dxtjCRfrN3PwqqVgAQ4VRhPUqr1PDPl4kHMBuR8LHwLGZ0TVAWv0KyuY8wuXybYyrWRvu+TZoB64Ho/CgVcdKBAVjvh13MYEec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJSKTIOf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJSKTIOf"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8230c33f477so2843634b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 00:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772009905; x=1772614705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmoEwLmgG+CkSf4mVq2kYDyZO67YlWqnEhiSs+hXKLI=;
        b=lJSKTIOfhqDvcfbzPIkwlc38upOWYeuN3w0oNNWjJfCO2lum4qdNtYHiSW8La93dEP
         EgP8cRNStG6M6K8eMUU50wdqqGTAoKjuRkwHGXbp+qq+W11zIZm7tO4M6JTgv9agfyMp
         JpJuQ2ZpD7x18Z1gNJJSPaFchf96ortVxYM1wYfa1lwmVqWaR2N6F/6e91Ky9egDgyA5
         4UABYWM7EYd2YhvN9M/rqRRPCIPiTAnsd+GAWCyIIICVwcvqNj/1+bB/4rwFplQ7wh+B
         gHHncqb8bOTAIer00sjNl5dCw5u6POEorV0mwPnhkbAQiZOZOvw9JS2iJs6JZ+15BlLp
         7sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772009905; x=1772614705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmoEwLmgG+CkSf4mVq2kYDyZO67YlWqnEhiSs+hXKLI=;
        b=CiEtActmerv54HF/cHb8H+rbmM3Gv97KqTmcPNq9Vrb4NvGV/L3VSB9/btgppSgiZ+
         WH8PDXDDUPQz0kFXoag3DkKSPrkZEBixIg3KgbmD7W0HagqbfFznQdupHAH2fItCyxUo
         9nSVnQRfjILOBqBJt3eps63lPNyHNwd7xnytNy11pOYzSxwYoIblWHtSAuGVORyCDm1a
         /zSC9Bqcpr4uRVYy0bkNRMH6PN3MB74YHiZiXPBns4wjTOizivaqI1tqDVLrx2dOgYDt
         MdFBgMqat+qAo/iRd+nT3NsINJ8W5i2nLhO+kZORmWXj2MGsR1QbjEU2xU9sjJ+jU4Iv
         xHRw==
X-Gm-Message-State: AOJu0YzP5rnZhqy7wPq12neMvDQ11lFewudM9XAnPnmGrkofBn+1SGED
	SM8T4TlnHH5DAq65KZGxvVDK4ZnKPXow8HSEWaFlpT2hugQtdoKqVUL+
X-Gm-Gg: ATEYQzxq2bf6Y6IKoniOWSQnvmLPDKYmiS9gkWK0/6HrsXrRn0HOjtW+iCI7tHdFxU/
	ajfEOBV4uZlFMc6C1d5n+GC0b/cdQd8taTHF7HCEm9WIXO48OLP9rcYYXfAMsstpfEBYF3bpgcK
	RV6nux/XK0ubM2LCCAU6AutK70uawcC9TpwAuzJyj9bVABt/MUDHLSQMd2jEP/Lx7Jd5O8mXCNY
	LocWPVu5ibcQVeb1I64Gvglo4GJxf4V+yc4GJ8BAOIJEowpZaqywzwohvlJ5Zxy1ztKMIfMRvYO
	mjcgSRWGbrvd0e0RTPooYaXfVDOaJyVbeLs568U2SC6fTqBej9+m6kgrwaPIDX8u6MUV3CoxASh
	o+9xRjDxsa39bF6JVjWtXaikENRooNUjziHT9nrr0veyNWzIujOwyLAWd+VeceDOtYMTe31eyHT
	WdKN75i9gxORD3f6hKPKEQt21x
X-Received: by 2002:a05:6300:408a:b0:371:8e6d:27fa with SMTP id adf61e73a8af0-39545f52506mr12202485637.47.1772009904568;
        Wed, 25 Feb 2026 00:58:24 -0800 (PST)
Received: from latitude ([122.179.175.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm13215942a12.24.2026.02.25.00.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:58:24 -0800 (PST)
From: Dhyan K Prajapati <dhyan19022009@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jason Donenfeld <Jason@zx2c4.com>,
	Dhyan K Prajapati <dhyan19022009@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix function header alignment
Date: Wed, 25 Feb 2026 14:27:47 +0530
Message-ID: <20260225085747.9639-1-dhyan19022009@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed header alignment in hal_sdio_get_cmd_addr_8723b that violated
kernel coding style, cleaned the header by pulling arguments onto the
same line.

Signed-off-by: Dhyan K Prajapati <dhyan19022009@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61..18eb50c6f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -13,12 +13,8 @@
 /*  */
 /*  Creadted by Roger, 2011.01.31. */
 /*  */
-static void hal_sdio_get_cmd_addr_8723b(
-	struct adapter *adapter,
-	u8 device_id,
-	u32 addr,
-	u32 *cmdaddr
-)
+static void hal_sdio_get_cmd_addr_8723b(struct adapter *adapter, u8 device_id,
+					u32 addr, u32 *cmdaddr)
 {
 	switch (device_id) {
 	case SDIO_LOCAL_DEVICE_ID:
-- 
2.53.0

