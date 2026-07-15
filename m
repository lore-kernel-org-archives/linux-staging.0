Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303147DD40
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119877; cv=none; b=aydH0Om+C2685YhazxmBg+HeH1rtDx/yjPyPe5z340OeFjpE4ymQFJrr0R2xrtWXsXrBwgfPl6KW/gedqsFMa6IROcoIwKw4qnaEemLKiC9sgO659jHpPGZrLuxLSTOIOw1BKBcx+7woM21Ll/syN9F61yRQSCBC/OJLWmFtXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119877; c=relaxed/simple;
	bh=Vtr4UYwJobCeIRQMXJ4byK+T6xtCXLCAFgENupk65VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSs1u5v7sFfn1PzOntpyNzE39/iSsHEFAaLmQpXm9J12ibNCq7AvXzBM/kx+IIoUd3NCknDNHtvqlOilZatA4kSOAklzmX/VsMsBdBeXkCJZaVjQ87Ws5rip9XJW8Fhs/M7kbujIRpXqgFEP63JGpkqAyLET5kmihhvdiaf01eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFAQw6Q3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFAQw6Q3"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aebc8cb5bcso3767607e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119863; x=1784724663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWQ3QnN0Oyq9QyqnlMfG+IyPMyxqK/+BZoxD0v9pTJ8=;
        b=AFAQw6Q3IhvK3TZ0Ag7lMldrBh7/JUlcughJ4FjrQLB9dUCT4nlc7pUCGhdTg8oGNV
         o3fTALrYbswChxeBtrXq+LCHAFLDTSA8sV2VPBUv+iwNUJpm1HyDtPxNljvpFHYwHlFD
         AEVebmZPjZAmyqfzbaWmnaYYVqACgd1LcIUox7tTafo/5dtwvS/xBA3ex25HGE7/jslk
         lKOc7eusjUd6BVDvSBeTwjh9iukORilS0tEnmL9NpFXH/G7vn2SgWK+xjXu+BJkVrTus
         Ara7e8DyaHm7uMo/Fqz8KIKtN661PF+7lEmXUW7gdyokczY9SxZlmNwg48NzlVLajlcp
         +hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119863; x=1784724663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWQ3QnN0Oyq9QyqnlMfG+IyPMyxqK/+BZoxD0v9pTJ8=;
        b=TR5/G2tfi6bddH2CjCh0KSIYsLDQiXMIBazinKcXOcjZ/XfBPfhDYVKpkORp3ecs8P
         LaRSQT6WBSspWEMVWSImg/1vS82ypFVKkID18digUpGmpSvyR+OXkZsaFTrVmAO9xWuH
         Juu9WUVu6VsO8w6AHoRd2ZkFNceqe2cwcssZ7F47P+XoW+dn9tD98dyQ2TEeVvAx+aVg
         +EavSJw8rYfJR+FP6xRxGG5a11OoTeyCPBaTWAYOvGQpE9Zox9lXtFg99sGBGMt1nYKM
         EyhA5hq8N8P9L9Bul+DuBU9ios/iQgkCTYSi8iNyAWr3uVJq/eqgkVCTg1rdMis8mzsZ
         9t8w==
X-Gm-Message-State: AOJu0YwZvk26lwluVJiQLvgZis0h9S2k0hF07noxi8jK4M21qIiks/cr
	jpupNxZyn55jJ2cOAQxCmNterrO3QBTqxJeaAJR22xGXZ/s65aY9z095
X-Gm-Gg: AfdE7cln6+9loyrwA42k76ddYFwQHePN6vDAg63+N6BA+c68Z9dEf3c5WIazaPDVbn/
	wCYvnMfiRaf05cBzbWJouxQswJzSSf1UmYj/5DVzv0KLQNft/xjv6Q/J6u4s9OTdb23I6YyG7dL
	yieloy3Szp1lFlRCbU0zR1Eh8rWbRpVkEO5rgMGvzBJ0XucsJDa0jfl6OUjY8Zf3TIP+fBoIe4Y
	liwSkkFhvCQnYW/IswY9nIm1E0e+dZbKSn+482ePCZbvFa2W0oW9aU93I0S4EW7/dZc3HzqAjvg
	lUvii9oePyRhor5WE6TsvJWV4XAfU2HeV8vBRfULtuK9vBSlPJLIW/ScWeqn5HEnIO3S3+X01cL
	lYBBUaNstXDmSkCqWJmEIv1iGbx6TL3A+H5ph7MsF7F4oLoOtEBy4WDv5MPq1tOIclts2AKpzc1
	8DdL+X30n+f+cJUo4BDXCcshkBhFC3oQ6ajFcZUOUs7DZIHzX0TBc4J9O8NMEFAriDZKQMnzQ9L
	1wcmEpAReVvMQ==
X-Received: by 2002:ac2:5d72:0:b0:5ae:c7a2:69a8 with SMTP id 2adb3069b0e04-5b15d7a6a2dmr379701e87.44.1784119862945;
        Wed, 15 Jul 2026 05:51:02 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:02 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 56/61] staging: rtl8723bs: inline rtl8723bs_hal_xmitframe_enqueue helper
Date: Wed, 15 Jul 2026 19:48:24 +0700
Message-ID: <20260715124829.90290-57-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline the xmit frame enqueue logic from the internal CamelCase
function directly into rtw_hal_xmitframe_enqueue. This simplifies
the transmit path, removes an unnecessary layer, and cleans up
the driver code.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 14 ++++++++++++-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 20 -------------------
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |  1 -
 3 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index a73abd36f..b11f4ab4a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -202,7 +202,19 @@ u8 rtw_hal_check_ips_status(struct adapter *padapter)
 
 int rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	return rtl8723bs_hal_xmitframe_enqueue(padapter, pxmitframe);
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	s32 err;
+
+	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
+	if (err) {
+		rtw_free_xmitframe(pxmitpriv, pxmitframe);
+
+		pxmitpriv->tx_drop++;
+	} else {
+		complete(&pxmitpriv->SdioXmitStart);
+	}
+
+	return err;
 }
 
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index e40f69c13..a4dfee1d4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -496,26 +496,6 @@ s32 rtl8723bs_hal_xmit(
 	return false;
 }
 
-s32	rtl8723bs_hal_xmitframe_enqueue(
-	struct adapter *padapter, struct xmit_frame *pxmitframe
-)
-{
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	s32 err;
-
-	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
-	if (err) {
-		rtw_free_xmitframe(pxmitpriv, pxmitframe);
-
-		pxmitpriv->tx_drop++;
-	} else {
-		complete(&pxmitpriv->SdioXmitStart);
-	}
-
-	return err;
-
-}
-
 /*
  * Return
  *_SUCCESS	start thread ok
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index ddf868c78..8d6d6d2b7 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -411,7 +411,6 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter);
 void rtl8723bs_free_xmit_priv(struct adapter *padapter);
 s32 rtl8723bs_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32 rtl8723bs_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe);
-s32	rtl8723bs_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter);
 int rtl8723bs_xmit_thread(void *context);
 
-- 
2.55.0

