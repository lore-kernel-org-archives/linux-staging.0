Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE047DD60
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065203; cv=none; b=Y8AvwWTU2WIYmyVa3O4hIw8l9b/HEaUTxv65qcWsawg3LsJ81T+7bDbLoKr5kiiMuGLM/10MRnx4YSD8FmBLQSQSYxJXvsPhGxoAE4wAO5mtjCwes+nwE8+opHmCMzC9zq+p5dsFI0qnwfNPGTKmLO5HoiZu7+NWr15HXml/P6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065203; c=relaxed/simple;
	bh=FZ64LL9NbwQwfhMSxunpr0iv3hCPbu/6Bg2k0cdzRU8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i9rZzITLrNGQOvllBMmMQ8bxMY5tY6Tc3vI54s66FvF6gWz6kUkB7ni1DL5PgQdBbaAkW6SHnztXZjNcS3cNhnLg8wBriKjAF5e0XYs4ppHCAc6ioRTFdhET0zLmo1lGfF2A0zukR0rtQflkicVvMAm0xXP06pUNmt8ipljTZuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbMFCnBc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbMFCnBc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb439299so67261535e9.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065200; x=1775670000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yJBfZEYr98HLexU4keLYEIeWd5IwMV2qcGOSLu+XZI=;
        b=rbMFCnBcroX0QxxuEb0cqExyeAaAD7bwTC6uAqjZEMRL2hWNqzofgX8SHH/gIBjZ00
         B4yqU/ZKnVif/zd8N/6bAcM2kVuGlFiDJnFpyHZLXg+e1WkZ10jLK2jzKUnmz+tLSiFp
         9eHHJ/WaDnJUtf41+YOBW9ZFXaaCJ48u9sghOPWbNJQw0Pgv11ANLgL7eZXwAXyhFNTD
         jS6fiOv2a++W5jI2k5ikU8FvHMTi7WeXI50u16Y4e34/iC2lD31KdUviZ9H0Yca3s8Gs
         X3BM3n7gvxEIbzp6qeRnTU2Q2n1938Cmqnts/nEiGpnbl0h8w0ujPe16KpCIo222OUUW
         3UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065200; x=1775670000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yJBfZEYr98HLexU4keLYEIeWd5IwMV2qcGOSLu+XZI=;
        b=LtYUD52/9PV/EwIVR7Sri1rk3iZs+j7NHTIVijYBHt3L2oCan6nHbjOocyU7vomq90
         Y6Zio1+Cx4p4GDj5Mh0ssJhfpTqmd4/Lcas2D5wAPQyRj7m5a0Cn7HEO5T6GcXtudK5J
         x/dO5BJVf5ejdBrbAotIQf6isWC0kBtXvTX50tEYMLMYK0MA4azFT7U/JfBHOKszPcP9
         Dzio6UZE55erkFu9HH/l7Z4Y6plafl0CAnFBHPWBijsMKJjJH7RzGbE2G4s0fcmxbWWg
         WzKVHbOPgj2fmWa2a2HuWe4CAAaaZhTPqqVkvnK+wCswDTEPWIbEmc5sDVvaUPe6tvHm
         F01g==
X-Forwarded-Encrypted: i=1; AJvYcCXxjfFToWBA+e21zNdR3NgpJVVc5HXT4kNUIzg+PJTUTyEgu+lHbbkX0N3NOPXYO9FArv/STHWVG1B0CgnS@lists.linux.dev
X-Gm-Message-State: AOJu0YxIqlIuRIPjy6INjKmoQhZvkLzn/RZzV15c7GleXx8pL1bhzd35
	zOrJ/JesUxpY2EKCwgoBUw8rMjJnqJbFBzOajvcpTS8w8hiXGbrU/zOR2OyZAhq/
X-Gm-Gg: ATEYQzzgaI1YJxn8GGCUu6/jj5txSr5JtY0tAf+fDmW1Sk9hahc1rQS1C6TgyABvhWw
	weXkhZE7cOYFPt6QYrxCQU0Bp8Lc+Q5hGEoVjORrTTuGFKamVuLZ0fKXYOgRlfVA5958+g1r/km
	TT97NwXaTDYnlJuuBD0/Hg15Azl21pOdRjG81c0xCHxUc6KYxtA9f4HyujOWf19Jhg45ieEdCd4
	YNJ9+2boCzJTl2vv09TSTSN3Vnfcm2bqW655UcCNaqHbK5aEW85lxNaKlSWOhhu3RR4hRv+sJiX
	TJmcikuAj0CRHeF9EWKoOn/Ly6BH00fXiGx8IHY/svkng9Aq5WlCUx/AdcpsHAP3qZySjA2SpEW
	0DiNPnYbWyTy4Uz9QTU5WSAtegm7JCx01vHNzrMtFsY5LRhRBiB30ELMG41CBt8sFyOzXpFHgun
	V6dmvpOWjM7SSo+PhdTz5da3Qr3PMoZctXAL52NDIvWGdcEAxB1BUJPZB0I4ZQ8ftDWGK6WsAvn
	S/ibuBkQjDRa4vxfBTe4uue/Ez6T3YysSh3fqs23lnwSudh79qPZgSwcnQx5fRm/LWKVoONcxSi
	ALw19zSvGsIrBNfspPwhjWU0G8Tot9VCeTwRxpG/sjQw
X-Received: by 2002:a05:600c:34c1:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-4888359dc6bmr70985735e9.22.1775065199998;
        Wed, 01 Apr 2026 10:39:59 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-245-188.bb.vodafone.cz. [86.49.245.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm1317924f8f.29.2026.04.01.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:39:59 -0700 (PDT)
From: Joshua David Crofts <joshua.crofts1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joshua.crofts1@gmail.com,
	grondon@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Use array_size() in rtw_spt_band_alloc
Date: Wed,  1 Apr 2026 19:39:17 +0200
Message-Id: <20260401173917.2946-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced raw multiplication with array_size() macro to prevent
integer overflows. Found using Coccinelle.

Signed-off-by: Joshua David Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 098456e97..7f0ca5a5e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -128,7 +128,8 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 		goto exit;
 
 	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
-	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
+	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
+			     array_size(n_channels, sizeof(struct ieee80211_channel)));
 	spt_band->band = band;
 	spt_band->n_channels = n_channels;
 	spt_band->n_bitrates = n_bitrates;
-- 
2.47.3

