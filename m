Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A80378829
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880996; cv=none; b=gQgvZ5jQeQGnxRy5ij/1VDzOJGoRN3liRqG/WtOPXuDj6vAmFPvaybWmW39vX4hMPgg2TqAiq5CWRLBGCoTm+JILxqUiYtbcM9igGi8aei+DJsjybvbNj5LtyNwS87XzrC3trH4OGRkNqS4yDIZCxxBnYOAwit1Pd5e0sZxfMnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880996; c=relaxed/simple;
	bh=dZbc8ETNXnn8SNck51WuPGMRhYTdbyHI8M8HjDiX5yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkk5GvioYk7e/RpW9LDRD/EjEmK21hL1WDyUizNw2sCJBRvyvl63RtK/ix6q7Olrt3JpUUVIiTcPCq3p9zuXgF+M3Vb7rSK1H52TXXZySYa2P7xAhveSVAYYFb7mZdwvPDcloFKv4VUlj+AqD84/gFZ3brmJRRIbJ36G1wO1hCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk/pl91r; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk/pl91r"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65a43a512b0so5335841a12.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 13:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771880994; x=1772485794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL387T3Hi1Jaq+LJ7dyRkcAgffiQgQuIa87AaNCfIDo=;
        b=Fk/pl91rru6a3rDFLhS16AFPL1eyiq+LoRXukqj14ONBSWMfL4pFpvfP07iKRS7h9f
         KCig5pezlMkcNxNYLUVIFZa9iPK/GTC+VQxDT6LWWwoXQIS/jEQphk306GXC+NFrt4ND
         rckGWmajgfe1VSdeUA/KXlSLp2bsUHTyT8zmvCg9rrL47DdqcMVOzLPny+pqVeTUdHzm
         4d/A5FhtTSvHmKqbDosrtOKiKXpoH88Qa9hTtWZKb0F0ER2jZfgbhqhYI4MNISFq/gck
         e8x5IHTPBERE6Fvr8V2kwSIB4srD3bU4KD2VV/gpCplJDLJlBRdTYQBRNLOUPIE0PdgZ
         aANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771880994; x=1772485794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RL387T3Hi1Jaq+LJ7dyRkcAgffiQgQuIa87AaNCfIDo=;
        b=FSpI9nd7niHH05U13Z6NPHNTHvc4R+kbRdlsgU1rQwkFYgtpjHvJVhuezzaMG1obRk
         aRjO5a6Hd6dA0PI5SCUKQ+Rv1O3Oig9Dt75thheIZYVweLCcxqSGR/CiOU7pldeHwNCi
         b44q/Cc9px53dOZBPIfEyIpw4ho/aXGUzf1WtYZ724W2uPUAyax3P6phEN3rVjLm1E5b
         3r3L59d80/UcpyShK2tbo8QitetyA18Rb2525xvcTLNUCXQRsbxjbfNKKw+pmA2SviF0
         pfa0i4vggD9wKQy7uE+2U0T7+8Lyqv/e4FcW86bcq8QmQZbbWMq9X6i9OCzOByNo8+sq
         Jqxw==
X-Gm-Message-State: AOJu0YxxwQWV+uRqNiKDVjOtqSNRRRaZtoD2oBqg7/hdrsX4Fv5Cp24U
	Du4oIUjYVBBDK0Rkb+5MOOJ7pou0tAv76jy2qhObb9N4mPnotCzl+7mn
X-Gm-Gg: AZuq6aKxKYSF+9gLjVcyPB30o54H67hxFgIpYCYObAR9Qg2RjQfRgkyU9oUVxjE6/8c
	/v9k9l8pPWVG5oJGHniXcSIFPweVIV5p2qowPshFahVo3dkMN+xHsX41Kxuigi05HBCr/hBlE7D
	pGLGZKJ+2XSZed3J9T7WyNCgrruM70nPhBMv4ysny4EkWDfjzYlj0eKgLMEJug5CG6Wxz/BOfr0
	cIYuUS6R/Me0RXTt6ZmnU/SCzyy8Mf8T7TVzvxH5FghCFCqnCCpFisrwTBUxI3wO6dwszl9dYE+
	h2Itl2KGo5Tg5DeNjd+csBOiCFvQ6BlnY5/5RJRqEEXHaSe1UfbCFYRcRStO2pcFjuqnnlFwZqJ
	6LKQ0wM38dwjPu6I/ex9pvY4UaNRED8T7EjjpotML6Sfi3h2xJegW762wWvlYfDOJNROaghPcb/
	RjzVnetC20gnJJHRFWcwprFgWzohW3vYhoF5RhGtx1RPvjtN4Kw1iVzCwvu/o6s3G5ER6/XnvlO
	Z7SBRX87K0wLmcX54+aY6ZcEN39bNtcWjPArWdvyTOel0hRrZYQ+ZoO3PX2kzgL4oI0w05xGm2S
X-Received: by 2002:a17:906:80d4:b0:b8a:f91e:283b with SMTP id a640c23a62f3a-b9081c3b0afmr456176766b.60.1771880993319;
        Mon, 23 Feb 2026 13:09:53 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (186.209.141.34.bc.googleusercontent.com. [34.141.209.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5dcb2sm366399766b.6.2026.02.23.13.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:09:52 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 3/3] staging: most: dim2: remove unnecessary string indirection in dev_err
Date: Mon, 23 Feb 2026 21:09:50 +0000
Message-ID: <20260223210950.1900-4-iprintercanon@gmail.com>
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

Replace dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed") with
the direct format string dev_err(&pdev->dev, "clk_prepare_enable
failed\n"). The extra level of indirection through %s is unnecessary.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index e4c8b4995c61..66617e89e028 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -927,7 +927,7 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
-		dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed");
+		dev_err(&pdev->dev, "clk_prepare_enable failed\n");
 		return ret;
 	}
 
@@ -975,7 +975,7 @@ static int rcar_gen2_enable(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
-		dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed");
+		dev_err(&pdev->dev, "clk_prepare_enable failed\n");
 		return ret;
 	}
 
@@ -1020,7 +1020,7 @@ static int rcar_gen3_enable(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
-		dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed");
+		dev_err(&pdev->dev, "clk_prepare_enable failed\n");
 		return ret;
 	}
 
-- 
2.43.0

