Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9A50A8B
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308305; cv=none; b=ivULKIj20g2hsjjUb3tInDkdSmaX0n0ZesYS2pHL4bVoX5R8QDICiGFLh4dzo+9xBlKZj4uaHDN8RJa9eUd8sTGp4dEo2slhOjj7B1BfxHG/ODUB3droosXm+dsqG/RMQJTZkZugSTbnrsSC3luHblfsc3N4YgDsJLapovK/kpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308305; c=relaxed/simple;
	bh=4eD0zWr2QDQ7SdfNZ8wki3VUresfEX2VZTryP/dcDdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b/eZywG8wZcCgPGwM3tpZvm41K5hOXru377HIJtGeLOE9yvBW7YOe6tKmQxiwOyFl+W2IWKtBV8JpdHtB1zwGVAbrkpxEZdsuWplmdnSPGpGHNLcXsthtckmOFq9uhT2slmjvO8VviZeZdHStVtbWzET75/mOQNrXKcAXO0ghsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JWZVp9Y6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JWZVp9Y6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d76943baafso8264975ad.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308303; x=1706913103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPBwdmqwxN46G+anfF19y+aU22YsXkVedyuw45vTXGw=;
        b=JWZVp9Y6WL83gl1sKOR4fHVegeq1qAYPNnK3vh/enLOuRaeObuX/jELkjGAXqax6TX
         1iXp8gbqeeVebWgMoc+11w0nbEGtKh32Vog8N5e6XvZMqq5ZW5tQyjaTZB/6nnupiCu3
         ccZYssJAVTGp1S++WLH2eQc2iFnexLXTwtl/UPvAQHlvC5H5JrjcJOavBqRM9uHsH9wa
         3yE9rsjAMBjj7/TgsC4FF3zXnBg6gIEVoSshUydXLMQJGBHj62054rNPiUDHkMpBAYv5
         UUnRf/Mozi2PVR6HRSOxMM47KrzCvyxXw78gT0dzkgP3pxOKG1Gl7PXIa2f/ZUwfAxo/
         kPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308303; x=1706913103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPBwdmqwxN46G+anfF19y+aU22YsXkVedyuw45vTXGw=;
        b=JJHYvl7SsaQoqh7669aYpRq8tbs78JN5AuAVmOgAVA/WFG9Z567217Wn5r9bQMKY/q
         ZSg+kQm7ftg1DMP489x5lhZeFNWNoaTYvgFBJdXKNUMT7DIPO6n6lqbZuoNDRMq79R0W
         Dug+h6k8GC21S+NK6rlADl3a95ppoAM/P4LdI0gX3NPlSWdnPmWiArwTcI3QkN/X3Fyp
         wUfyDYQ7+L3t3dsQb8olrDFYFPlKnPuIQPns+BmhnPTVlF/4fNC+0NWoDWBUxYbb4BiC
         SkES4f3T7glYqzFEPj2Zuvc7InxBiaxL/Ljb95Ovebecf0NWfbD3kFF6js+aRY3ET+wl
         A3Ng==
X-Gm-Message-State: AOJu0Yyxixhz76vJUi6oRmMfdCt12DDU99IQKTklbJ8dFeRrUJYdAyD8
	xmDScoYroV1epGTO+WvTLqm/4tvRiGHvzx6/ZqPjZdXAR4Ra/LP6rFyJhDp7AbU=
X-Google-Smtp-Source: AGHT+IES78eHHfi74bkNkTCu6OPx/Epr2IPdRTatLFXIayhQKhvIar4Qf68ZGihQYosZPrUBW6g7GQ==
X-Received: by 2002:a17:902:8501:b0:1d7:3067:aab5 with SMTP id bj1-20020a170902850100b001d73067aab5mr437589plb.57.1706308303163;
        Fri, 26 Jan 2024 14:31:43 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:42 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 07/18] Staging: rtl8192e: Rename variable PeerHTCapBuf
Date: Fri, 26 Jan 2024 14:30:55 -0800
Message-Id: <20240126223106.986093-8-tdavies@darkphysics.net>
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

Rename variable PeerHTCapBuf to peer_ht_cap_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib_softmac.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 68577bffb936..29e1206078fe 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -99,7 +99,7 @@ struct rt_hi_throughput {
 	u8 cur_short_gi_20mhz;
 	enum ht_spec_ver peer_ht_spec_ver;
 	struct ht_capab_ele SelfHTCap;
-	u8 PeerHTCapBuf[32];
+	u8 peer_ht_cap_buf[32];
 	u8 PeerHTInfoBuf[32];
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 6d0912f90198..cea3284dd787 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -437,10 +437,10 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	}
 	netdev_dbg(ieee->dev, "%s(): HT_ENABLE\n", __func__);
 
-	if (!memcmp(ht_info->PeerHTCapBuf, EWC11NHTCap, sizeof(EWC11NHTCap)))
-		pPeerHTCap = (struct ht_capab_ele *)(&ht_info->PeerHTCapBuf[4]);
+	if (!memcmp(ht_info->peer_ht_cap_buf, EWC11NHTCap, sizeof(EWC11NHTCap)))
+		pPeerHTCap = (struct ht_capab_ele *)(&ht_info->peer_ht_cap_buf[4]);
 	else
-		pPeerHTCap = (struct ht_capab_ele *)(ht_info->PeerHTCapBuf);
+		pPeerHTCap = (struct ht_capab_ele *)(ht_info->peer_ht_cap_buf);
 
 	if (!memcmp(ht_info->PeerHTInfoBuf, EWC11NHTInfo, sizeof(EWC11NHTInfo)))
 		pPeerHTInfo = (struct ht_info_ele *)
@@ -518,8 +518,8 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 
 	memset((void *)(&ht_info->SelfHTCap), 0,
 	       sizeof(ht_info->SelfHTCap));
-	memset((void *)(&ht_info->PeerHTCapBuf), 0,
-	       sizeof(ht_info->PeerHTCapBuf));
+	memset((void *)(&ht_info->peer_ht_cap_buf), 0,
+	       sizeof(ht_info->peer_ht_cap_buf));
 	memset((void *)(&ht_info->PeerHTInfoBuf), 0,
 	       sizeof(ht_info->PeerHTInfoBuf));
 
@@ -572,8 +572,8 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 		ht_info->peer_ht_spec_ver = pNetwork->bssht.bd_ht_spec_ver;
 
 		if (pNetwork->bssht.bd_ht_cap_len > 0 &&
-		    pNetwork->bssht.bd_ht_cap_len <= sizeof(ht_info->PeerHTCapBuf))
-			memcpy(ht_info->PeerHTCapBuf,
+		    pNetwork->bssht.bd_ht_cap_len <= sizeof(ht_info->peer_ht_cap_buf))
+			memcpy(ht_info->peer_ht_cap_buf,
 			       pNetwork->bssht.bd_ht_cap_buf,
 			       pNetwork->bssht.bd_ht_cap_len);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c231e7acd606..aa98d22db90a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1606,7 +1606,7 @@ rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 					kfree(network);
 					return 1;
 				}
-				memcpy(ieee->ht_info->PeerHTCapBuf,
+				memcpy(ieee->ht_info->peer_ht_cap_buf,
 				       network->bssht.bd_ht_cap_buf,
 				       network->bssht.bd_ht_cap_len);
 				memcpy(ieee->ht_info->PeerHTInfoBuf,
-- 
2.39.2

