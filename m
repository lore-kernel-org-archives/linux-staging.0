Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE12E1758
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273215; cv=none; b=QKosF05JmAXRS/0Crj5pe1zCGN+AL3omI614+O2VuTuG4oTKu+XV8a8GeLcZJd2sALK0E+aaM46y2p45fcXixb1YSTy7hlvrI4gmb+OK26iry1gRQ0oe/dmOTgolbwV2G75joX8TGJlKEj2ov96syT+6ue0cYUZb8LsFp0ZkYI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273215; c=relaxed/simple;
	bh=CeerqnCqr8abcKdY7IWXj0FthuPZeynbfIxJ1HWIyaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ljq2tsn7zAkqPBeFustsjnmfatnP4bakIc88J8NpU05Xet/AvPd2gkNoxzS07eVBjSxPcWvThVUPdhezFLrh/btV+D+ZrXdNgn/E2e7JM6kp4MAdhUX2pXfYTe6RZdqmNyfk2Hi8L/wAEsS3ZasQeGWtPFUGX8Y7vOno1j9JmJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUaRbp3e; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUaRbp3e"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b886fc047d5so533309166b.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 12:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273212; x=1771878012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTXLv7Xoz9p0WwN0J530Lp7vqW1k88a7ctjlVvUXiJ4=;
        b=jUaRbp3eZ4HNIbMg5JqJDovtzuSHPVPtxCRqPR0g+XIoGhA1WcbDORGMNwIgg+FcRS
         8D63RfTq1g1qSI8xyGvfWxwNFyGtIO65EJkVgq6+NlfIlEXWPhzY3EHxn1Wx3y7bUHtt
         3PdfIZNxfZwE9FrE8qd9YNIFkt3UWH9PwUqlFYik87X9rziXtLFRtXNrx0Zx+U54Xyuj
         rMr3u2NKalFUXaV5umHH8Ih2IaU7a8Vt+fbsvqHXLygyUI3M0WvxrfR8utM7WAhaPam5
         1iNH7No8jZmI8/OCAffl2y9lORC0gvU0TKCda1B08zaIGcxZkDMgI7qZVetqpe0g1cHR
         sW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273212; x=1771878012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTXLv7Xoz9p0WwN0J530Lp7vqW1k88a7ctjlVvUXiJ4=;
        b=QQ49RTJUb9BborbDPXl4lFUQQk2Gxk60jyD7wdZZWrQ4tisebwoNYM6UBf0BKYU2VR
         ZYQMWwv56sLJFpQAJGm8b7HsQGoPsq5dlQ+5kRtBR+6WU+KOI7HVviQykwwX0msw5+ZC
         eYe6jiemT4qHU5pHn8G94Bmdp+7WdK4k2DtLbAyfpPvkdFqr+BWPBt4e9cUp1V0IB2cN
         PeDyOxANKmjqRxiU8ece39WYqJvm7k2STJjDaBH9QS+Md2BK3pS3T0pNyIfiFRtwpBJY
         1He2HjepNfuQAtHhWcsMgncINAC8JERw/ZQGTB5n84ImcedKvKQLdfdQs+i1YOz4DSIu
         CmCg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ncNeVcR2qHyo+Y9ceFxTX7tQGNDd3th1cKZvV0Rh/PNoSSjCCyvWjcEa4+wK4rewNlJSwBAI8/Mq9JUf@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp6jSUWSnMoGQRqAh4tLbvJ1DV9I/FViOYht3mSAXAr5uY/Cq8
	2cb/dAgdx9pSk5EaPvwSoM0rAQwsntpjijVxd+DPA0wQIm2AQtlOCTVA
X-Gm-Gg: AZuq6aJzPbEh2ujuPm5LJIVolA9KmlIWl+jHC77lzx3XHpsz0bqlBAvjZCNzWLEpu+v
	Lijn4OFbvDMWlMKjC9o+eTzvpXP4DFUmwJ7Y6XQel2igoTEp7beaKJTV+Gph9898zSH2Z2vbJoL
	X9rtejHhE7em1xyfZxBGTEOmzY9QV1E2vxfwfCSGk/WEDJdpxWu3OUXx3t64+et1zYkzX6TBDCu
	4UpKSPjle5Bi8Jw1Nj42GeqA3Vuuw9tcmvaANaDFYgUjGIFI/pI12nxFI05W9zL3PQz5zx2O1mp
	YBEnHYneeuJ7yKC56Ers5PJDqXZ2/7xrOh1G3JH4IQzVurYhxoxpovQT1GDRzMgu4aKZlN+VbbP
	aSDUFqtZdkRBuS4nk/jnCUBFKgJh/BDNHFq/XYD3gjWrXjdPzR8/QXtD+J42ej6vj5cYtISoetp
	0JIhEMa68wSNajctZPP2DaxiyEpHNWBRtWWRILHPjn1Dk4z9/iKpR8OlaxEKUTJx9OAHgcIkj8Z
	GOX0xO8osgl3YO0il2HVmQ8QDrbn5amPsajwys+RuAtqmkYOG0cBdwe/mmGKsuLrbLOqUAk9ISZ
	ag==
X-Received: by 2002:a17:907:3fa4:b0:b88:64e9:899d with SMTP id a640c23a62f3a-b8fb44863fdmr649791366b.34.1771273212406;
        Mon, 16 Feb 2026 12:20:12 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c7015sm275802766b.66.2026.02.16.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:20:12 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: nvec: propagate error codes in tegra_nvec_probe()
Date: Mon, 16 Feb 2026 20:20:11 +0000
Message-ID: <20260216202011.1806-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several error paths in tegra_nvec_probe() return -ENODEV instead of
propagating the actual error code from the called function. This
prevents probe deferral from working correctly when a dependency
(clock, IRQ) is not yet available.

Fix this for platform_get_irq(), devm_clk_get(), and
devm_request_irq() by propagating their return values. Use
dev_err_probe() for the latter two to suppress log messages during
deferred probing.

The remaining -ENODEV returns for missing device tree node and
slave-addr property are left unchanged as those are permanent
configuration errors unrelated to probe deferral.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/nvec/nvec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a..c4e383de5 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -809,13 +809,12 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 
 	nvec->irq = platform_get_irq(pdev, 0);
 	if (nvec->irq < 0)
-		return -ENODEV;
+		return nvec->irq;
 
 	i2c_clk = devm_clk_get(dev, "div-clk");
-	if (IS_ERR(i2c_clk)) {
-		dev_err(dev, "failed to get controller clock\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(i2c_clk))
+		return dev_err_probe(dev, PTR_ERR(i2c_clk),
+				     "failed to get controller clock\n");
 
 	nvec->rst = devm_reset_control_get_exclusive(dev, "i2c");
 	if (IS_ERR(nvec->rst)) {
@@ -847,10 +846,8 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(dev, nvec->irq, nvec_interrupt, IRQF_NO_AUTOEN,
 			       "nvec", nvec);
-	if (err) {
-		dev_err(dev, "couldn't request irq\n");
-		return -ENODEV;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "couldn't request irq\n");
 
 	tegra_init_i2c_slave(nvec);
 
-- 
2.43.0

