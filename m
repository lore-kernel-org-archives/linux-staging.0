Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631C713A251
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136306; cv=none; b=TvCyopqY/DlQHXLnenzexBBQOXM6XCzy3iUkZhwPCrMeEcBxDAlAmh29GU7T1QfPHV/PleIhKWt7LTlPbDA/AvsbXMhbxo1vYrhaYvNy1Rp1oHunopjUEFn6hNLR38VzkvQSwSk5W03F9rmuqbj1UzDCoZ+U7aGsztwYwbG653w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136306; c=relaxed/simple;
	bh=T8lAXHhEHXiLGL3ETUNkKXFoMHqYxZITdgqKthPPRAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cg6Ss65tVu6dTGb/rqTC7GZCnW2q3D/cEyzna9Ga+KE+kGsvgCjQL6xoumUfIqxMZABVWWx1w6/nQVTcg2ZVOB2Zpo3j0RE6upKt7NMy26BLBNTvqV3lnHo1sDdr3nBcXLyu42axim/vokSf5YPqrPRwsZD3Abdm83KNilzqEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=C3kCvqj2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="C3kCvqj2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d748d43186so27609495ad.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136305; x=1706741105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkLFSrZwI1mLWOk8tlT9qQKCr92CB+cIr/Ab2HCh9y4=;
        b=C3kCvqj2QPn65j9tN417vXqRzG85PIKtKOgb0AqS1nMoeZlqTgInPvoLEZYdFpqA+f
         KxTNqM5XOhObK5Bms4FiGJ5aOKFXkoCBdvwRWobLOV1X6oSKje1ZQ1Gl34Eu5VjCswcm
         PYw571MOD2nW+BfiNpr1LfOle8qpTVFdikZ91DzRVNp9GZofU8oWaEbaLVEEOS+D9oQW
         XN+mVQUzzfOs4/OjgJhyp8XMjfyBto32/drQPqNgBTGKA3rA5rLT9nW1i2aS0jdKVl3I
         0C7080UQYjP+56EA0Y+1BXxXqm/lSoY6QPLWQ0PPfH8gJLVvziE++0UZfslZJ4uSehnl
         4kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136305; x=1706741105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkLFSrZwI1mLWOk8tlT9qQKCr92CB+cIr/Ab2HCh9y4=;
        b=Pdi6nTyhv8UkHQGsWITdss8Xbe+daL8A+/hWUfdipmOX39ndhe4wg7enKQ/MqyvDkP
         PY4aYNIDVRSUChoOlV8o14DsFR48R7OH0gUnZYDgpYwN5pRx4kzuDumkF++apQf/BXmp
         rqGoE6CZTpPtVoXFPWS7MoaP94VRsK0prfjWFoD64uIKzu+o3hKmgtpGhvo1Vc5vUzSf
         OoZalp/WiagTfCfOpiJTHff9cwMJl2dFEU8T8uefjM54Mt680q31ScTKUTHR3m93M6sT
         HP+8g0TfqHsxxyJwBrLCbKwC6El2sgcZeqZSdPhKZPc4sOSv4U82TG11Q8vOUOTyRwgh
         XRhA==
X-Gm-Message-State: AOJu0YyBMX/lszfpdkBUuthxY9wUDsRzPiZ4o63eKywa8FH/YEZu5cS5
	wMGOyiD02zlD/ywpmpTZlL7xXKVlXUv3imzcGvFz6DImYgWffCM9iDdMMZGDiHR6+zSEKOjWS7t
	w
X-Google-Smtp-Source: AGHT+IGARAk/mAfacGPn7QsTncZe4CTVXvHB9y9nqos69NaacsWX/HzgYBBS4ug7vrtqPs1/d3i/xQ==
X-Received: by 2002:a17:903:24d:b0:1d5:b948:36a5 with SMTP id j13-20020a170903024d00b001d5b94836a5mr82360plh.95.1706136304829;
        Wed, 24 Jan 2024 14:45:04 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:04 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/18] Staging: rtl8192e: Rename variable SelfHTCap
Date: Wed, 24 Jan 2024 14:44:44 -0800
Message-Id: <20240124224452.968724-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
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

