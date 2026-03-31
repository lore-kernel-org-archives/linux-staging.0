Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C9A421880
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971197; cv=none; b=q3XWoBsl+TJOyLdsGnzJbIQTH4oBy3z6PTKNowRWwnI5PsXsW6wxv3k/YiocXgH3alWZNmJTDakO5zOOk2bCAFpVxGpc2KAsnDUkxI/Yz9CqcRpRbfCJTLX8ckyqT9GmxFs+QjIl8tU6Wsh3c1xCud/AarH1vrnu8t3O5j2raUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971197; c=relaxed/simple;
	bh=XuMF4Iwo/Q3Cw4g048XgTqWROq+eXMG7KqmpAsuphUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phCe4nFKJRpsuYaSGIH0K2rFdVRaJDpPwvdDGuwfO9ORobdFmgENMFM54+REiy7Nlqz6EVuhEBKWzuxfbGFCRRc6RGE5CGe2+Svx966W5oBDkkWujItlC5kYCk20DEpXV8pRJmig8EdlZ+I2IzT4b5RWNsXjS+25LpVTv0NSy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1XWxxuY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1XWxxuY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso75945e9.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971187; x=1775575987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I9eAVxuzIECUekDIQB/9U5LTPHbgaUxYWgvVH1dKd0=;
        b=Y1XWxxuYCPGg5cknl/UsD3vcrPji17aGXQXGclqxwoKp6ZiD26f6CIDcAEYl3HYamJ
         rqyhen8euzK3w7y8wiK4C/8z567Un9VvLbQU9mPys32ECLRRM+zaV07iOOO+y7huaXC2
         +hCUzXl9QJLM0p0JWomf69RjCfiPeWHkr7wbgpI5+qm6WsE7MB0vtXCS2vftoIZWuMTw
         NNmhyzTHTXb6qwXgH589q0XeVPIN7oIFLxLhIF45zuWR/pLWtLdlVyD0C8xJBvvCas+d
         QWhzLaW7gA0nRMtHnJOh+4fts7PGttRcapXdQwZMNEfX3rRRa5XIQTCY5UCRCvGijdzx
         DLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971187; x=1775575987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+I9eAVxuzIECUekDIQB/9U5LTPHbgaUxYWgvVH1dKd0=;
        b=i4K4LQSO8s3jLuljGK/GtI4vsrxciyyBMMnL9m2q0+uXzcOvNQ03ZRvlofAPTGOFYV
         SW/0BddKvGManJLRJ/M3fz40x0mnDljmq22KEwO1mmXhtKYV5U2cinmFm6Sf7Fi84Y4h
         kP/8csZh4+QafBrIcLNfRsFS3f0GV4JAbAiya+3CP5E2o76Au5dL6ACb1IsQwPGf4wOI
         pGuF9mze6vn/dLNddRGDrftslYtVckQaTI3zRrWm3IKpHo6jtyMvjKFJwCjPoraVozFz
         tAX2V1cIGtCaOkmFLQnzwHPIyuraTFOPNeXgycNRJ5BgB835aCusd7A+dMDyxiR9WcsX
         9+5g==
X-Gm-Message-State: AOJu0YxA7VfH/cfPjLHzEW7LaI8fsdvSlBHMkMtwew7V8xnFlmJ/NJF8
	WiLdrOACBBOWNB+gzPkKstd4vtKCBcXbxR2YCmHWVhs0qBhp1mwlp0ry
X-Gm-Gg: ATEYQzzkxSbVsVtzugADPFRCp6SCImqday5JmjK8ggIeSkstCqVyIrBs9tx0xkeIeIf
	KfBe6GhTVdFiICwGfrUymCDi4+HPGTy4HHw56raoKjqug6sGi9U1XdhIKeapthl1KZJ0oSHaw4C
	Iw3X24SVhXL3fsIkqoe9kIpQTJE33auLGxAkLkDTA3fBpylb0rV/Xx4H6wZToszjjUqvbyij0bl
	K3mN1oIiqv9++G9vUi3xnIntQhw1fqNUkdto0FJKfZBmocDmY/B7qQizD1kCAmC+2HB5FLnnwqX
	7th/VA3bFVz/OgnJoJvXE29jaw7PB1U3IJdSri3xMDCgPvqmMa2E1amqtBwwLCJ+XRnneopgQPB
	Muv0qHy2ess35WhU4vRC0RMuXZH0fZNUmeraJPY9p18E3q3wL0SH0yNSHt4+LGfF+vKJvQ7obPH
	q+3T1f/GnFzz2Rqhet31z6fA==
X-Received: by 2002:a05:600c:468b:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-4887828a552mr67817915e9.6.1774971186766;
        Tue, 31 Mar 2026 08:33:06 -0700 (PDT)
Received: from potato ([31.176.162.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aceb230sm21653485e9.4.2026.03.31.08.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:33:06 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: remove use of vendor-defined status macros
Date: Tue, 31 Mar 2026 17:32:52 +0200
Message-ID: <20260331153255.22764-4-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the check for _FAIL macro on two occurrences in rtw_sdio_if1_init

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 8412331c4949..34ef40a86153 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -262,7 +262,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	padapter->intf_alloc_irq = &sdio_alloc_irq;
 	padapter->intf_free_irq = &sdio_free_irq;
 
-	if (rtw_init_io_priv(padapter, sdio_set_intf_ops) == _FAIL)
+	if (rtw_init_io_priv(padapter, sdio_set_intf_ops))
 		goto free_hal_data;
 
 	rtw_hal_read_chip_version(padapter);
@@ -275,7 +275,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	rtw_hal_read_chip_info(padapter);
 
 	/* 3 7. init driver common data */
-	if (rtw_init_drv_sw(padapter) == _FAIL)
+	if (rtw_init_drv_sw(padapter))
 		goto free_hal_data;
 
 	rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj));
-- 
2.51.0

