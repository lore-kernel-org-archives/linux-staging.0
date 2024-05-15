Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3DE2BAF6
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748756; cv=none; b=dTrZw4+ncb9QXwX0jbBcnr6spgiwSGfiAtaeSVpPTpBrIlCfjIFjJ1kMiUSmVk6AWCbivCE6x25LG6Lez1l8yqXQWXElx1ZtI4WbErByBtHbtHgzHDvz05SonDJyFXGK0W/xqsLgfEOm++bNdLvJl6+1GEO6PcYhhosO4OG0GS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748756; c=relaxed/simple;
	bh=wuOcB61GVi0HcjzZuCw9P+IUmYgpygNyIL+EQ9XWesI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LCRyRTv3W97Ja3VGmcXav8AZHY6oAf1kSJAugHyAlY1KHoppyCEmsS2abGRWcg8Nl6XtZu1yT3f/XveEIPUA8odZCvl8MS8QrstS/z9nDWtYEeDYfNmunMmymUtgVII2UCw7M8LxnZGtdgK2KcXS2tQ2QLef9YDpmUWdSc2cSqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=XZAnpOaX; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="XZAnpOaX"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c99fcedac1so1803044b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748754; x=1716353554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4V9hVw78xB7F0JDfubryUfKBGH6YZ1voDuXRo8G/VQ=;
        b=XZAnpOaX4RutGsVMv/87lXmZd10HXDjMMInt8gal1mcf6ZhESgSun93krDNL1uYM4M
         2qeFuS9JTUwYvGVONVcOg3NLP8YZhPlmCTv5wDoCxfrVVb4W4PXTInsuncNxp/DQmlnL
         SVs9IBsBv80Td40Mlrq1/ZEWhvVCGfDn2ZOeIRW7q9NgcrNoYaw9qIBf7JqgLg5ZF8vW
         QKa84BH5uX6j02AqDjPuqQPkKhFV1Yx+0PyMKGpvGByqrFEQuK3c/E7K7HpigcrVF8qm
         tbg2raHefBCT7PXTjj+S7Tl+9bAd/OChdKgQafufngw5cptOHIAO+Xp6o7gpugje/9X0
         7lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748754; x=1716353554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4V9hVw78xB7F0JDfubryUfKBGH6YZ1voDuXRo8G/VQ=;
        b=lp7pOp0jBAwDKcWwLJFd367z/HWG+KSHi1A0U50b+aSqMO1l9UEjKrgiz58DOHqOhI
         ZO2m7XWmxts44pVb1rCfIhgWXIaUAUEKNgcpoceKVnxK+tlXaaYUEoE9VN5iT5wrgwI5
         BBw9rpXjutl0wdOwq1pRL7P3i9WYOUF62t1tNSrrbZsLzVqk3owcdLmE8fUw0kuK17tg
         cL1w3pnps143sGO70C/opT/JdOHc9DWbpdEftflW/N67D8uYUs1FAmaq8aJl18wRXmqP
         rO/23yGjoPq6evzztZThTF0K4Manfa3jgKVhQqv1tJm1hQUuKlMDE7hKSG4umYPsKuFL
         JoHw==
X-Gm-Message-State: AOJu0YzHar7GnJ7YdA3zIpEwbolUAbjI1UXIEt5rTZlrqsZC2l9pI5TG
	V12K4p/8IP5VATeQF1J299zerwPm/jtNMKjM26eaXJcODQiQjKnE/lUeYOalHIQ=
X-Google-Smtp-Source: AGHT+IEXl45CKkJSSJb/XlUNrrYpFx2hZWsIu9WEOWiFbWsAKF8Ju8674QW6oLZKShwlfpCGbgdh/g==
X-Received: by 2002:a05:6808:647:b0:3c9:71d6:511f with SMTP id 5614622812f47-3c9970ce5a6mr15615156b6e.50.1715748754266;
        Tue, 14 May 2024 21:52:34 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:33 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/31] Staging: rtl8192e: Rename variable IsPassiveChannel
Date: Tue, 14 May 2024 21:51:58 -0700
Message-Id: <20240515045228.35928-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable IsPassiveChannel to is_passive_channel
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ee469c9118b8..4a0db2dfd5e9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2356,7 +2356,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
 }
 
-static int IsPassiveChannel(struct rtllib_device *rtllib, u8 channel)
+static int is_passive_channel(struct rtllib_device *rtllib, u8 channel)
 {
 	if (channel > MAX_CHANNEL_NUMBER) {
 		netdev_info(rtllib->dev, "%s(): Invalid Channel\n", __func__);
@@ -2432,7 +2432,7 @@ static inline void rtllib_process_probe_response(
 		goto free_network;
 
 	if (ieee80211_is_probe_resp(frame_ctl)) {
-		if (IsPassiveChannel(ieee, network->channel)) {
+		if (is_passive_channel(ieee, network->channel)) {
 			netdev_info(ieee->dev,
 				    "GetScanInfo(): For Global Domain, filter probe response at channel(%d).\n",
 				    network->channel);
-- 
2.30.2

