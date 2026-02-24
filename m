Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C22B27B35F
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 04:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907848; cv=none; b=oiMt0LiLE1xjoRbsB98o5e+imVa9ijggsmVj5euFi3tUY6LFee7frz1dBPD8GMWgKOpqx8tzXxKdCtky5dX6Q6XbDlWWIS+U3TImPFv6KsL8746sNtUM3EhXvlMAYgnnDogqUUCS7+FjP5cUDtEsNRTZ7OCz0mSWBYxQsWVLLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907848; c=relaxed/simple;
	bh=dZbc8ETNXnn8SNck51WuPGMRhYTdbyHI8M8HjDiX5yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uG1AcS88imDHX+VcD4NEhBp1t/G9NXts2vTpKzz5E02qxS3PMuXaxLRE01lGncTSofImDrDlZR4PF4rp36UkQ49RWTYAnkf9kRFEaMoM+liGbnOHDEcHmF7iFJE1pGC951dfXt+oOYj4n8PBKwrCHuKanGVK2maNHTJa9EyEa5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5XW0qEq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5XW0qEq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso6048448a12.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907846; x=1772512646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL387T3Hi1Jaq+LJ7dyRkcAgffiQgQuIa87AaNCfIDo=;
        b=O5XW0qEqHAqdENXQnaemfFVNXBUFNT3SPLq+zNOf0JTgm6ZCPNNX/jOf/LPMqRlyVI
         SuPoh2ZNMPb0vDjpTfSCVkIgIqaVu1MrKqrnzhHayw+lBy4nCtdB7KreDWy040DnfDyY
         7RZ4fIqS5rReJpPd2ZKtczQmBxj0A4zYWXsAsDisXnXp+XOr39l2xl+EITosgOTXEFvY
         qHK9uS41h4kypAn//xDjkKB/XFwUcFQH7Cj3uVITNKr09aDVktFWe+VTjEIMDLNyDx3R
         wYt7r6I30q2a2IDUHHznsraBtS8Tv3ar1fEXHKo3tPODvftebqYx5MXa04qy8kRqT/Zq
         0lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907846; x=1772512646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RL387T3Hi1Jaq+LJ7dyRkcAgffiQgQuIa87AaNCfIDo=;
        b=uAf7/mDzohFQ4EpreFoHGZrWgI7F4PFjFUWSNMBNDLSJuvdViykF7OJWGUxS3s8EOT
         e22OWsJ0WCmYvQc7BXYML6+9PNwh4i8bJxg2LCagXA7M5CJbGp77LaotXpT13LqWQK0+
         lSTa65q7Vznf1QDviroTNDe+vRh50xGfJrBA8ueC0D9PnMLVTYhKuF8IOUJcR6aTVIq/
         n49Y4E4isjdwU0HTBNZvmc54QxIbbTw25tTXeXnIH8ddLgehrmoAOhQDd2HNPubaLg+Z
         CySjJdmX/mcntMUBM+UjQQ3dkI1BHET90pg5owVup2elLHC3QXcLSH12p1WSTq5p1cVl
         jCgQ==
X-Gm-Message-State: AOJu0YzlWhbf0Fk9sEhMmI1Fg+bmM9cm+ie4Zd5IqmqtkH9muaoqPKNI
	nG+P4ae5PhW9p4QgyXcJ1AwCq5Wt8GUMhNkIoJHVl9rIsLygab7J/anF
X-Gm-Gg: ATEYQzzzuojIcdJPMmBTK+4jLti3uElU3p8y/lhnwnbKNgBIkQaR49dSLNFznmplrU0
	KxMaJEmtDqOwUKvqdAYfUU2UjOXbSPv9u8i4x51sGoXwnSDgxW22bc98/y8uLYYYgN51UDEnQFo
	T5cjRlnQAdjgtQNnoIxoPCiey/dfh3EZ5btms0hRr0LEp4/iybpTP97w2SbDbYaZYh87332mxtv
	ciVjCkT+dRFF2A0Bd5xLSA+nUCEajhc4zdFNq8awJZIe3gX+gYq2/1ocL9Ons/Y55MtEpB7ohUc
	JOmYP0e7TLimmssNOVCaMHS6TeqmXyq9XAWL45hAwDEBVLIKHRbK2McnJuHXmO6SisWyBinZVKQ
	vYfDvZYEtwmr/0vrrYWbbUr5bjwry1OsTMpjnNoKUDoGhtjQbx26ty2Ux8BouVuoUrKX3CjaUc9
	aECQJJt4fAUqU7VEIxVPMydsM48OcTkH3hPUs5p2wEgNiVrdmpr6FR0EATHceg07Fl1I1LeeaFD
	TaRpgYCmL5c+upwYp/OvrKhzHBJy0satgIQHN0+EKRNIcsJ3gbpT7I1ENceb1WXCo9A2WDc5Itb
	t2vaoTOY
X-Received: by 2002:a05:6402:280a:b0:65c:353b:41eb with SMTP id 4fb4d7f45d1cf-65ea57e3623mr5968511a12.31.1771907845967;
        Mon, 23 Feb 2026 20:37:25 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (206.242.32.34.bc.googleusercontent.com. [34.32.242.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9aae0csm3104205a12.10.2026.02.23.20.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:37:25 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 3/3] staging: most: dim2: remove unnecessary string indirection in dev_err
Date: Tue, 24 Feb 2026 04:37:23 +0000
Message-ID: <20260224043723.1828-4-iprintercanon@gmail.com>
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

