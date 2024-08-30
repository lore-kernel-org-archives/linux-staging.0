Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C856440
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 02:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724983515; cv=none; b=hD+RsdjKpw2ZMvPhgFxELmmeDF7rpZalLRbewn3IFVCOeE9ivNq5vIJFwg0qwGw/VJqhFAcM81i4JEIGMK4EUYdAs25uZcT0EF1raIsdpG7uLKi/Lk6rengNxSVAD8jV6JJSbH2KYmyliw8bxPoyAdWMhehPAVNVtVIiphjQRtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724983515; c=relaxed/simple;
	bh=PQScFVLklN3b4uqseu3LguL99TZd6dgo3jvqJXQ1tw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OEO6f0TdMSk9o56BUBr5++PpFvs5jhoPy8DQbH6xD+Rpf1TEE/CQ2ThkB1adRvVxIgJKuNM5dy5++iQnxiK99nbqUtAlAJsyMiJL+uYTBGVhxvwk1qD21J4TZwBk4jUrFycPOGxxEFkPIpscx73V+UMmvSk+53c8EDy4SpdZZ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lj0k0w51; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lj0k0w51"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-201fbd0d7c2so12420125ad.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 19:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724983513; x=1725588313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoxLTypTzSmD9Jrs9y2L3ad9JzSXceDl16Mn2x58Bwg=;
        b=lj0k0w51dA40R8J5Xdb4xyvQgY2H8LOCfVoZG+9V7xHS6V/2vUGF2ZvaNH0k+6JEUH
         wOSywCIHyzhFctqaG2S0o35aBZHX7hsXMemNtSiNzxbmZXH6logoRzp8vy3cgOjeXltR
         RQ5MazkxrHYVld9e57zbthg7bXcGAXi8+kgiSuK02Cst+B4tuDvhPX4SGOyAYGBAso2A
         tn4D0CFihVKFpP8gf+zwsosD26ZrWdgOiA+XBC08637yNTuHhWxUwWfMLbs3wwpgX4e6
         hJ+nnQ9r3HR5dp6mljQFSEQUxEhU1pbWTcNAaZOXeXQ4XI1DHQSHIKojM3vT9CwGIto+
         XAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724983513; x=1725588313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoxLTypTzSmD9Jrs9y2L3ad9JzSXceDl16Mn2x58Bwg=;
        b=VUoo2eI3bkAhRa8fMZyLLrualG0VzCnoa1QuuLhaHTDsWNdU6YvUe1fXduCkX0SVNr
         xEX3gUVTvAB1NeCkfcR5gvRA8NePYvZlLRl9yaEmaKLoj64NAknSJF8tJcSTgaxBhq7a
         xV97qD61MfZ8ZR4O7FPyTf8rs8cKOF74F83q92Iye5dzz5jpTdKtBWo52DJkrsjOuqC6
         tHqSjTJWiNtYHmtQFVCrpROv2x/4TvZb0Gr4Mc1SmGGtc+CNX9ddOlMKJPb6fBjBbnUh
         yQiIyMGQIxOV8hCi46/yuGWXuOgDT+yKE2LkLaOMqIXVYWcIIfX6Zh9SXzX4zYYhE1vq
         9t3Q==
X-Gm-Message-State: AOJu0YwpKwbUXBCirIc19+nBasSJsJFH0AFxI5J8UMuR4Qlu6TwSfrGN
	JqEEH4cL52jVDBo35hKeXK7wq9vKkLG6PolklO6zRg1orlkJ8oGs+0dWIguUHP8=
X-Google-Smtp-Source: AGHT+IHZ0GbBErc3BAd/f206Xl6wkR9bcF4wNZpyvHMK+5GBX4qGLnnszFzDuDIBZl+zCRsd+z+JXA==
X-Received: by 2002:a17:902:e542:b0:202:301f:36fd with SMTP id d9443c01a7336-2050c23c7aamr56760925ad.18.1724983512645;
        Thu, 29 Aug 2024 19:05:12 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515534444sm17643255ad.147.2024.08.29.19.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 19:05:12 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/3] Staging: rtl8192e: Rename variable bHwError
Date: Thu, 29 Aug 2024 19:05:07 -0700
Message-Id: <20240830020508.532945-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830020508.532945-1-tdavies@darkphysics.net>
References: <20240830020508.532945-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bHwError to hw_error
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 519cad9e1106..15fda2d87da9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1506,7 +1506,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 				  (fc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 				  (fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
 				  hdr->addr3) &&
-		 (!pstats->bHwError) && (!pstats->bCRC) && (!pstats->bICV));
+		 (!pstats->hw_error) && (!pstats->bCRC) && (!pstats->bICV));
 	bpacket_toself = bpacket_match_bssid &&		/* check this */
 			 ether_addr_equal(praddr, priv->rtllib->dev->dev_addr);
 	if (ieee80211_is_beacon(hdr->frame_control))
@@ -1630,13 +1630,13 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 
 	stats->bICV = pdesc->ICV;
 	stats->bCRC = pdesc->CRC32;
-	stats->bHwError = pdesc->CRC32 | pdesc->ICV;
+	stats->hw_error = pdesc->CRC32 | pdesc->ICV;
 
 	stats->Length = pdesc->Length;
 	if (stats->Length < 24)
-		stats->bHwError |= 1;
+		stats->hw_error |= 1;
 
-	if (stats->bHwError)
+	if (stats->hw_error)
 		return false;
 
 	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 82fef04e5784..76f53b797644 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -467,7 +467,7 @@ struct rtllib_rx_stats {
 	u8  SignalQuality;
 	s32 RecvSignalPower;
 	u8  SignalStrength;
-	u16 bHwError:1;
+	u16 hw_error:1;
 	u16 bCRC:1;
 	u16 bICV:1;
 	u16 decrypted:1;
-- 
2.30.2

