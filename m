Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BE57262B
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956497; cv=none; b=abyx/SaqpE/u60jH+vAsHWafdkJol//saqxtrE0Ko0iV8cVPETKwEQ+D8StsvkU5hEMTrtk1Iv29E21jMifjFw0nevXqfz2+hKDoc1rLNoMMTqGTs1SrIhkOWPkaMlLW0RbLAMzm4wibR9KUJYjh/HhjAOJOCTcVw4C3vWvy0UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956497; c=relaxed/simple;
	bh=6rrKwA7t2xdnfxQdEHWUilDFPRm0gP2abwyKcFsi1z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVoqqIn1HHkCDURxqh6p0mVtyIfsNaQAIOnGQzxwO0HohqShxIs2Vji6pyH6rdSXbY9ofqI06mapVb4jmXqI96tf8PjA78G+OS0hjt5Ow1MN/ShrejgOsfbYJCPp+LNWI2TWozN9/nnBlE62X7rWsa2RGT1qkarOJUKzFcDqZhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gX+Yq/7h; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gX+Yq/7h"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59f791a6e67so63439e87.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956494; x=1772561294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=gX+Yq/7hzZrAxggDe/jO2znXDYL+/RtSnp+m/JQenMvGC1oRLgm7FQL2x72CEZ3eMc
         ADA7KVPwJ/QdsNOHGZs2zKA+KS3ad5WvMzA/emM5RDSJdAMGw0He64KKbL69Y34CZQtx
         SJqXmyrYBzyy+ExSCgk1E1OPN4fiYl26GpFnlEptlzs2Ii+PSUMYCzfL6cLqUx4lnLbh
         Oz9tQTtUqIkiiPIwWuPxc0HGjfRYm8v0LHYs/lofV395lZfYs86ze8NO0cZQVrdMKr5C
         QEZ2ovVlYLc7LJXmkvY1BmZStlu3qBynqJfeCfUC7JTVSvAelkefl3xOg2b/ya7tKnxG
         zV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956494; x=1772561294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=f4Sxt9C2WeP963HA2GusBbM7fCW0HbLe+zEUnZmn1+C8UscjerXlebnTsWkrdRnHuk
         XpqTmK24biKpA6u9E/A8msS+sRTHmfxSPOnCK/FjctMGkd01gwAmwaoDX6LFZPDdUoko
         2ksABvIuk63myXrVuh3hstp1w+ss2+SAT/8c8dlr7scK1O6sK0dhE7JJvV6ojp9kxwBr
         xx9WK7YHVpAnvHM+zTF9SRq1hxLKCmdm+Cmym2fVCA3OBW69SFVN1NNMKUorC4xK2wQC
         9YFwIL4nPulxsxCEMvC7WyT0yDfB616KozRNP8sWhZB5gWzy9AhTVE+n+tPF/AgkqKqG
         NlgQ==
X-Gm-Message-State: AOJu0YzjEuTvdZS5hkFFYtp5rrf6r+WBtRNdTu/HfSMVKgStJoZpvaUB
	SxCGiqbv3ryPo2O8W4Oble3SS4d1BJo7ChMtjwmw6gBf1h8XQz6Ew6MF
X-Gm-Gg: ATEYQzyV9d7mtOwAvdxjRMA5lYJY5Fjt0q2uLfe7auQ7ivkUQ6ELCMq4F0LcwlRTupJ
	+HdR+2QKA7mytn45csi2mQ1pFG/m7Gmv7DiLr4n3jYKT9YDr20sZxLmtu1zmZ2mcOCmX7UV8xzV
	FHfwJqyC0g+f514PBdZ5FvLKiNaxOjplWKMVpDcqwbfE5pQG7+IcNABXwjBWvmoXf/qlkln20HA
	ZlY6/M6N57GLNsaj7RojqYm0rUG/RVIxmacjmFXI0q8RZ7sVhUoAiZNUj+mM2HTvTtlyUxM6m9l
	dMvqGtwCUGV0/xDt34oiksIqe6t2jtHY5vBYJbYvVkLyOECDoSOuKTT5NOHEjogG1zZoPdKMi+n
	+MXa3Oceobe5pf78wFUBczpzbbdBWCn0UHHc7lLOVz8ieBNF+FxVEC9Lw+XaQGe3xFeHxQGkhsZ
	0zAlPLWDJeXJYPEOswVC9aXDjW4IbmvkXaLQgfRdmKFgZjYs8UWw3jltUENgbf0ffTYSMrOPBv2
	szgtbzX89gK7fKKneFd48brsCir
X-Received: by 2002:a05:6512:1110:b0:5a0:f58f:3be3 with SMTP id 2adb3069b0e04-5a0fe4732a3mr298025e87.3.1771956493494;
        Tue, 24 Feb 2026 10:08:13 -0800 (PST)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45ba7sm2394810e87.70.2026.02.24.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:08:13 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 1/3] staging: most: dim2: replace IS_ERR_OR_NULL with IS_ERR for devm_clk_get
Date: Tue, 24 Feb 2026 21:07:48 +0300
Message-ID: <20260224180750.28468-2-iprintercanon@gmail.com>
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

