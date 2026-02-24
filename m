Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA96280329
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 04:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907847; cv=none; b=Je8OEUC9gJXT27pjpxfi0RNCbNckq/SlXWMpYkx1etYdz0T9/jnVckJn0EZ4hJiHvfZa8LZk8tMaX/bMtlLfu1WXvlsprQInvW9ZnE5XCBV1hTtk7KGkNrgIJ7EhFrmdAOPSeHAsH5VmEn3u5IUwH42vpYwu7PV+5W2KtWE4Zy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907847; c=relaxed/simple;
	bh=6rrKwA7t2xdnfxQdEHWUilDFPRm0gP2abwyKcFsi1z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kySwu9LN3nGbMJHMYVfutJyYPw/adEWXgsM1VLJuTLkTEhKLj57JdKtZdvKnEujRCWiPVWL5pyYO8iwJ7Jg53Ssm2mmAvUOX4VoNRpW8O8Pm6YGQJfsGrVkw2J2bLtzBm7Z0ecuSTk6HwYtdQFvKbdD1cddn7e91vV9Hl1EQFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxp7L2MF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxp7L2MF"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65bebcbffe8so9564673a12.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907845; x=1772512645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=Jxp7L2MF4XvUWAFUCPjkfM72wEl9oUD6WtL0z7d4nkcHs6iOp2zKoqEBZ+OxJeCyZZ
         GSCRurbBx+YSPaoqgr/zy3C8wZyws2FQE6liEGC+RtSXSnhNeoze706YsSmtR7e6P9gV
         IIzQ8CuVkFT4WDI7+EE/kgY2rLq4jrS1Cvvqu5/OXYKsgTsTjpj4LlQWOdsgNyrguH8J
         xpGKeKGDOU6bc4A5v0NP885oKJCcwifhpwL25GB/gjKX/uNdroYY0RBzdDC9vXacL2RD
         srte5Ip7CK4tzFi5fcr6tBJclSRw1z+nip8sKHrJS1A2qPb/EZwOMR9sZZ485+o1wOVe
         FI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907845; x=1772512645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Em4vcQtlpeRbVR/RxCYxW/F57zyFMmk1V0YQNclS9kA=;
        b=E0UIyYI0OfR4w/B6Yn139LB1wbtmc/hzONsAiJ1B1ioiMgvFZ8KZuHHh+ZwgjWzpn/
         hhqEcBCCe7zw9/XtWbErwMVZXx6V1PoSIdRc+bxviboPGDv5cboh8bMI6z3HoZ3R2eIM
         bFepchvH1HfQTZ/hWJby8wDhAi8O+JnfXK0+gUvHq8VWpXCGJXb4p5y1NZKSExbqv8/v
         0EKMX6Ejwho9djr6dmUycTSrleg5/5KA1MkK6+jylBquSOu3zA8DT1GBToc1NmH9IuTQ
         S6JOgRwIjze2XXo0dB7mrSbZd6MyXZKop0JY68yNtqI9u1Xw29AmvuBmynYaC3y0Lue/
         fZaQ==
X-Gm-Message-State: AOJu0YxlCErMQUFFD3Xg2ImT80dlh5+jVyJk52vg3E1wvSGXepITI2r0
	H8/Sz9IryA9mgo4vyuWAIWN89ZFGEW1X+qzwUpN2tzqWwhrlcuqhw5TP
X-Gm-Gg: ATEYQzwWLSNtEw6LHcPQPt/5qTfYge3u4Q4y6xTh8wCBa4B9USaDLBu8G9+Qa3b9eSs
	d46CD9dn0yWWzfgE1PRVhc4lGN1z2mkC1rJcZ3Npw46iGPkX4vgZfP9jFcxI6UdG4xNSfAjfGos
	y/w8aF/h/Z7NsbOP/AXbNWrQsyvVJY3iD69Vg+ySqhxT2Coxaijsy9jpdQBzHZMXdcNLZ6tsRJy
	JhjMHFOD4GfNrg6BzDYSf3aAo8Wqhr3eu0Fn+IBDJkzV+uaHoDqTj0OUJwQMZLehqhVo9CNsEnI
	dPoBEEd2I38ozLTGmaT/EIxqqaLUTR9PMm+1G9tNtA8EtYjy+biKbHrurRbu24cvJ2BeaYMx1Dz
	N+5LuZfQwAHxo8lycbNuXFWYlTyUQ4tQMvRNsI7Oxc3FF2NmEB2u7ILgTSHdGxL5ea1dS/LvQAC
	SGPqpax+p/GxpMI6WyTJ8M5sTnZl8+qLjlxVq0FOiV3VAe82Jf1PDVaKPCSelkv0Jfp9YJKL7do
	TANqxHt6PJTZ7fZAS2DhXoceQm/Ag/LHewAwL/62YnTneMmFVqJ7shju7xMyzezHMtjkkVwPg==
X-Received: by 2002:a05:6402:354b:b0:65a:cdfb:58a7 with SMTP id 4fb4d7f45d1cf-65ea4ed0c0fmr6122090a12.9.1771907844596;
        Mon, 23 Feb 2026 20:37:24 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (206.242.32.34.bc.googleusercontent.com. [34.32.242.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9aae0csm3104205a12.10.2026.02.23.20.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:37:24 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 1/3] staging: most: dim2: replace IS_ERR_OR_NULL with IS_ERR for devm_clk_get
Date: Tue, 24 Feb 2026 04:37:21 +0000
Message-ID: <20260224043723.1828-2-iprintercanon@gmail.com>
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

