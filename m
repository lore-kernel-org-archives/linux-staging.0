Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EF941C62
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748764; cv=none; b=LRxkuHSrcJyw/JokNgf52Mm96FRP/YTOl9rf+iINqQqoGRp0c37WXzFkYcnrcTtxQptp+Zw7W6xqrnzGcuDbNb5UK5gK+n5RVYlSGamNoxl/NcU/ITWXsqNMyYoZd9KaRC75HvjMu1Ta79mv+zE0TN5idxUFyEq1eT1Fj7lXJVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748764; c=relaxed/simple;
	bh=G4Wl0EW7TkdNWDaEvnSEH82i035fcRPaWk9aCJ5U+Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YmvhTENAkPmt8ht+IegqwBsUhhH/J/2HLgpg70urtjQNJIuHST+PeJS5sTVKcX8v1+iDiaY9OmH9Ej4OL8+tF+AIHPVi9rJ2kwLJ+wPVFfqBZ8MBM9mtLP2vX7vLCoE2OFa3IGI4GIMilnFHsM+jX2H48zLW3BpZ5++40UGrIPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ioRrpda1; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ioRrpda1"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-23db0b5dd28so3881230fac.2
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748762; x=1716353562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v6sT1qmzrcclK3POxawe36qikIVYRE9ws3li7lPq08=;
        b=ioRrpda1wO+sico8HOUZGDCMO+35blAC9P1J3RpFTC8aCZ0tE+SjzRiZKUBpdksvST
         RxngfYrTU+3uAv7n+MVV4E9/hN9PWu067+7pFcfW1IAnYN2l4w3CubXGDiPZJts01i6A
         UCGUZ+C0BiCpd6BlpECjKQb8LPmYeiaxp5LTrjJtA01g0pdxU22eBzeeb0fqZHrP6dvj
         0GPmQQyy6kWHa7Owo4YQi2386rnOQp0borzAxe1LtOF8NFD/QUveVYCYDfsqU0y6WCiV
         OAhpGWXdQ5T/rk7J7BBr2o5k/4QkLDHq1nVjEF0saFYod13X3+jAfxJIq4N5NIKChREh
         xbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748762; x=1716353562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3v6sT1qmzrcclK3POxawe36qikIVYRE9ws3li7lPq08=;
        b=bDGrYhq8Qx+CgVnSIIsrftuuLCdUOjZfFjFXZ3i9U7+Fgh2MJV/T1yP7KcT4R7WNY2
         nkcZcj3qH5x5eQQeBktyyhVSsmFN7NSNLXPUX/V0dvVMpOFdeVOoD+UwlJZJ1yyF9VaO
         e6cR3wTlvKXuSqlNEc+ZnxPupnegz0fwuldDtDyiGA6dj9KbZR22RrPCGipDOf+eiDo1
         cujd4pLm1lBxinjSRBlJApDa3cJKOFFjCXZdUBY8MOSRO8BKvSE/0rjSmjVH3HbGH+OT
         CHqHgfdf7b5SxrudGWJ671DnLMRjGpGd7jbF3O3gyGcnTbJfDIfeCA37EM9mWZ7/Hj6a
         DG/Q==
X-Gm-Message-State: AOJu0YySZ75o7dxChyA46Pe2buGHnYnYzmsmiHx/AQgqFUzKvkQHVITX
	IcfNYWAfB/JjQXPU9KWFrV0uZV4MAlzyIljKbXc1emx0Qer2Q6KYy+xzviwnHdk=
X-Google-Smtp-Source: AGHT+IEro0x8SgQC8g7l1699kTobqLsA4XG9sl4xwdXejRWKjL8eEnw+X9b+m908k1fuIELveG67Gw==
X-Received: by 2002:a05:6870:7b52:b0:239:701f:fc32 with SMTP id 586e51a60fabf-24172a23544mr17003915fac.9.1715748761893;
        Tue, 14 May 2024 21:52:41 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:41 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/31] Staging: rtl8192e: Rename variable rtllib_rx_InfraAdhoc
Date: Tue, 14 May 2024 21:52:07 -0700
Message-Id: <20240515045228.35928-11-tdavies@darkphysics.net>
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

Rename variable rtllib_rx_InfraAdhoc to rtllib_rx_infra_adhoc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 108fe1520cf9..ea8cab9707bc 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1223,7 +1223,7 @@ static void rtllib_rx_indicate_pkt_legacy(struct rtllib_device *ieee,
 	kfree(rxb);
 }
 
-static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
+static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 		 struct rtllib_rx_stats *rx_stats)
 {
 	struct net_device *dev = ieee->dev;
@@ -1431,7 +1431,7 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	switch (ieee->iw_mode) {
 	case IW_MODE_INFRA:
-		ret = rtllib_rx_InfraAdhoc(ieee, skb, rx_stats);
+		ret = rtllib_rx_infra_adhoc(ieee, skb, rx_stats);
 		break;
 	case IW_MODE_MONITOR:
 		ret = rtllib_rx_monitor(ieee, skb, rx_stats);
-- 
2.30.2

