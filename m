Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B9332ECC
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478628; cv=none; b=JqTpoxhvqU9HJlZkyIPpsXnH9nnLMLCSmKOaWjjbsaVPZw2DNOCeM49tNTzEuySN7pEcpZ3bC+TWzlY2mdzvkrPoqHXsJAaULC1iNsx9rw+2b3E9SO89JlF64Me1l3l0H7fdSpScOoadjJH5R1E+7wM/MTNuk4a5sCiC5k3rvEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478628; c=relaxed/simple;
	bh=1CaCMNykkYUh7hQ+271R0JN0to2NHJtCJ5SjZ5tg02U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjHd2WCVcZGTQdi5AVI10uC9n7v7BK093QT0M5jUR25E6V9dxMTFc+juw+27m/nncLEc5HFNznJzAXkbXFNKxqSVmde8TL+47do32lo24VN/p25IE1GF6/lXxcRVBM30b3qNumwfPJvP6YeAgQDUH0x9+EjTMtePyTQJqE1CJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4wOtmTI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4wOtmTI"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65939428896so4578004a12.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770478627; x=1771083427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxHH8jkBLGUmEqgSZepVgsJfG6X+09/IxWLokXGo0Zw=;
        b=i4wOtmTIDoGpwCBUwE88Y7N70J1LuRdVmMZ/wAFycqgi1O1NlirfStoX3K9FzfX7jl
         yjPo7NtzD3lqfjcOL3UhHCdurNekqYKVdkpnJ8+0K0XiqFihICRCrmdovn9LwYakewZZ
         c4dzz3NGb9PXzPTYqjXTz37SxEU9zvWc2hU+/kUJ7mIV/89L2dWRdAvmMqrFF/x3Ajje
         egQSzTlEXRp/3t4/nJAatkGXZEBQkqQFTJmL0H3UZYXoQ6znvWwY9xmJKLNy8e7LFpUJ
         G7o6MbY2oipnQqz2GM7UjLwIlUvdsiOAoKRm0tco+HMMdL6cZPQvJN+HQ4ImvsDVGwqA
         GSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770478627; x=1771083427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxHH8jkBLGUmEqgSZepVgsJfG6X+09/IxWLokXGo0Zw=;
        b=iCwsSoBirL4q5tVq/D9xKCTA+YoHDNmir37JWuFNPpKUAJzvBZZkK9HpadNJQ0DqsI
         IXXo/daOGqFIFu9UGdxg7JMXLYsu1mHv4yWOQH8hs+R6ERtMZBb9FE9hjyBuvUKyV9pr
         qO+SJDrLVfLjSixcuUEVMY9io9SZy7wm1Fs/kWUEnm2ahZ7UxtnRdZnI91FbGEkWkgpc
         BGcSSnUitV/g7zxZl7UgKAg0xpTdFo74uSaYrsgn/6cVVCw5bXBBIo7OWgPzJYpteyJ1
         2D0Fm+66G+dQuv4qjNwPNUG+eYg1zBUNdxoUjq3A0+ZJ/uo3cG2ZCBteESKbrmpxErN6
         FZWg==
X-Forwarded-Encrypted: i=1; AJvYcCVTab2Udi+ttoFN0ANlWVth98U09bKxglUrxJU29sV0YjFp1gu98dDovBunaI1dnGc+UBYRA9Fuw7RVvml0@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo53rWjxnkxx5l5qcl3iwbWLCMW3fVn7kpjhKdGJrTUSlNJT8X
	ES4ZBT4ss3ZHUOpvISTJX8y3aImwr9jPpefekl+k6r23pLPekGLIheL6
X-Gm-Gg: AZuq6aKTlglDxRow2/wVKadlEc7c+VvzJ9eMMWbjVCKS2CCpTP6bciLKOUne61A8BdX
	PRh9qdAySGJM4SlkuxBjhP+G2b2kXKEI1WRX3/laiTO3CBejqYNmCv1QTnDqxvZRPCjrK/JEF1C
	kvklsAuL1P95u835FilLUALo7m8BqqsVLrwx96AeMc7m4Iu9cneHeYWre/KTE62GS40IfGZ3iNZ
	pSpq5l2xCAZG+S3WklI+lsRcrQ9z8JnSJJBckZmYdRkrOEIbdYOh61uw8rYr6C6ut2b+cgjzjex
	2Xl22senRqlJikcraCJIFtZxmqRLf0x0ejnwJBFSTLGaPKzFt2+ZAdB6/z0FDubE8KnQjH7tyCH
	COaXSHE53roTmKk/EXyA8hMiKC2JinKVcWT4ocn0JCLRlEbKvzvcB5LtPZJ6H1kt8SC4THlODnp
	CzQT0U7GddISDyV3crG+ko6fkFVbsdrM6uNlj0fxqILt/IgViYTRhO7O6ZZFMsmtW/L8g5vH5bV
	uLPwyOsP3efnDnL7YgsXPyo/Mdm3z+d8yDbnYpvI03ZjYcsiN8E42N/mITtSpQV
X-Received: by 2002:a17:907:6d0c:b0:b8e:d4ed:5ea8 with SMTP id a640c23a62f3a-b8edf2ffe66mr356683766b.42.1770478626661;
        Sat, 07 Feb 2026 07:37:06 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (170.249.141.34.bc.googleusercontent.com. [34.141.249.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda748aa6sm181308666b.1.2026.02.07.07.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 07:37:06 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v4 3/3] staging: sm750fb: convert logging to device-based in sm750_hw.c
Date: Sat,  7 Feb 2026 15:37:03 +0000
Message-ID: <20260207153703.2049-4-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207153703.2049-1-iprintercanon@gmail.com>
References: <20260207153703.2049-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() calls with dev_err() using &pdev->dev or
&sm750_dev->pdev->dev to provide proper device context in log
messages. This makes it easier to identify which device generated
the message when multiple framebuffer devices are present.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 983b51164..22cbabd26 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -42,7 +42,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 */
 	ret = pci_request_region(pdev, 1, "sm750fb");
 	if (ret) {
-		pr_err("Can not request PCI regions.\n");
+		dev_err(&pdev->dev, "Can not request PCI regions.\n");
 		goto exit;
 	}
 
@@ -50,7 +50,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvReg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
 	if (!sm750_dev->pvReg) {
-		pr_err("mmio failed\n");
+		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
@@ -75,7 +75,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pvMem) {
 		iounmap(sm750_dev->pvReg);
-		pr_err("Map video memory failed\n");
+		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
@@ -291,7 +291,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 
 	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
-		pr_err("Set mode timing failed\n");
+		dev_err(&sm750_dev->pdev->dev, "Set mode timing failed\n");
 		goto exit;
 	}
 
-- 
2.43.0

