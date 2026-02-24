Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895819E97F
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956498; cv=none; b=MsxpkdKoLXNzeoOmj+xWCMzcZOitXxCwRDhsYjuaPe/0bb+E2irhlo+OMw3yGDd7tFSU9M0QFWuTbVzdRYS7f3Y13obgOqMHpJV2QYeEixdrREOSMI6C1Z/mXfjid/QDdG7nDW4vHsM78fVGucSRsXtQ7jOGCWJCsApd3vsYxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956498; c=relaxed/simple;
	bh=dZbc8ETNXnn8SNck51WuPGMRhYTdbyHI8M8HjDiX5yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvZcV8soJvTJd4X9XJXgRcHBPEWbFWILCkdh7DJg+o0mjp8A9ypUoitVH6/62QzIJso6RbR7Q0tjsd64V18M5nkFNIOJFhGkVKaEoAa0oZrjk9/7RWuHYvJE8rsb57iCg4z9d6x7xVvqwvJqn1ev4A1fvjikRArKZJ928y/4mCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5x6pAEV; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5x6pAEV"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-387032e855eso46860291fa.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956496; x=1772561296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL387T3Hi1Jaq+LJ7dyRkcAgffiQgQuIa87AaNCfIDo=;
        b=Q5x6pAEVeRGTtc6VU2jXUixOd42VAgvLeRGMoXozJvoU3PHxbjvY3PItKRUrKdVOqQ
         ahXTyiVhVqAytyQ8npcVBj+GUx5OfkvVcCWQNVFoWYUudmyoz53PRL/IJqV9wpchV1yx
         entDsxhwHwh1CJlvDTth3WOceRt+drv407MJmSOXyttVzQPp9xJpXlOC37R6ysD+C7bU
         oejd3CglrwWLxV+Wrpjdl2QlYnfUfIk3NU6MKuiNC78edXR6eFqJsNtPaT+rTHGTOVa0
         XL27VOEE7/K8mwuXRsV2rw11Hf5XqPOwEGzbtZ8jCQ9RvjMy5zyZl9Z/GNn8MewHi0e9
         FrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956496; x=1772561296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RL387T3Hi1Jaq+LJ7dyRkcAgffiQgQuIa87AaNCfIDo=;
        b=Grg8NQMe7PLGhjosRj/fFxa/49JDcVpwVVc+bUdED2lgQb7h26mFR3IOxlHCdLJ6AV
         vnYUWJsWISqNsTI9xVN5Jzjf84AkPNCplH0/+bkuQG9yTa6oenrsflL9UruQNkh1TRyz
         sGFWfe+KNBJA+Bxa6/cDYFtuk2uAX/WTCGT4e7motY+C6FU6goPR8Q0SXnN3l6PEmJLh
         so0YUrFl8lrYkm83G3u4PQkC1+TEbtj0kDOsDT8hIyvYtDDqKOVW6GSKiSZAx6LwDHVB
         0sJiKQCj2heU2JQ9REvpBjgBxJaTZnHvZ4a8sWg3EKN5duDhUnARS3BUyZ8JQCmgxCR7
         ENvw==
X-Gm-Message-State: AOJu0Ywo2C81612Skd4hpDHYOqXRg1ZPIwSRrEi3DaF/vyEhw6Eio+Df
	taVt4u7NMKuVYAv8zo4Mek4E0NeUm2IXQz6Ybd9L7snw3b3dyR/XXSi5
X-Gm-Gg: ATEYQzyjqoySBVI/idZ6FNdqxS2dLxo3/TxUHYK4oD56j9qP8xWs4qd3jZTX5v4XWHL
	KMn0wJGL773hCB9ghbiBOr3blTIKrLOmYLyrrcs3GIaqMjHjevzxXog+3m+Od0ejSl2HzuMV+q0
	I9nLNR77bbZ+ZBHbR+vftuVysjbEKVvoQBgfmvRypopJcFqt4UCJUKXkuAgXP2mJsTEHWjDOjdj
	iyxLfMuWT3+SjQb01a4hZOKiFV8TPmNZw4FLuTjESNVR0jCxTP/wJN9c0zshxYtngo176OAnCXR
	2CQpiG9txqb6Jrm78AAQ1DoN6Prj3tYND/4gNnohy6VICJIuCtl2pQ5jpJy+rC9tKgVj3YTv3QT
	V9aRxW5e0T9IBx+W8/9HVpxPR+qIOdfzLiPSJ0Gk7lQuIY8IW4Ec6LmKyyL73m9T6u+LGVyktV3
	qZcwL1C7/aIXIw8JmFqmOYoMCrqLHct3D2+Sl0863gc789NJKr2ydiOYp2lndMPQj5vPefUR2Cn
	RJtW3iRpFAnnwvaLIJASHyR6swK
X-Received: by 2002:a05:6512:3055:b0:59e:65ff:e57e with SMTP id 2adb3069b0e04-5a0ed883be6mr4302586e87.12.1771956495524;
        Tue, 24 Feb 2026 10:08:15 -0800 (PST)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45ba7sm2394810e87.70.2026.02.24.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:08:14 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 3/3] staging: most: dim2: remove unnecessary string indirection in dev_err
Date: Tue, 24 Feb 2026 21:07:50 +0300
Message-ID: <20260224180750.28468-4-iprintercanon@gmail.com>
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

