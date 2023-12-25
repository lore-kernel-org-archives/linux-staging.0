Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB69D53801
	for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="aDCe045g"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-203fed05a31so2783741fac.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 12:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703535798; x=1704140598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xES2C4UFSivAsOy1fJwWjUsPWGiW636trT7pF5WSYQM=;
        b=aDCe045ggUtBdn8vmjjbw1VMy5MmPkK9jAqx6W1dOGWQdLOx5djG7D3U2qoFGWfkDL
         KIrpgZGElxL2KUDxPHa1hP7rq8fUMUXz0rNcOYpiNvjQ6M9+sZtMA9pdSCBUh0kBNLYG
         ju+IEHA2Me+hJek1M/vytaqAbFWufGiER5JCbMmUoYS+anBAftuPFLXXO8PhQsNDAWMK
         r5VCuh1HMh+lJ/c1tPEAwhvBfZYeniYIwYXB2DLNgOGLzBqgtM5Hni6P7w1gjzHlJEgA
         58XNaGL4ky2PnU3NgS7eGjB0qQLjhxL0Jq/5QwFjPDON+VdOPLhUtVDfU1xYDeWqwwzr
         679g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703535798; x=1704140598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xES2C4UFSivAsOy1fJwWjUsPWGiW636trT7pF5WSYQM=;
        b=Mq+60zr8RwdS7YdXNjp0exybMmdPPhD1aMfOONWVpRR2G8KKU+7EoISOgJV3f9+/2p
         neKVETv11uFk/gP30dStRXfCCO9i7HPyXmXdMfwqcSfZTH72+weKURRiXUt7pCfQ6Zqv
         +ti6oyp9qQBp0G5NRvLPt8OjQ5eibb0/hJ3KQvpDun8csPx0ZZoeDaCwpGlwKP6jwPbC
         ed7/b3p99tBGcNd3rZDCHCTEiLpp/gSpNkd+n2pGq2BiVyMomY08IHKJD2itbhT7/zGx
         0+7IXglAtwWfctmnLXZC9PvmchcTKwSmyyBEwUiGBDsdRxDnVCKVwdE9+gNkOtNxvhCj
         iRQA==
X-Gm-Message-State: AOJu0YxqWmzqZsnwj92OPl+C5xLY8s9YTWbV+m3mSfBad3OFokN9UUVD
	WfVovYjKwBxHjW38uKTkoqHfJ9qHOVQiYw==
X-Google-Smtp-Source: AGHT+IF7OBbrlT9jJgpkWnHlNkkrsaCVZjchOFcCiovyn3qMojiUguo39t8NDykShONVHQekOzkuxg==
X-Received: by 2002:a05:6358:106:b0:174:f1c7:f9f1 with SMTP id f6-20020a056358010600b00174f1c7f9f1mr1367822rwa.37.1703535798602;
        Mon, 25 Dec 2023 12:23:18 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090aaa9100b0028be5732f01sm8741246pjq.0.2023.12.25.12.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 12:23:17 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/6] Staging: rtl8192e: Rename variable bUsed
Date: Mon, 25 Dec 2023 12:23:09 -0800
Message-Id: <20231225202314.31869-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225202314.31869-1-tdavies@darkphysics.net>
References: <20231225202314.31869-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bUsed to used to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d6cd0e0785c4..bace5dabf860 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1164,7 +1164,7 @@ struct rt_pmkid_list {
 	u8 Bssid[ETH_ALEN];
 	u8 PMKID[16];
 	u8 SsidBuf[33];
-	u8 bUsed;
+	u8 used;
 };
 
 /*************** DRIVER STATUS   *****/
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e3d51355dab3..3bff95a93650 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -670,7 +670,7 @@ static inline int SecIsInPMKIDList(struct rtllib_device *ieee, u8 *bssid)
 	int i = 0;
 
 	do {
-		if ((ieee->PMKIDList[i].bUsed) &&
+		if ((ieee->PMKIDList[i].used) &&
 		   (memcmp(ieee->PMKIDList[i].Bssid, bssid, ETH_ALEN) == 0))
 			break;
 		i++;
-- 
2.39.2

