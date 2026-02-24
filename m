Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D26279DA2
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 04:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907848; cv=none; b=Or0SW4DcFABffVlHy/n1t02x4VD4HA4FTHIGaHJNCSTvE9XwRaZrkL4W6VRxxGuyVNOIIT6nJLKRwWpJA+GSN5zL8NOJ0VJ7I/QIGXm60182sa5QSoy+oYGjtpQXxyOWC9BVvouQyYSfQgES5qL0X6bIwwtF2SYEspTUkwJlGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907848; c=relaxed/simple;
	bh=lYSFLw0xah4h/+68xrRS+X6hzYryo1L2cUiMAzxuTP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrPIlkxgamuyzr8eH3REZdALstTunUDaQINSORw/3idQaLKtTaErL635u5V1xI0mZmCplIUP0kgMNdS7qlsjcV1zzZV7Osamls5RFkBK3XboOLggBoCMupSER8VnGSM+Wl9uWdFKaB30rd0wuRMr5EiYfd+cfUZEiRcWr49TvzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdyV4GfH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdyV4GfH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65a3527c5easo8861457a12.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907845; x=1772512645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=EdyV4GfHSKQnsGXCf9/Hb14IF1ByK4hS9ASGdsJguUPEdYrGkzmHd3skBbhEoMfkjk
         moEGWwI69kZbDgVVf7bMBtRmIgmk5MnVJnWjNMRNzh0jSIQPhqGpWb1Y1WY9DcMEnlA8
         UUEb5e2PGtvOFLIdhFEFzIkKH3+VxAgMTyCr7aGycBkkpoC2SMElKwVDzhy/LfUPb3rJ
         Gh5+jd9NXfJBXo/IZB6wCoIgxsifuZULAYMq4rRY4hQUXG/74bYf+HG2o0eeFbBgJmwb
         DXRQZgSKheBQdJnYU6zece8ZGz5JmtQuXXm/JNBeN1n0O8RqXNMxHtwcdcDIeWyiqd+t
         bWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907845; x=1772512645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GgYaJHOEUtfkRSeV4/ucyw2w3tzEF0ffgSH0n+B20gI=;
        b=vc4xW3ZnSu7z2B1BA2ED0Fub4zkPHa76LgP5Mj6KCmn6hIQ30GF7aHC9Uf8CexPLil
         7raRbEbTIHExBKqenKZ1XNi7XAGpOVVSyuUE99RCKck7505qC62DA29EssrpYwWqd15t
         vIzkKe8c/KTM5tdCDFmSDBD5FpraxIf9pDl71SW/SGEyRKaitBOz2hfL8Evw4oI6fBDp
         W0wG+V42SZh3E2sj9ozEuWTlVdlyGHa/eDFpV8YdPWXW2cN/WTPGwvwyf6v+n/bQjrPT
         sHrH+RhtIr2c1tWOlVEkhab7leZJnBa0C/qtX+9YLN/EaQ5xfugFtFeYJs4gDbLWIzfm
         K2cQ==
X-Gm-Message-State: AOJu0YwmsUIbJrr7rgD/521tgsK7P8+RIaa8Esd8cxFxubpjbJWVF9oK
	7Su9Y5T997ray/yy7ik2NEyvMIpDePpuFUj12rDokiqZ9De1LdqXPzU7i2UCFLdOB/IB/Jr3
X-Gm-Gg: ATEYQzydMHmCCehvBkoptr8ZcDDAej8932Ul8KDQuoLrqv1Fmns1+dsRKpVDlX9hei5
	FnURsq76vqidp4Kr9GGU42YQKSooRN7Uae/Ffh5j2eEIxfUX/YN/7XUtUFLcmxkUcr6NPI+z/ck
	cHOcjZZikhZmP68bSm2oIG3Ze5Oxa1JHLGi1csiJ++aFFAIbPDFwmoVaC6xVQh2osK2Y8VIyiOA
	w5hMJMPJjhhDM3uzSQKOhwnKTj4mTirFpb1Lz8q4/ZqX6Rm9L252H+bduYeNozpbxloX9994J3k
	vqFouFUP+nL+VM+8XJavQ9TLedl8ap4zIKNTly/XpUYXsF5MkbVkUjUAfcEjXA6PBYUR3flIhT2
	YKpq+HDehN4r90fRr/YUhdOp6Px3BMgx5FTErhUrOINflM4GpEuynVZ0AqdVNRGoQqh/5nuMp1/
	Okqvf4v2vOf2ZL7qC13fYIcRdKF1zLSR/eG3LT9sUZWv6tkPjgnWLFhPlQMTGaByGDwVDaxhxBh
	nL67a8PWeA51D9f78JpTm/EmWHsxEV3EAOSbUKwLwYuuu1C6Z3o6MWm2/Ss3ouFg/mcJf00Rg==
X-Received: by 2002:a05:6402:270a:b0:659:329a:bc12 with SMTP id 4fb4d7f45d1cf-65ea4f09947mr6418457a12.29.1771907845192;
        Mon, 23 Feb 2026 20:37:25 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (206.242.32.34.bc.googleusercontent.com. [34.32.242.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9aae0csm3104205a12.10.2026.02.23.20.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:37:24 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 2/3] staging: most: dim2: use dev_err_probe and proper error codes for clock
Date: Tue, 24 Feb 2026 04:37:22 +0000
Message-ID: <20260224043723.1828-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224043723.1828-1-iprintercanon@gmail.com>
References: <20260216201921.1788-1-iprintercanon@gmail.com>
 <20260224043723.1828-1-iprintercanon@gmail.com>
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

