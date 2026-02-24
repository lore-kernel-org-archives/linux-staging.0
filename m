Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A7D21A453
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956497; cv=none; b=LHjhtzLZQ7AK/iW+NhyCXeT9lY3RLaUEiUXk4G0soMjlkVcpOxJVA8bZDMdVIFIv5XnH9ug4ficsiWDjIvaCj7UdxG6Ev0LNQH/e2jLN7zIJgyZ3NuQw8DQkIvjHY6LzOjZmqxdjWyP0bW6zrI2LT3a5jEzbM7ch5SrCSM8jyE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956497; c=relaxed/simple;
	bh=lYSFLw0xah4h/+68xrRS+X6hzYryo1L2cUiMAzxuTP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRT+pJLXZKndw9aDbvqbSUkM7WtospFn5fkWKo9co8zZDL/qdxi5YXTWT6h5GNpCM06uDt/32Hfqp6KrvrHlol1Nx+xrhd0/N1sZBF9pWMaYWkezUtkVLpLecyF99Fsnx+oy0NxacExlSSYOZ4ITBol9zvK/MRkPUlTbtoQD1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6ISZtnv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6ISZtnv"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e6b736b84so5379021e87.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956495; x=1772561295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=N6ISZtnvKgTYvJDyZc9uis6z5fT2/l4RfJU85iYgQQWBZVuVqbME+KU4k5LNnUSd7/
         +nEUTTYfRvjOpBp/lvHjPbtMJL++Kp5oWpv4GAqKqWF7mkqv9mFRNvQ11wdYEwvUW6IJ
         t6hyrB7VsYaE2lcSuhYNpqU/Y5nB2Ybt5kaSrsGc1UnCyQLzdAGSjX3qbalOnpeK/gL9
         eUgHBoCZJC1K3GfaxbO2ZSlxFI5R0c4gHgeRsSPmDN7txh8uM2gUC+XttBI76lVbgNw2
         tEbqFll3cEoiCXFL1gRcK00V9ZsgK5++rcahPDocyrYPybEUXKvUJz2E/MYL+c8cGdQM
         +wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956495; x=1772561295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=VzOKL0uTH+kcbvHVga0pvhhT/i89ZynOT8g1MAgJDjGcBC0N32SQNOxgr8mJbYaHoU
         ULNbRnHB/GDtRgbT3+9uXl/Tcq7Kl97m5QySxAKXLDQXE20hG5uLxG837t2s3Xhz2txH
         4Wf+KcCN1jtbpRn6NMQMwS4YHSsgv3AelSa8f7kfH9FEIrLdkwIHdFxXaqFRGqk+vTs1
         C+4r8i18pf+JuzDHhJsnXgYH9F2rtsgQS2WJE7X+Oy2/G1gnXrmt7qpjz9paik88SKvP
         EweGTjfAtonqvC6Wkc6dEgYDd0xRV0TAjhU6aKgzzUx0FDNUnbtCcVZyR+LtDWhD7bDQ
         AjAg==
X-Gm-Message-State: AOJu0YxOK0X4T6WLlXSLYkFFD032TtjuaOLCsxpCRf8wUuqSrU4O4i7o
	+jcJfaoEVmzasl6a2Z2knajQklK4KaPif9xmgJXRg4A8O6NPUgx1ql+4JcamEt7g7MV3XGWM
X-Gm-Gg: ATEYQzyvOGpNiRSHWIYV1XAcY987uNCpvgEAJlIGfJpRyGTysTqpz9y6kr5frJiQ6es
	xfjMK68Rer1ETuEmWqGnW8t6GKJHZ9w7mOg/Nkxc9eujhWmqlPH4lreYNYNjylaoWlitXS4CDBW
	5iP2sjh45TEgEvjHEKYyFNW4tZHoJfItVsfXbszV5D1b81CwAYNKNTlMejPPU960I0Rxy1c7KOw
	bX/VeFJgUBf6oLhuWqKNK9FFV7Y3joDDls0vrItqNKSfAk2J2l4UeRhNbuWKpzAqbLZN4r7125J
	H/OCjaQBhaqoCL7tInG8KJP7zipHKQGdbXAzT3TOS2OiTmaC/UtkJ7euZWqKLYVyuuakAyZDfrN
	FdQPy169yz+dYu4LH+eZGVN4DGUUFOWEAzykRBJrvUNr0WimVLdnSCDj52cuhRtHf3KZDya5Igv
	kIKnccW8ZumaPCmjKS3oi9KuxUVWZ3nF5qXy7mHuTCrWyY8fMu6/XUUUtewb5rfRo9RkSQSVmLA
	F0Vd/PCNwMG3tD0mw==
X-Received: by 2002:a05:6512:b1a:b0:5a0:f330:2c6b with SMTP id 2adb3069b0e04-5a0f3302c97mr2866539e87.37.1771956494602;
        Tue, 24 Feb 2026 10:08:14 -0800 (PST)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45ba7sm2394810e87.70.2026.02.24.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:08:14 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 2/3] staging: most: dim2: use dev_err_probe and proper error codes for clock
Date: Tue, 24 Feb 2026 21:07:49 +0300
Message-ID: <20260224180750.28468-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224180750.28468-1-iprintercanon@gmail.com>
References: <20260224180750.28468-1-iprintercanon@gmail.com>
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

