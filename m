Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D3E54BF8
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308307; cv=none; b=jVZox2fLxHoCHhmKtGK2M7UwwlFB+stD2N/Vd8jHKlN2sqvnoZUSQgmDCxVUVxb9IB0exbc2WwQP+yamLqbxLukESClsihWT6uv95O+K8qPVuNRUV36hw93uKauS8y1qEXkRTppp1D4qD+W2JK43/ThQJfvbIkv8QF5FV5pFX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308307; c=relaxed/simple;
	bh=XtpWpK60biwfi1ZmNMgdSH05iLHa2F1aZ4kMFo4ME/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PiPykP4r1LhEVZz8LGUYN0gZ1jLmSr0xjBxyXKINLHfEkvmW54BInC3k//uZKFUEVvBoqTUKIsFigM9RYq2BqPeTEzkrkqHKVy+cTA/NmFKJ+TvbBw0QTRpqkG+oRQilFqpPT+WhG1roPA30siu7xXU9iF9w93eELguiA15CDdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=UONMTfKp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="UONMTfKp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29041136f73so735099a91.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308305; x=1706913105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eua66fvQaSKTG5liL3X4G3GQFda8Y7Tc5FSILm4aWXs=;
        b=UONMTfKpH7+PyBToaN2Xj33QSATXo7CHoqJVxDziEr3fJQBPAmlxRQWcxwXpSQaCLG
         FGznhv2rMQOTLaDlcWjUVUyypoJ/alDZWLeK1TbMxQaNcWRMJ1YHLJcndez9/iyJzjTg
         Lgi/HQRmLwyuN+eDKzwE9fAUpJm5R0k75UuZLs0xI5f6wiig5QAaL9/GQp/W0ZV1Ssno
         5kj1WV9cpM9vIRvO2Y5FIJRkjQQb1F5ouRZxLbYFNiB64JuAw2xFpOpUBS/0Nguj6TFI
         Jk2ojbYnhc7p8+/MS1n/hjEnUt9BaxeJcqKt7HGDc+XPzr/mtwMHbge561CM++8FEzJT
         kW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308305; x=1706913105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eua66fvQaSKTG5liL3X4G3GQFda8Y7Tc5FSILm4aWXs=;
        b=Y7XvgnbjNFRLeIQK0PMMT87v0w20ODSCf+ZOr2rloIQ4+WDVaeNZmCEyOx8HKoiZLW
         cFq8VU35jxIpDwDfLDDKWWTGE1OR4i7xf6GF47uxU5j7vweuezDzGQVnMitSU8RQq81y
         lnglzaSNoji3CT1ldz4pqazayEjiFVER0DOiSUEuOCBlimIQZVeCNEagbMVEnUE0uE1n
         DnyGr+tpUMbouPkaVkD1Hw7LJ2f0DhPvKO0h/MHGHycRZZjbq0Pon81MEgH2sNueafR0
         aB/Oxn1qx0wQv54/LOOTLflzuomFq4ZYMvFKafU2DKBIphRXHnpXnL/6U+LeEpa2Nc+V
         VdxA==
X-Gm-Message-State: AOJu0YyiflIhmOWxJztMviKlad6oRhgJzio6yo3D8USqLS4aaZJ/XLn7
	qKCfY9GZGsGak4YOFOCT/pfX45ra/iTOmle5uiokqmlIW3pCIJOMEEMEQLLX668=
X-Google-Smtp-Source: AGHT+IG8SgMQ9KZ4+OiOFpIgxE+pj9h9DwnjOrrPCxw0Zx2olpC8QftFbeyQxVHjivDVHdGUAN0Jcw==
X-Received: by 2002:a17:90a:3cc8:b0:290:6b0c:2603 with SMTP id k8-20020a17090a3cc800b002906b0c2603mr544678pjd.29.1706308305634;
        Fri, 26 Jan 2024 14:31:45 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:45 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 10/18] Staging: rtl8192e: Rename variable SelfHTCap
Date: Fri, 26 Jan 2024 14:30:58 -0800
Message-Id: <20240126223106.986093-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable SelfHTCap to self_ht_cap to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 18dab893270f..a4580445305d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -98,7 +98,7 @@ struct rt_hi_throughput {
 	u8 cur_short_gi_40mhz;
 	u8 cur_short_gi_20mhz;
 	enum ht_spec_ver peer_ht_spec_ver;
-	struct ht_capab_ele SelfHTCap;
+	struct ht_capab_ele self_ht_cap;
 	u8 peer_ht_cap_buf[32];
 	u8 peer_ht_info_buf[32];
 	u8 ampdu_enable;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 98f0ac80f1fd..76f115f56680 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -516,8 +516,8 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 	ht_info->current_mpdu_density = 0;
 	ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
 
-	memset((void *)(&ht_info->SelfHTCap), 0,
-	       sizeof(ht_info->SelfHTCap));
+	memset((void *)(&ht_info->self_ht_cap), 0,
+	       sizeof(ht_info->self_ht_cap));
 	memset((void *)(&ht_info->peer_ht_cap_buf), 0,
 	       sizeof(ht_info->peer_ht_cap_buf));
 	memset((void *)(&ht_info->peer_ht_info_buf), 0,
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 545f79387991..60598b41fb9f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -728,8 +728,8 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
-		ht_cap_buf = (u8 *)&ieee->ht_info->SelfHTCap;
-		ht_cap_len = sizeof(ieee->ht_info->SelfHTCap);
+		ht_cap_buf = (u8 *)&ieee->ht_info->self_ht_cap;
+		ht_cap_len = sizeof(ieee->ht_info->self_ht_cap);
 		ht_construct_capability_element(ieee, ht_cap_buf, &ht_cap_len,
 					     encrypt, true);
 		if (ieee->ht_info->current_rt2rt_aggregation) {
-- 
2.39.2

