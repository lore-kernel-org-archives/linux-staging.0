Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8CB56B79
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008944; cv=none; b=eEvjuJR7GEeO8RVh4rw38zQruFSq2MFKk0V8V0LN7EZ5Z51dU3AFhKWpHeOFAxihVtNnfyzxgy46d1ligVjdDG4gZVvyttrFn+fH3L3VHxSEycG96fpU52pAOgd9IzsMZEv4Z3OfwMuKHJsUdB5hKes3KHWxH3+K0+WUBLIkr14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008944; c=relaxed/simple;
	bh=bNKFW16BidmmMvctJ8NyRmFBNLMdol6sf4IGgmQJVQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GVdceawo7VN9sONRmjOqOltdNgTBg+DCadFm2q0LgF1OwLrdVOXlCl28E7yRDlh28p4IDKUu9zBjMdwMgdf8wJNeMmVeniMF4JoP2HR2qeO8F719oE1eaxZR9LyU6kGDgUp+mIW26q2x2hj/y1uEaecs7IbJ7bmbWz4CtR4gqrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=U3tRHmBV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="U3tRHmBV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e53f3f1f82so832117b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008942; x=1709613742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqBZMfc9TcWxWN2N6/CKR72slOlM+2jmQfdd8IyQ3bE=;
        b=U3tRHmBV6FHPuzCPU+aEti88aP0v3z2JYkE16Wj0UFaAaEjkWI/Zvt+ZJtAcyC7C72
         CePrzyXJaDTjd/3sUa730HnfoxipJMb8x0p+fh2mNfThbdATLTtU5NMumRwCvzdGdEzQ
         XNItnsodHzeF2A0dRHKsNyhdN3eJ194JskJV2vQCaxZHHeUgwCkVxjYRLmO8YCCYFuyP
         sxKfhOcxxuLt972Wt35b8xP4kNrgdUyurhWYlrTkbWewZ295vVRs/rr8h9dGBh4Xicxc
         eTYGMqdPaU7p63rPYLxYUhBFBaap4GzDcLc+vxS3ZNshrGHTvT2AHzZPQ/o4cAiDbCys
         f/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008942; x=1709613742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqBZMfc9TcWxWN2N6/CKR72slOlM+2jmQfdd8IyQ3bE=;
        b=dLd1vRdGiKdgs8u4J5rZlNNuq9lSRPrRYNsUBwqOblRKuyvKkd7GdrlO/z2AfVSlqx
         xwe+Y4gENYB0+ByzKZyuNxdL4N+/TKMZcNzpr6iJtLRMRt6/W34IN9jSprTlfZzCaajb
         SyR+i1+s3b5xDR3Rx2vylKRolM+q5QQsvv6Wjjl2Jf3o4MS6WahyJPLBhRkjuXBCiWyV
         iKr1xotPIU2XHCi/iNBtCHRBw0zhlf7VCVmjfxkQX6zjGeaL+aJs6itJlphYbowQ8Tsp
         MZmRcbYd0J5523uq6Mv4TpoQGKR9QD7kmFJNynsQUmgiWnzx9XIHU7Y1eXwvy14xpygA
         S7vA==
X-Gm-Message-State: AOJu0Yzdsym0aKf3GkSMqJ3225J/kwlq5N9h3tN8kXuN93rrECzR7qTK
	c3eH4GacL0b1oT1kxuIbcRBTRB3fwmpC70x2SYZgQ6cc8n7/dPzMurbXqA0i5SPycu4Cu/1URWR
	Q
X-Google-Smtp-Source: AGHT+IHPCfzBYlJq3/M3PZeubuEqm6AM4bbV4VXYgcRmyWF20MODxPVC8i20oXf1F+ZCrvFpJtHMhQ==
X-Received: by 2002:a05:6a00:1a86:b0:6e4:6ca5:30b7 with SMTP id e6-20020a056a001a8600b006e46ca530b7mr9827765pfv.34.1709008942466;
        Mon, 26 Feb 2024 20:42:22 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:22 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 19/20] Staging: rtl8192e: Rename boolean variable bHalfWirelessN24GMode
Date: Mon, 26 Feb 2024 20:41:56 -0800
Message-Id: <20240227044157.407379-20-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename boolean variable bHalfWirelessN24GMode to half_wireless_n24g_mode
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 59110da6c4f3..cc7764707e61 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1937,5 +1937,5 @@ bool rtl92e_is_halfn_supported_by_ap(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
 
-	return ieee->bHalfWirelessN24GMode;
+	return ieee->half_wireless_n24g_mode;
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d2f192fa9304..8e2f27b98f30 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1264,7 +1264,7 @@ struct rtllib_device {
 	int ieee802_1x; /* is IEEE 802.1X used */
 
 	/* WPA data */
-	bool bHalfWirelessN24GMode;
+	bool half_wireless_n24g_mode;
 	int wpa_enabled;
 	int drop_unencrypted;
 	int tkip_countermeasures;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c335b24fa08b..afa789fd1266 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1684,9 +1684,9 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 		if ((ieee->current_network.mode == WIRELESS_MODE_N_24G) &&
 		    half_support_nmode) {
 			netdev_info(ieee->dev, "======>enter half N mode\n");
-			ieee->bHalfWirelessN24GMode = true;
+			ieee->half_wireless_n24g_mode = true;
 		} else {
-			ieee->bHalfWirelessN24GMode = false;
+			ieee->half_wireless_n24g_mode = false;
 		}
 		rtllib_associate_step2(ieee);
 	} else {
-- 
2.39.2

