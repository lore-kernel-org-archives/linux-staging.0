Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D5C2CD
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="L7Ns3JCO"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9b050e88cso114599b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520577; x=1705125377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTFfC6a6+CdPfuYQ6OOPrqm2TNcAcxQiTaVsILJFR48=;
        b=L7Ns3JCOVwxX1JfDIxA2B021GOB9jsWfOYj/ETDc6H+n2SiRO0rdvRfqcwHCFoxnkE
         kgHztcn8az6yYLdmAwVBy3PdLdu2PfMMu9W2s1BNcziKq4hke2Sw158+McPwFid4m1pL
         pFEUiCBIqWIokN7VY9sB1qP/tybcBDVzoxOQ/HtFL4gvlCYU7ObhA3HtDPovYsYrJ02X
         rk4Hd2vrhIMKGHq3WkhTEGharMwZzjsk929+sa7SbXOb6mzhcOG3o/PFd4RxiWnc5v41
         ROf3ATQS4nbgRV6Us19SbBrHCoVeAfxdl9MvGVnMz6DmRkHbkr8xu0B0hQBssxzBXrw8
         gdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520577; x=1705125377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTFfC6a6+CdPfuYQ6OOPrqm2TNcAcxQiTaVsILJFR48=;
        b=nT+2PVAYds1GnPZJtC7LJtrcADfuIg4jUWSRvqOzpyHFjWaX/4IaWvgQwpZWPFRXFt
         aaeHAhFHQJ0KuGKoTn389ezQBpWw1/ggrHbS3wIh5cEK0hQK/l0rXwt0cVm5jBEiw6EV
         CkU3FsRCGe4vbI4PnFMGVA+40NnEfXwKe9ABYh2wA/Tk1rYl30NnL7P8B8a3YLA/8g3Q
         4uENllGT2aLfvjHvZHs5wo/XqRXE6s60sEOm+Vbt4cLhQksdn6CjitxWESIviaGOxM5N
         flMdawAkuFnOJ3aS9ydLUG/QZY25tvuqDQ018o3tVfPMAzhxfAmeGv3BoY0Y1mvPPTxz
         CbSg==
X-Gm-Message-State: AOJu0YwCzWrWXj7ErSrdDdA0MHlcRXcRKqw45HB/UHUCSnpfNMVkiQUm
	ge5foLFGHeBTbkjAOQig8eU1rryDNCmSZA==
X-Google-Smtp-Source: AGHT+IGxcLHolKb3fWB6F0W3lmgR06VsfPutLh4diwag/oXBpU4yoCXymddOT/bx1gTLlEOqcwj3qw==
X-Received: by 2002:a05:6a00:1306:b0:6d9:abde:a803 with SMTP id j6-20020a056a00130600b006d9abdea803mr161631pfu.34.1704520577416;
        Fri, 05 Jan 2024 21:56:17 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:16 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/21] Staging: rtl8192e: Rename variable array Bssid
Date: Fri,  5 Jan 2024 21:55:46 -0800
Message-Id: <20240106055556.430948-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable array Bssid -> bssid to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 35c66ecd20e6..f379819287b4 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1161,7 +1161,7 @@ struct rate_adaptive {
 
 #define	NUM_PMKID_CACHE		16
 struct rt_pmkid_list {
-	u8 Bssid[ETH_ALEN];
+	u8 bssid[ETH_ALEN];
 	u8 PMKID[16];
 	u8 SsidBuf[33];
 	u8 used;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 98c1041214fb..8fb69fa09cc2 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -671,7 +671,7 @@ static inline int SecIsInPMKIDList(struct rtllib_device *ieee, u8 *bssid)
 
 	do {
 		if ((ieee->PMKIDList[i].used) &&
-		   (memcmp(ieee->PMKIDList[i].Bssid, bssid, ETH_ALEN) == 0))
+		   (memcmp(ieee->PMKIDList[i].bssid, bssid, ETH_ALEN) == 0))
 			break;
 		i++;
 	} while (i < NUM_PMKID_CACHE);
-- 
2.39.2

