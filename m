Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD89F3D5244
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782218569; cv=none; b=SVpeOaQgWtzX40txPKzyQ3lvaKVu7Q3MKgAc4ts0pveb3QMCk0sg71VnAlSbbMVJHvTuPM7sZgDbrUl0mc2/FM4nMxL6dOdyIBxGViOK6Gg62Bb4pq9JFSkjEr7pEmnH7vjzLOJ4T3pjWuS+OfXPgXG19LeAFfoUOUYEKlWfAg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782218569; c=relaxed/simple;
	bh=sDJry3n4p/h3WsgZ61X8aEjtmt2RR1HpHy4XmVa+SIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxZN7iNVE3sCi8UTF2pKfHuanrkoeKOzLan39EZIQGR5/lq7JQcAMXEW6erqcrvug0vUSLE9RLK03BJv7X6lmJeRiovrlcqo5gbiptU+p5fJkZXOWrlC+801Cxko4OuIa5139YfvDR2vtrdDHmD0N4QcjEgpaXO9QOjUT/E+ebI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1TURgaY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1TURgaY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso83384515e9.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782218566; x=1782823366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lI+Gx/YaJOSug/FAWLtqvkYw1/aKXn9WswwE0XjvIHk=;
        b=Y1TURgaYehVcdVCHgQDKGIm1BstpNGrQtXwNR6I7Gxv+WNwiR2NjUefcBWFGHGZa02
         tRm/keYrSUrFFTFvkmIM38zrqJs8e1cLfGCDKzCD/GCVKmXf2FMpaOftFrsmEb5W0btr
         BXo50W6Y3iX7/yi/fjltxtRABwOdFh5WhM8RFiMoGlZQL4FA8zmbMY9tus6eAoZaJZzH
         wNyLLKyQE6KQgRHXxBZwL2GJ2fVQdMCTjL+KBG5nIMmECDZKLbcybPDiw2FkSok/64pP
         0CrtqZPrJOWtf0OO5CK6kqbdcsJLuZBR5qWqw3n2V5AJcKncSuBF7+dAvGvMucHMAEwX
         edfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782218566; x=1782823366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI+Gx/YaJOSug/FAWLtqvkYw1/aKXn9WswwE0XjvIHk=;
        b=sxSJSlg3ANHGeMeo+tqwIEkPil+iyOsxOudYLcpbT49uvSGSZoJx5qjgm/RZGd3vaf
         D4Dh++tU67GlRVosBprfhLRA/P7cZqrEFe/wCUxVM7z1sLfZK/Pw7PFXmEf5+YXSLwh1
         shN+q7OyLHAITPfk7OXMlCmyGSKF+taqD7/L4Cdetxre5Ro+KgVwAP/d0rsOq0NWM1T1
         VoYiAOxSb/vymWs0Y2twomZcvgTlb4wE5XQOxcqwxcBxmAg83lekfOe+3yLyUctR7s39
         fJ8u/3APAFCzaWLB8VFCeN2g5N5/HX+K2mxwH94n3gzCvhAW6e0/vnc9NgZ4A2jWRmRG
         tsCA==
X-Forwarded-Encrypted: i=1; AFNElJ+o47m8IjtqPPQvxzmoZweLqb5qVbsaqv3fuyLxGSwkjuXxrxlIrYDYoSqJaCOo7hdzrbyVlR8pKTSc9srW@lists.linux.dev
X-Gm-Message-State: AOJu0YxRoUXBwGoyNWVDJT3XOR0HM2MpqC+c76e4Uk/OIpkI2z1Y1uGf
	IcbQa040/SlKMOeFdILO8K0jKpG3G9CazLrIBnB4Vaq3NXY/DbM1M0rM
X-Gm-Gg: AfdE7clqwwI7g7iekHI022LTBjQGsl8KaxKWaXXZRBEQQ6dWcM5qM1tVunMHQeg6e7O
	UdHFj/qBGmU77veiCeZkwRABOnCzh+RPH/QJY6c8DYm82o/K9apDpKN11CtafZszZRW2LxO8UB9
	fxlQlnyX3Qtie/JVs7NPGmCVNW1cDySAwCo7+tvVMT+ACklxY77Lcl4E84gDQeEnoYrryWuoZSB
	Nl1mujpnYK4ut4spSsed29ih9O9UTfo8H8WbImwDnPYzThF0PsHgOXzvPN20k8f1SzKfeQatpdr
	HtqmSa7Zt38cDjumlMh5+jItx9SN1lP6e7cYxdOFO9QCM8sDoMWC/SDnf7Uw6Sr1T9FomD2kqNG
	FViZCiMuS6h2Rsdji7JOoyOG+JwLwUQCrLOmntozWepdI1I2W//Jsuvjjn0IzxLR73mXoLaEiKz
	7T/8ujh/UUfQVQ5oeu8qmpdOaYejx0OfFgRkD1rPmyogobzm8BAf7l9Bc1
X-Received: by 2002:a05:600d:640f:20b0:492:408b:d267 with SMTP id 5b1f17b1804b1-4925b394574mr29681745e9.13.1782218565934;
        Tue, 23 Jun 2026 05:42:45 -0700 (PDT)
Received: from legion.localdomain ([31.223.63.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm373897765e9.7.2026.06.23.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:42:45 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: [PATCH] staging: most: dim2: use dev_err_probe() for clock errors in rcar enable functions
Date: Tue, 23 Jun 2026 15:42:43 +0300
Message-ID: <20260623124243.1245-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
fsl_mx6_enable() in the same file was already converted to use
dev_err_probe() by a previous cleanup series.

Convert the remaining two functions for consistency. devm_clk_get()
can return -EPROBE_DEFER, so dev_err_probe() is appropriate here: it
suppresses the log message at error level when the failure is a deferred
probe, avoiding misleading output during normal boot.

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 7953d4626..56f856d6d 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -974,10 +974,9 @@ static int rcar_gen2_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return PTR_ERR(dev->clk);
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+				     "cannot get clock\n");
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
@@ -1019,10 +1018,9 @@ static int rcar_gen3_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return PTR_ERR(dev->clk);
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+				     "cannot get clock\n");
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
-- 
2.53.0

