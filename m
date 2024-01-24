Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2271137C51
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136304; cv=none; b=sNqLaFSpdtJLRZExoM0H5d0Hxums8N9rsT3lJaAnK04hP3XGJA/CURdHkcIuwAmK4hThFmQQk7VMBetfvFDt0Xe0XbmjX8gZ16I2FzoyJJpuBPuKOx4B1smJlKC7zyw384/3FovKgBlvwkenfFNowg5so3a98sMZF1Y31xNP+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136304; c=relaxed/simple;
	bh=zJcEGQUEJanJ9we3ahFFbmyhJwV1vhU8Jfa6Nz+VevM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NughapBlMgB/CleV7+paD7T7nawz2Nqx9FTjh0x6+dwedM2rOTyBkpX2H5HbTHvtLLbHtNgsOfUL7dkzzFUDwJzUN1UC5ZPYUOr9M/DzZsbaHHBu/Bkh+eBJ4K13Pp3oGzEU59V4MuWfl0M5nyIP2MNqRDTXqtqjwymGrBGI4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=kdd48tZ/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="kdd48tZ/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28e79182570so4570697a91.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136302; x=1706741102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+/HyYKXvtKh770pAaB0RJymXt6WVZx02f+o8iLBVC4=;
        b=kdd48tZ/+GBHBSOCvU7vIsQBrrBO+q3Izf+Nmvl6t4inpLiCYUpIGBCkE+vhA10A16
         SCmclQyreKS2EB1s1zFzitmYsW3xc5w28nnzbB6Jyf8hb1H4J7oBbAG9vZwyjlnMyHbS
         IQPHWJliIwfR95MVa9yQiu4DZhF2UGbfNJQYBUjI7u+3YDX3TP3TQ20vfbt/tIbevaFz
         iTbIAcmzfML3sNZ9SR7WoAAKBI935GLpJIM84ySXUVUofEU9tx1qHE8+TtMJeg/6Cyh5
         sQ7ILqQ7gI14Kz9ZK6KoRSEAVN8Ll7fAnrLxvHjEVjpb9JkucBsj4NxUlRYLS2fX6XdP
         IPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136302; x=1706741102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+/HyYKXvtKh770pAaB0RJymXt6WVZx02f+o8iLBVC4=;
        b=i00286E1MUON4x/WQdSelBNcI2CszN48VQPul7I0qnT/1QXwMroyDrlS6SL3PTH2zd
         +CWx53IZZJohY3Axo/agQeXBNo1yH7wgSBX0WUPxN81VQZPpX1XIuvAQVsabpOLo7H0x
         3VS2p8pSGjGd5TQSnkdd2l0/AHF+U3iTa4TU60HV0sYLkXZMsNJ/Oys0fkIa1OOXzW+8
         6pkXZ1AITJBNFQfapomhNhFQCwBDYWd5GGo4smfnF64ARUaJzIOv3tZfYBGmObgkUwPq
         5VwOGso7nwc12cYmRdqCYr0fJSvQ/A3gYp/ru0XlGpLYSwtmP+tTxaZwWR3PlLhRuqwI
         3iGQ==
X-Gm-Message-State: AOJu0YyiP0t7/xJKEzqbhAS1oH6KzuP8kJ8NmPtqWNUzjGCJ4e84ltuS
	lLTAssJ3Kt3WUwcyvUpzb8HpgjEg0fREWF8EJfF4Se0H0kOBbhjj2NfjAeIJb3jtDOD/21rdLqT
	2
X-Google-Smtp-Source: AGHT+IHECZiI21gXPyt14QRzAlAbWWN+sApWGys689uljb1M/8OSV5/22z9oHdid5jwxwNiUj/dbWA==
X-Received: by 2002:a17:90a:9417:b0:28d:6230:c1a2 with SMTP id r23-20020a17090a941700b0028d6230c1a2mr233139pjo.50.1706136302185;
        Wed, 24 Jan 2024 14:45:02 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:01 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/18] Staging: rtl8192e: Rename variable PeerHTCapBuf
Date: Wed, 24 Jan 2024 14:44:41 -0800
Message-Id: <20240124224452.968724-8-tdavies@darkphysics.net>
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

Rename variable PeerHTCapBuf to peer_ht_cap_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
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

