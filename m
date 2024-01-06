Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE419BA1
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="XYWk9LGP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6d9344f30caso178662b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520584; x=1705125384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1QdnX5i/KKMIr1vHd0oDppzxPgX4vgJKp2lY3tk4nA=;
        b=XYWk9LGP/IEshVSLTEP0njw4DavPwlT/6lW0dEewF6hoIkzCyqY/mYiZ7/rGhZnBdA
         oYrh7l7eQjb1+iDWiWZyGXELbtJlYh6g/u4RDV0PvmLQfJPhPKPnj8M/wSFfOM47SyxW
         JeroyZ72xB5Vh1RA4qRacqkGQnzFaz6sAGAJvtCtEgPAsKiGaaCjRWNDNdCz8S6rFtC5
         htXo3EtV3IOWMcWa7n9pCI2hCy2Y0W59RBfx2kHL+JRAcppWaPpsF/dzg+jt0gnNrdlD
         x0DyMIOwtXHy1/0RMnclTf+N2Ev+Q03BH7bX05f5KZmrDSIfSlnH8soorr4aYiTxwAXF
         B3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520584; x=1705125384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1QdnX5i/KKMIr1vHd0oDppzxPgX4vgJKp2lY3tk4nA=;
        b=k2qxO6eAuTkKTy3Dak9d3cC0hCnUCBZr5tf93yet2dESAh5KXhjfK2QgBHq+f03OG/
         45vmvSTxDiSqtpXmkSkvpIISVp1zZiv4Jnj3ti2xTpnsYSmwDmdMX2mMh0dvyp3q41Cn
         RCTcxo3lSLBNZqHU82VTfPs67mwQBCG5TH4oE5wVCVJImOyufm1TbYt/6/ZU/IkLYg+9
         Th1tg6LSU/+Sa+CmIExwW/0UuOE/hZykLYwoN+xWpm7WSLz12kzEWTnCcF6wmrSu7JSI
         doMnsLY4TdQdoytV4I4LJyig5+r75/znjkhGMeIOO/bn4goszf6ZZI5rXrpPs6p5Fqld
         ctrg==
X-Gm-Message-State: AOJu0YxlarnbW1LWtu5RPijFBd6ROkH0zekKZng6As15Dgs1Ka69step
	V+SueXhnJc0BvDmjotV6AmEwlcdqEN1+Uw==
X-Google-Smtp-Source: AGHT+IH0k1clmb4jvrGZp4/DBJjbFE52fY3Re8LQXd9KgAYP5jl32F18rb/l8goA95Tj/VarVRK1dw==
X-Received: by 2002:a05:6a00:3a23:b0:6d3:ab53:367 with SMTP id fj35-20020a056a003a2300b006d3ab530367mr842891pfb.33.1704520584716;
        Fri, 05 Jan 2024 21:56:24 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:24 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 19/21] Staging: rtl8192e: Rename variable PMKCacheIdx
Date: Fri,  5 Jan 2024 21:55:54 -0800
Message-Id: <20240106055556.430948-20-tdavies@darkphysics.net>
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

Rename variable PMKCacheIdx to pmk_cache_idx to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 5305486c9594..533af4b28aa7 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -700,7 +700,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 	unsigned int cxvernum_ie_len = 0;
 	struct lib80211_crypt_data *crypt;
 	int encrypt;
-	int	PMKCacheIdx;
+	int	pmk_cache_idx;
 
 	unsigned int rate_len = (beacon->rates_len ?
 				(beacon->rates_len + 2) : 0) +
@@ -748,8 +748,8 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (beacon->BssCcxVerNumber >= 2)
 		cxvernum_ie_len = 5 + 2;
 
-	PMKCacheIdx = SecIsInPMKIDList(ieee, ieee->current_network.bssid);
-	if (PMKCacheIdx >= 0) {
+	pmk_cache_idx = SecIsInPMKIDList(ieee, ieee->current_network.bssid);
+	if (pmk_cache_idx >= 0) {
 		wpa_ie_len += 18;
 		netdev_info(ieee->dev, "[PMK cache]: WPA2 IE length: %x\n",
 			    wpa_ie_len);
@@ -878,11 +878,11 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (wpa_ie_len) {
 		skb_put_data(skb, ieee->wpa_ie, ieee->wpa_ie_len);
 
-		if (PMKCacheIdx >= 0) {
+		if (pmk_cache_idx >= 0) {
 			tag = skb_put(skb, 18);
 			*tag = 1;
 			*(tag + 1) = 0;
-			memcpy((tag + 2), &ieee->PMKIDList[PMKCacheIdx].PMKID,
+			memcpy((tag + 2), &ieee->PMKIDList[pmk_cache_idx].PMKID,
 			       16);
 		}
 	}
-- 
2.39.2

