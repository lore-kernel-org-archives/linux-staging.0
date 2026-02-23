Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF5377576
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880997; cv=none; b=LVHs7OocVEhrH51sX6k0ZUvUL+vC8ds+KwA5p5sV2/5pUv0p3fGlVUiaK+qlH1pAiXEb4OHVLz0OKjlQaAATuhylxyxgyIFhJ7a3uKSXO3pqHgd7MwVKDEbTANs9cfZh56dHCwjuikAaaOG0KKH6+3AQmSl/M6CEcXtZfSxpp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880997; c=relaxed/simple;
	bh=lYSFLw0xah4h/+68xrRS+X6hzYryo1L2cUiMAzxuTP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruzxMsJv69QQIoWNKeeDSr8oH1GNlzABahFwIJfcxRf30syAwvJyCs6WBFyURKPiYfGdm8CkizyrWvZF96vJn3uwxUviMVDb0gLfVccj7HL+pkhIPvi8gisMERIP+28y40sgJVng0pBnpASDTC1Ir+S27vkacVCHt+Af7j/dfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaTU0DMv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaTU0DMv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so677178266b.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 13:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771880993; x=1772485793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=UaTU0DMvvcpbKunIKWROdR3PSnO43XODe850UFFpIAkvlWSBhjFanJSiWsIfnT5De/
         78v2lX9W3rjcdCOUUNMwtX2doTfz9EgGHIRy8bRsWtSc3MhhZnxbbu3REtwc06vGDlzV
         Mxq+WW2QdZEfU0SaupS9MdZpK94EU3KDsbkUAvhp/897GbtLOXFI+B8I6k/ogn8YrEhz
         TPRPQZqI8L9McwEILuEdieZBeW7Fw4BpCT5H0UD6u5/UrDl83LqoDoPWWbPuwv76fWfi
         3aNeBbZ/q0YJpNX3vIPUsYGy3HbaqqmMIucpxIgCSNuitxvEd/iEEL2ooauuTgx7WyIC
         YRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771880993; x=1772485793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=CXemgefNpn0DmQP+l3qaBGAV7hhm9PWb7KRmHhk2q2h2aFJUz4BAGv0N/7RVOE7DLc
         0WqAoX5BUEglvSAAgKKIVFfjEnyZdZeZofGSm8pfa7c2Di3gB2nINwRwkGQ3haRSPVkv
         TXP8HD02e5WtnJgm9tDt/QFjeo/xW9yGMeoORQ+0oNBfXDT0VELW8i3tLV98Xav4GiZW
         pcYYr4rFG3IACiHCGa+w5Eh5H9KUdyosuLvHwIpeqmgcJF8+vJM1JMVyCHNS2lXjBMyq
         pss13W3mepbdpnAvW/r89aFbOkLGOzMcIIzWASXxi+X6aodOuyhefwNgL+oG9+M3ej5g
         CDWg==
X-Gm-Message-State: AOJu0Yzjb/+7Gg4tzHMQIcdnbE2mWgQ2USG7w6qSfgZz1jcoexsVkb+m
	yb3b4WjOuxpQgAYINAJcfJsWyH9516JV9Xk2599jsOrSyvgQUEQq+ZZl
X-Gm-Gg: ATEYQzwijLZboAB5yWDxoz6/KnVYNJjJHSjFuRRsLzVukWkmc3tySWJLnP3sy3zMfBp
	uj8pXuO6yHasuHlS11DqCDezkqz62WNL8ICgzGat9V3tEbzO+pR7Hk17xPg45aNdYZ+PP0ZjXCH
	lxl7wM9ewzpZJurGiPXyxwWTWFwrS/RUQsWhhLj2Ty7JWNH8Q1NxTFcgL5UyBVA2fG6zzNEWQv5
	jsa7qvkWKxAEaUTBq5Qr81Cq+fQXAKNFYquivf82T1xRpDkApI1IRgMMrLo5t58yfdEolyUdQTY
	HUBgtddMfyVlAc3Y09uSF+ql2eVgtVYhNpVxa3E9UWSGir9BqyWNqu4wVDTTVx6T+HZENKfOrq8
	6ObdVU3T4YgaR02YYrDPXm+2xu9KOJwcxNjqIn3XmyeCg2AUeQg+mLkKwSDo2kK7u43QIezV+Gf
	7Rb5DQKDwhFEWHeKbydDs0/MYTfmSM09nJl7GbFj2VgGa0qZiw3nbZH0UkqZfeq6Wft4GMLCKtd
	JvsTuS1GsimaRRpoN5jSSA342APqY/yrnwje0qmCIs7IelYm8MIPPL71EJWqnYJxFdynyAXN8uq
X-Received: by 2002:a17:907:3e02:b0:b8d:be68:bc24 with SMTP id a640c23a62f3a-b9081984f15mr662564766b.11.1771880992699;
        Mon, 23 Feb 2026 13:09:52 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (186.209.141.34.bc.googleusercontent.com. [34.141.209.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5dcb2sm366399766b.6.2026.02.23.13.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:09:52 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 2/3] staging: most: dim2: use dev_err_probe and proper error codes for clock
Date: Mon, 23 Feb 2026 21:09:49 +0000
Message-ID: <20260223210950.1900-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223210950.1900-1-iprintercanon@gmail.com>
References: <20260216201921.1788-1-iprintercanon@gmail.com>
 <20260223210950.1900-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded -EFAULT returns with dev_err_probe() and PTR_ERR()
when devm_clk_get() fails in fsl_mx6_enable(). This ensures the
correct error code is propagated (e.g. -EPROBE_DEFER for deferred
probing) and avoids log noise during probe deferral.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index cea1ba99caf7..e4c8b4995c61 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -921,10 +921,9 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, "mlb");
-	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "unable to get mlb clock\n");
-		return -EFAULT;
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+				     "unable to get mlb clock\n");
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
@@ -936,9 +935,9 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 		/* enable pll */
 		dev->clk_pll = devm_clk_get(&pdev->dev, "pll8_mlb");
 		if (IS_ERR(dev->clk_pll)) {
-			dev_err(&pdev->dev, "unable to get mlb pll clock\n");
 			clk_disable_unprepare(dev->clk);
-			return -EFAULT;
+			return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk_pll),
+					     "unable to get mlb pll clock\n");
 		}
 
 		writel(0x888, dev->io_base + 0x38);
-- 
2.43.0

