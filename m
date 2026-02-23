Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8237881E
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880995; cv=none; b=DZQIii52G9ZObjaiZ86En/BjqLwFiGQWohiB9gHEM5UIrjF0UmariGfHlVzPcNb9WceGlafdTe6RXFkCauPB3PmY9G57auat+rI8yO8/Qx1DqDvz/GHSroi3gL+YOOHxdk2CWA+5tkUePbJfjGEDwdvjHBHqIzdkL1e7oJoWyFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880995; c=relaxed/simple;
	bh=6rrKwA7t2xdnfxQdEHWUilDFPRm0gP2abwyKcFsi1z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuHzZOSIJ/XbzFOQlj/sm9Oil5DspMpaIctm22G4DmVXssxGAhU7U/7BOsZV4Z7mM3iE6U6BXwqNAvy3HP1SFu6TodKHgJeLdEuUjU3GudmnZHzU3tOLWfs+oNc6bekd2bfpRfGIGvgJg/mge6V721DyI6WrtZmiB2j4RK5Z/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PklAJsG3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PklAJsG3"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b90bb0e8376so127344866b.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771880992; x=1772485792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=PklAJsG3YsrDgfEcJVxZaAFV0XrS0J36lw3XHXWQaClsSTdvzCWu1TvbUheE0RS0gi
         5+cz5XMkLiN9sO8WSzt1xWh2T7lB7tWvN9IvrdK2o/kvtrHWPoipoOiLpN9hMfjneG06
         1M3CnDjoXuDNjbdKDR81G0lEczXY0BPLeg8cggOsGh9uSLHQVTa1S9Dq3bHdthVdyG/Q
         rPzdV3X7BcffOeobGySiL+yGBIev8KocUJAZybFodfbIMnTgSEEeSY9iMLMoO88pzD8u
         LOwR/1R8AEPmZy/AjjZEgY7dIomnM3t8eCpSPNBOh3f5mLa6vSgNE1MzEvHn4sHvlTsk
         kGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771880992; x=1772485792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=tK/Ilr5pZ9eKAGRM/CJVjfEHnRHyCw2xyNtnrxKor1ZioJz5FzwUhH2LTaB2naXJ8d
         2Sw7S9zTIJgx7be8MK/mk7VED2oeollxQb+w5tg49ysEAIdSF+ddC255EcuTMxXIb26D
         djzCG/n8pJ9KX+GiYj3+21HUkVOJIP5UeHQvbxm/sGtu0xgMbzK6zJOgal/bLLXsmh2t
         MR127+4Rlu8CoGBkz/ocH/E2qVBcxnVrj8+STltLT1J8foPQi/GaW1eoIkRNsdukOL7f
         6EyJeQZD+Bjzt1Sx2aa0x9QfSTvG0cm5MWA2vAE8U1M3OQNCjea3cSgOkfaBTNkMJn1D
         rtHg==
X-Gm-Message-State: AOJu0YzIb8pHEIeqi0rUnHGuOuyjYvUS52cFqadoqCcOGm+yecPkrVqi
	NJkVgMHi3EO1OkfI/V5E/S4pZ2Mo+GbDT+ITKjXFGImccCp0Kj899geE
X-Gm-Gg: ATEYQzys606sLgynnvMC386nQP3u13t1/CR2D79fWu8o2bPKFWCwIXJW9ockSmnpAYB
	tM5kkwtt9m6g/2GcvgWmoQTkVuDALxm/sO7a5t8Gb9lqBM9Y+PAnvyP8f4o9a332SvKepjRY4g0
	xkaWm9MDqrydVqcJohmP4NrLVFCrretl76lTj30IW8OTAEHfDRga/3TCaixM9sDEUOTd7SUBWPe
	+dTCT3NJe+ozeH9rprQye1/RmuevjRHFlfrMscXBjPO8aSYXwukoI0yv0lxz7xF/z2bcLLqxgsr
	+A9qTZvf2gv44CjQuS09XpC/AxO9n0xx/7qL0E6BGhLRnsfNXJsVJy253EBmGnVAUIvCD8V8M1i
	JwAIb/CGubqXz7od7Oc513bw1kgKdfBeX3K7h1ykPARh9t3S41+18xJQh7G4avHCq9nLJYlXIVe
	iYZsdrhEnV9ibvuo2D/xROXfGhxCfpfICUq+tSj8PADEky79bu5X4aD4Y3m5OIvQ/bf0IftoGsJ
	dXuNcxebkIPSQggh87pmJ1B2xQYRDhsNcneddOl4Ptg7uPYB/i3RIKyqgXnQGn9Pw5VWDhPgqwL
X-Received: by 2002:a17:907:9602:b0:b8f:c684:db37 with SMTP id a640c23a62f3a-b9080f13fafmr610738966b.9.1771880992128;
        Mon, 23 Feb 2026 13:09:52 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (186.209.141.34.bc.googleusercontent.com. [34.141.209.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5dcb2sm366399766b.6.2026.02.23.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:09:51 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 1/3] staging: most: dim2: replace IS_ERR_OR_NULL with IS_ERR for devm_clk_get
Date: Mon, 23 Feb 2026 21:09:48 +0000
Message-ID: <20260223210950.1900-2-iprintercanon@gmail.com>
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

devm_clk_get() never returns NULL, so IS_ERR_OR_NULL() checks are
unnecessary. Replace them with IS_ERR() for both the "mlb" and
"pll8_mlb" clock lookups in fsl_mx6_enable().

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 92c7a7d8fe7e..cea1ba99caf7 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -921,7 +921,7 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, "mlb");
-	if (IS_ERR_OR_NULL(dev->clk)) {
+	if (IS_ERR(dev->clk)) {
 		dev_err(&pdev->dev, "unable to get mlb clock\n");
 		return -EFAULT;
 	}
@@ -935,7 +935,7 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	if (dev->clk_speed >= CLK_2048FS) {
 		/* enable pll */
 		dev->clk_pll = devm_clk_get(&pdev->dev, "pll8_mlb");
-		if (IS_ERR_OR_NULL(dev->clk_pll)) {
+		if (IS_ERR(dev->clk_pll)) {
 			dev_err(&pdev->dev, "unable to get mlb pll clock\n");
 			clk_disable_unprepare(dev->clk);
 			return -EFAULT;
-- 
2.43.0

