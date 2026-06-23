Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFA4499B9
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625648; cv=none; b=kU3JKQ/laPTtXCJRAeFpmkRl/uyUqvw19KQSGlRALq4/fJSNoOTv2biuS12Q2v5vkO+x3y+igka4d1e7BY700+mEF/ZUvsN24DJ+/8M4QBkGRBQtRY14AUGwbqA6rKIaqiwOTJURiko5N5hjilyqWcezjd1D2gA4bOr9JTUPAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625648; c=relaxed/simple;
	bh=JGAI6q9kLL1tKj/cfaA7h5qYsJKerfZ6CUiwwiwN760=;
	h=Message-ID:From:Date:Subject:To:Cc; b=c6LOAJy0h6e0t9ff3rhAFXQEDJnRu/jWkQqGRdPsIIDZiB2GTRj0DWSL67m7O6n94U0MbZTXJ7KJQl11vmYnBWqMP9X8LPk8oC3MONaHcy43nujiwvQ/bXNiG8cL+RvG4gEgYbW9NZoDAjCsY/DWC8NFowcB4/nAHWAlQW1IJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT8T+QJn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT8T+QJn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso1022225e9.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625645; x=1784230445; darn=lists.linux.dev;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CQ6zJLDn5aN6cZk8Pts4DCUGUZw96d49DXcY2VMoDc=;
        b=VT8T+QJnXAPX/Z+uGSeUD1Kfr2NJR93cGhv9PqGBnOo56EjpLRzal3yYOQ4bwCSM0b
         3f+g72SxS41iTotRySyQ5xnAELqtE58ccKBsvKnW6FzXCPrEuq8dV/egG6KFsDXRw2fo
         +Rhn8Heu85n96nq6m1X0RC8RRpnV5HxAn9jEdKFFt276MvzsOvURL82gcQ+osnmlPnWl
         7THoFGjjHYLYtSP/qe+SomsgLVLAdBkVW/uuSWQINICmp1KWb3hhFSBg93GDRf+wxRMP
         dsJ1R5cpqfi5EOv0NkC3ciqfFfREHEO+SlQhoW+8IDnMxJ7MLPNu3jQ7DwU+i2KupfBB
         b2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625645; x=1784230445;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CQ6zJLDn5aN6cZk8Pts4DCUGUZw96d49DXcY2VMoDc=;
        b=ZwLps4zTizWVc7O8XVS2yV0PPERYF6/u3yvoN8FIYtLOy8ku/aUrjjxF1xDhSA7+OD
         92Q0MGTgIPKegk6wluue05HQ4xHvveqDV0uDAb4RnH9fRu/rxDxS7Oe4J19h/S9pnpfl
         uaKW1w+sEPUzx0t0ZgVAdS20Yl+a3pdH5kDeSLaMprtyMn0Ey8FKQ2TSkyskKZja8L1u
         Oh6pE1Isbxi++zL8T8fnkgdt0IJECLYwkxrmh83PCfA8TiWVlyox+RXrr7YS3jKhYMoO
         cIj2YNIPIo996KdWDim739I6xWThaLlTCwVTAdGVZ+plXYxVM3RLQfb5MQbN2CnOPm59
         Bk5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpozG1hxz0rwPKxCt9zYU2Nn1R0FtF3fFB+OmgFRnaTyu6g2vJdMxvKkiFJdwYyMUeisdj8gE7sDQLqw271@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb99HULHL/RgcVXR9xjl4O66BvxGSao7f1Rkui5UQA6bg0QnCl
	6CD8GiOjg6xgAcEpXIh0bGftHiVYZjZB17KlGGXyF4hI8YEqikKJgbju
X-Gm-Gg: AfdE7cmSMz1BszdV8jKf4HpHFkDEgrnLulkU6xGA8tFobRXksPonLREY0A69WokPYSe
	Bem/z81RSj7QYInfAGX6FyOV3YK1Idk66FNUjSQJovtLYHH08wGUgJWFmSuZd892KOQf0Y8TCQC
	9tk0RHhuBMhhf2crziGVL3yJJ732PWQhJxxDgsR9CWcpaSXXv/QdsGViJzyZUIw1OXlDu9xjUBl
	GA7QM8vsuutBDzqZosGfLG8V+ScLH1masUkWzS6HGSRwd2m+SWC7vX4d8qK/slk9GpNVlHFjI6h
	ZJzXl7ZPPl4Nm8Y2yPDoPHSyUkbBwTKfTuTizPSkWF0blvQvgmfxM3y9xkYllm6YCUdSj8cSrN2
	gLNbJ1snkwBMFU4QeBUPKrKmrGEVMfCkS8O65NcZ7T7uBBkLA2uNAlIwj/S5kQCp+vxwRSbKFN3
	q8xEIxB5Bv/E0xRpihtDn9zGMzMbDNMM7Nhked2crAuSF13LV91mA6g/I=
X-Received: by 2002:a05:600c:46c8:b0:493:b499:3ef2 with SMTP id 5b1f17b1804b1-493e68da50amr86703625e9.37.1783625644621;
        Thu, 09 Jul 2026 12:34:04 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742a49sm80116905e9.12.2026.07.09.12.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:34:04 -0700 (PDT)
Message-ID: <6a4ff7ac.cef1946f.13cfe2.dd63@mx.google.com>
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
Date: Tue, 23 Jun 2026 15:35:08 +0300
Subject: [PATCH v3] staging: most: dim2: use dev_err_probe() for clock errors
 in rcar enable functions
To: Greg KH <gregkh@linuxfoundation.org>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, error27@gmail.com
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
fsl_mx6_enable() in the same file was already converted to use
dev_err_probe() by a previous cleanup series.

Convert the remaining two functions for consistency. devm_clk_get()
calls clk_get() which can return -EPROBE_DEFER if the clock provider
has not yet registered. Using dev_err_probe() suppresses the log at
error level in that case, avoiding misleading "cannot get clock" output
during a normal deferred probe.

clk_prepare_enable() cannot return -EPROBE_DEFER since the clock handle
is already acquired at that point, so those error paths are left as
dev_err().

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
Compile tested only. No R-Car hardware available. This is a correctness
fix for the deferred probe path, not a response to a reported
user visible issue.

Changes in v3:
- Add Assisted-by tag per Documentation/process/coding-assistants.rst

Changes in v2:
- Mention clk_get() explicitly in commit message
- Add testing note under --- cut off line

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

