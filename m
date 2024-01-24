Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD51386C4
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136305; cv=none; b=Q5GZJVC2L6CmWIH7MbiJhj/dguChZlijKkwQsraK5/1BV7SkWmlykPezSGIoF4CWDvaOQvLKP8SQowD68P05mDAAWJfxH5sFHDsuOQmguQa/ZJD0V+vm7vU+C/WT/2Eiwt8t/c8oR2mh6SKzSnGMX8HPDKpOQzhZEjxWMPDMdFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136305; c=relaxed/simple;
	bh=D9k18Awv+U2dEMlY5zBqAz1WwWpla93wLTyXIuHu79o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sj9DLuLx2I2QQuDHn5pnsm6pBHMf9z6NiFQoUQGpK1tg8wvkNCWHJDnUroeGJhEkO8kRN22pBmobvglG/9FrIsZwp/3SaQ2Dok76Z67JaQcJANW8qHj8Q9rrVhciQbZ3xnArCzg4WS4VTiUtwGL1F5g+KAt+ZmB+zoNyay8tvog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=OJi21cMT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="OJi21cMT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d75c97ea6aso1137405ad.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136303; x=1706741103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LRZsfdwfrORDxZGKvig5TSB0A65chM/WW3zBOa9jbg=;
        b=OJi21cMTnm6SPGA/M8ZG+LkFxT1WgkqCx1yc0R2CfY3+/6mPv8o4aMuze/hjfq/xks
         mIW33VexDldc7id72fM2F68ilpIlOFLtZNwWz0CQp7507Ow6husCPU3jgf3cq5+rSk5Q
         dFYQpzebFyFzNTsP3651PT90Z6vpU6C1cy8RZtxJJMx2NAIK87jMYkwOB1Nf0hfjm8JZ
         OYbQWqAsrmsW5Q2N2UiwA7alwdlOcNr48mGF8mlpPBvD2Iv7rN4gULFnxLuN7Nesok7e
         fo/F0IxfypgAjjhYnw9R+3kZldT/AoPXLiHTJF0ZoL+U+yLML3IE4WZairUAPGSBEZEu
         0bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136303; x=1706741103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LRZsfdwfrORDxZGKvig5TSB0A65chM/WW3zBOa9jbg=;
        b=RBQ05OIwJfJBlDLRjHA6XeTfKTjlpQz73yAHLgocbQkjIOgHK2EVKYwnAnUKJaCvgb
         0tdX/fEU39sXNlprVX8n036yOaqmbabNLqx9VXcVAsUXNZRg/lGbJC9F8hVWXFmSHTRU
         6Kg9wolWatPgYc0CHjnAFJrdxx1uuIFcJKukLaeN5m/j8zJZekWVXx9DS9O5uk/ORfBa
         8zSGAMmLQb4sBGHd3VwxrGyh5D5ofjssyJaG50ZI/7uBTEcgVFkFf/tDTi7E1fiHWg14
         l+P6C5+aHjS0ldAE0UkAPCHTWMzhZy3Gk2M8NOWVKOfjemAjLWq8e6X/Sv1FpnH15F4D
         syRw==
X-Gm-Message-State: AOJu0YxeRpLzkgQNz/GGQG3DT7g2QvH9KRgKpYa7y3wGcShRivc5wQJW
	CXv+7SuvvrQvLJ57JJEYWPrE2p2FFsM3SQbRhUd4uHf/WQMTXzve7Oz6BZ1gVyo=
X-Google-Smtp-Source: AGHT+IEY27lzmdA2Ee4fGHWMp3iV2kWGGYcxqXR9yHlBYLPOximp6zNF+uanQXJukAI/fN9pbTsEvw==
X-Received: by 2002:a17:903:24c:b0:1d0:4802:3b6c with SMTP id j12-20020a170903024c00b001d048023b6cmr64595plh.4.1706136303355;
        Wed, 24 Jan 2024 14:45:03 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:02 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/18] Staging: rtl8192e: Rename variable PeerHTInfoBuf
Date: Wed, 24 Jan 2024 14:44:42 -0800
Message-Id: <20240124224452.968724-9-tdavies@darkphysics.net>
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

Rename variable PeerHTInfoBuf to peer_ht_info_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib_softmac.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 29e1206078fe..18dab893270f 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -100,7 +100,7 @@ struct rt_hi_throughput {
 	enum ht_spec_ver peer_ht_spec_ver;
 	struct ht_capab_ele SelfHTCap;
 	u8 peer_ht_cap_buf[32];
-	u8 PeerHTInfoBuf[32];
+	u8 peer_ht_info_buf[32];
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
 	u8 ampdu_factor;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index cea3284dd787..98f0ac80f1fd 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -442,11 +442,11 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	else
 		pPeerHTCap = (struct ht_capab_ele *)(ht_info->peer_ht_cap_buf);
 
-	if (!memcmp(ht_info->PeerHTInfoBuf, EWC11NHTInfo, sizeof(EWC11NHTInfo)))
+	if (!memcmp(ht_info->peer_ht_info_buf, EWC11NHTInfo, sizeof(EWC11NHTInfo)))
 		pPeerHTInfo = (struct ht_info_ele *)
-			     (&ht_info->PeerHTInfoBuf[4]);
+			     (&ht_info->peer_ht_info_buf[4]);
 	else
-		pPeerHTInfo = (struct ht_info_ele *)(ht_info->PeerHTInfoBuf);
+		pPeerHTInfo = (struct ht_info_ele *)(ht_info->peer_ht_info_buf);
 
 #ifdef VERBOSE_DEBUG
 	print_hex_dump_bytes("%s: ", __func__, DUMP_PREFIX_NONE,
@@ -520,8 +520,8 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 	       sizeof(ht_info->SelfHTCap));
 	memset((void *)(&ht_info->peer_ht_cap_buf), 0,
 	       sizeof(ht_info->peer_ht_cap_buf));
-	memset((void *)(&ht_info->PeerHTInfoBuf), 0,
-	       sizeof(ht_info->PeerHTInfoBuf));
+	memset((void *)(&ht_info->peer_ht_info_buf), 0,
+	       sizeof(ht_info->peer_ht_info_buf));
 
 	ht_info->sw_bw_in_progress = false;
 
@@ -579,8 +579,8 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 
 		if (pNetwork->bssht.bd_ht_info_len > 0 &&
 		    pNetwork->bssht.bd_ht_info_len <=
-		    sizeof(ht_info->PeerHTInfoBuf))
-			memcpy(ht_info->PeerHTInfoBuf,
+		    sizeof(ht_info->peer_ht_info_buf))
+			memcpy(ht_info->peer_ht_info_buf,
 			       pNetwork->bssht.bd_ht_info_buf,
 			       pNetwork->bssht.bd_ht_info_len);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index aa98d22db90a..9ee6364f7b00 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1609,7 +1609,7 @@ rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 				memcpy(ieee->ht_info->peer_ht_cap_buf,
 				       network->bssht.bd_ht_cap_buf,
 				       network->bssht.bd_ht_cap_len);
-				memcpy(ieee->ht_info->PeerHTInfoBuf,
+				memcpy(ieee->ht_info->peer_ht_info_buf,
 				       network->bssht.bd_ht_info_buf,
 				       network->bssht.bd_ht_info_len);
 				ieee->handle_assoc_response(ieee->dev,
-- 
2.39.2

