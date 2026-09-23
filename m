Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C832E12E
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125542; cv=none; b=gwaaMet1h7oIoZeCpSTDvrYIgpwYqVml532hPZSVlYFmfkHprezxhAadTnxDgNwoD9HySXCqbTTYhJLRyG+hcRplYjx3oxk2apr1cwkXjeUJvV7S5CiVBFMQKk/12xDbuL70/9xUJ8gz9p8zqj8Ku246caPiUeFht1sRD/nnm0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125542; c=relaxed/simple;
	bh=FjFRP0jJUcVLrPO8ZhYwaG5GZ5vnnMX50LSlCW6IYhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwjAxdMPNyQzYYOthMvXmuhjH5aJQ323hofAekYtlS1/TdbGuXBl4V7K3yp3ONJj8TP4GAaE+tMkWVuT/ytkxFzxCZDiV6VPLlz1sHimQSzIWV7X2QsjNlI3NJeVqOnyVro1fHXr+EL4i+u5ZoBdlnP0tx8U75uOYEHAM26FW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5NSaco9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5NSaco9"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso269054a91.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790125540; x=1790730340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXBcmQOVXFt2xi54w4xGq9/5w4oxNvJs4LX+noV2HQI=;
        b=B5NSaco9tIgnooTOU/QC9zPrXJZwLC+F6T+NNErpsEWreqKhsmBd+fkehiKC0oZRu3
         22AEXECJAQgQXQ7YKg0PFPNGTlBuDsgg3OZe4TwQh54aJHSmggC5/On7oQuYtxEokXqv
         q7j/g9ZI2QmBA8fSZqQwmuDBPZkCEsoql47wIqamVp2x5uAIpE3AqK/oNBArhyKW3cl1
         wtsQnCRitVZo7/jJQvDfwilwvcfEI4ZKQOzHJPhYMhOyGSTk2ViV9wTl7hZfL/dzFhZO
         iklw3TCBIlLzvT/BNqXHF088dlPvbQc2agc2bNDZWjJR4tcnYWcJEvkI50yq9jUZiVUs
         20IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125540; x=1790730340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXBcmQOVXFt2xi54w4xGq9/5w4oxNvJs4LX+noV2HQI=;
        b=qugQZ8wRToHfp8a5yt8m60UJe1LUgx0+U39FKl3/tH/iNVwOBG1XXTjGfSU8N3WYlG
         0tnKtyw+E75vOQ7PjCQ6wbbrcaFK1ORU3EWQzTWZvMpXpSVVoe8/ADQ1RYsC+1bRyLvt
         TX0nXrROiXy2CZfM0288e3PG7ImreUXnEjki2zwH8fkAaPOQBHSAzaHexJZflRXILXtk
         ShE6pdz1VilqWGK9N82Wlwjrl5TXNftY8m7xzOm5KyIbpi0sWzwqBTMPkFTTa6OjaDBo
         3xwTotBkppVRrr81pkRzzTRVaxy9l6vNRmGf9RUHUo2rbXnEP+B/cITjnvguLioVp6lv
         gslw==
X-Gm-Message-State: AFuF++knggW88FD8POVTtOyA5OUbJcwAkv/8u1UlqRTErtxRB4XZs4af
	PAzhOXHPbD5N4fBAcvlSRdTK+g/TGDjQ2qfJqEN4gGCHLIZ4arI0Bp5D
X-Gm-Gg: AYBFou3tDPphXtrdq6ums37wXJjgxfWGmWZ/GiaIXmuumtv14FQF4Wi84OA3Wu5mJ5p
	sfrY6iG++Jy54IO8DHexY9pA6NcdoYuf7E/yDsyttj3jD23RCvsRWVqaU+xk16AzfCIuvh2VQWB
	O2mxhNcl0sos15uIzH6NzrzR0apzcQftjMLMsQo63Ag+wnccpvYqmcXw/fsKrHD8x+8j6zWpNg5
	iEym9z/5ExnjFTUrGShQtxcXWWYuI40L1HyQSpiRjoVxz3RzyLi7myXuzS37y4KvMEVRjLxl5JH
	qqs2cYe8q4V4mbxQpyK5osvoBE7ojEAHECKZMWe+ITocmFhKVeL+RGKSl3yrY2qwHTw3vC/lMKZ
	YmBu6EkRg0tVWsKV8Gpcb5hIJEaa9cwDA1FSDlLIg1EFUO/uzEgRAJ8wjkGuWynogHO8itmcVtu
	k8yZqKTLn5f3Qx5tVfVoJhx8BeNAGJGm0yRHZ8OvKdUhyxWJXT30GwUO+wuV1uotpw
X-Received: by 2002:a17:90a:d64f:b0:3a0:7d88:c2ac with SMTP id 98e67ed59e1d1-3a07e65d0bemr822610a91.18.1790125540223;
        Tue, 22 Sep 2026 18:05:40 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0812a1eb2sm336539a91.4.2026.09.22.18.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:05:39 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused variable 'phal'
Date: Wed, 23 Sep 2026 03:04:23 +0200
Message-ID: <20260923010423.6352-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phal is assigned but never used in rtl8723bs_init_xmit_priv(),
which triggers a -Wunused-but-set-variable warning with W=1.
Remove the unused variable and its assignment.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..0441e84ea87d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.55.0

