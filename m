Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1361F09A5
	for <linux-staging@lists.linux.dev>; Fri,  8 Aug 2025 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754686138; cv=none; b=FE5Vpqxhbs04gA2Lwpxbu859NRpxsbRvpYUONDxJMuWvrK85KuwqnVcJDhFJ1hb0rnDzzCFybicy2olmBriwx+eftAPadzQvb0z+0RpyesVgXBX3fqjGUMmpaOL0UNAufzRZs5Dnm5E3sNeLLVIZAZIKxsu9Zl3Jb+VUuZwEC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754686138; c=relaxed/simple;
	bh=vOb/HCCt2WUEqQ/efVXEzqAG7wvFxG4DONZYmff06TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMdpqeL3iv2wYaQznaPXM+NM1uRSE+huD0/QSKckY4eZVwKaw5x66aVzYfrdGY6r8cVob6kRO7s5JjAfm2L3CeiBSxjHpf46aM5hdLRtUwW3LA+dAggLXAnGgLs24DqnLlZKR5gEMnNFU0cpdyV7UaPCYuFMcp5KZ2zetx2vWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbL6kJd6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbL6kJd6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78bca0890so1228460f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 08 Aug 2025 13:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754686135; x=1755290935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+FYwnamL8Yi1pORoPawSuyn3NJhs89bPw4JEe6661wE=;
        b=CbL6kJd6JE4h4PCah59CsplEmDUTFnt3tSvmCwhmOlOVQ8hM91pyLM7lLyRRZYLmF6
         W2cjNMBn5ZPOeeeAnG9VeNwawLrY/xLQNjn+w0cH5YUaM1ibEaCozrqA0iRtiZLcxqCf
         EGFZyxYENydq2h4vAVkQgirQl4Dw18DslfqqmfUch1tPczbPVvyD3YhBRv2yug3EaMVF
         lLm6og1yXO3SIk4MQivPqtW1sh57wsy0G74hLOOcNj+0WZ7//v/LL1xkRITtVkFNJ8pS
         BMTR6ittsV1Fpf/zWPg4YSd1az1aNYhiMd8vmmYQu7tCnFd50U67wRYSgduYMdbiRjAw
         6zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754686135; x=1755290935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FYwnamL8Yi1pORoPawSuyn3NJhs89bPw4JEe6661wE=;
        b=iFJa1ZnNgWH9XrFZpcq0jq3WQM3fAA8rfbNsPVNDlMOdZNE+obWXqF32vKP73uRmTs
         VQyc/Mj/09dTe3ODBlAx/i2QPa7IFTYg2kE03p6QLts5TgFJwO2if330J6szkUfEcbWq
         ZGzcPZMexHOOOCO6f96EaQrGDP72EhrhQ71hVNEh87PrgyZQnbSrjNVkxgC6v+Xj/InR
         7j4DEQhHORucYUCIOHB5poiovd8VnmmjWTYm6bfvE9dtcevnFUBKB819KlJjzXymUnDS
         QYh+fLl4U+To97uApAQU5ABn5rKzA+STIp/+pwO7GWo8TXweCnLMwg97IuT1wB+Xv+J0
         y9jw==
X-Forwarded-Encrypted: i=1; AJvYcCXNXDgvkedVBcnPXONPDcEqgvRipjR4hxPWFYKZcBZzk4/i+HzYWXUeC+NxCd1FAyG2aUfhkS3jgZUOe0tT@lists.linux.dev
X-Gm-Message-State: AOJu0YxzmeRkGOO03V3XMko524yoOyOV5GmN181SnTVfWWTXndvov1+C
	39Fnu54qjHK6gLZ+xuOkZ9vSd01mE+1GBGzYPc5XCkpNeERXOwj+5g2H
X-Gm-Gg: ASbGnct7XcIlk0WmsOqI10HphN9Sns+hmJ9Y5R9bKFgJ/25AW5b9XyRZROybYpKxRZm
	cb+pUk8HCd1BVV+5K4H21VEpZQIrSxP20WrAPYCVilEcBL9PZZVUk5r16CYfAGFgYrQn6dMx7+Q
	ZVBF4n+ZoWtDzDJx9cxaoOPdOl2xPZI7oaXkg6MMDI1pPzuMJXLtPhwLdgzAss3DdHL8JV8E8CK
	HpWgTkJ5d3PMXUoNOY7WvYT0CdLAlREXV/boD8xScSSoBFJwFHXPpmChy9NoJXGZuxahAst3TVk
	nlgjBJex+EsQAEsI2Gj58wVZn0MO1kqe7Sf8+qd+7bVgEGCHJtNy/b36tU7rtkOJ97yiSpOJn6J
	XwBFo86bxFhikWWoIa4yUIJaGuzwZwsF2qw==
X-Google-Smtp-Source: AGHT+IG8z9GqClT2tCxGF0u3p2c+ZwJkUeIGJTBogSttYX4uEJmTv930xgqedDBKerv+dMh46biU5A==
X-Received: by 2002:a05:6000:402a:b0:3b7:96c0:4172 with SMTP id ffacd0b85a97d-3b90092fd6amr3528704f8f.11.1754686135334;
        Fri, 08 Aug 2025 13:48:55 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm31815003f8f.42.2025.08.08.13.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 13:48:54 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 1/2] staging: axis-fifo: remove unnecessary dev_set_drvdata() calls
Date: Fri,  8 Aug 2025 23:48:30 +0300
Message-ID: <20250808204831.2618122-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary dev_set_drvdata() calls - driver_data will be set to
NULL in device_unbind_cleanup() at driver exit time.

This allows us to remove the 'err_initial' label, simplifying the probe
function a bit.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 57ed58065eba..06f7cfab4c6a 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -693,10 +693,8 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	/* get iospace for the device and request physical memory */
 	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
-	if (IS_ERR(fifo->base_addr)) {
-		rc = PTR_ERR(fifo->base_addr);
-		goto err_initial;
-	}
+	if (IS_ERR(fifo->base_addr))
+		return PTR_ERR(fifo->base_addr);
 
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
@@ -711,7 +709,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	rc = axis_fifo_parse_dt(fifo);
 	if (rc)
-		goto err_initial;
+		return rc;
 
 	reset_ip_core(fifo);
 
@@ -723,7 +721,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	/* get IRQ resource */
 	rc = platform_get_irq(pdev, 0);
 	if (rc < 0)
-		goto err_initial;
+		return rc;
 
 	/* request IRQ */
 	fifo->irq = rc;
@@ -732,7 +730,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (rc) {
 		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
 			fifo->irq);
-		goto err_initial;
+		return rc;
 	}
 
 	/* ----------------------------
@@ -747,15 +745,11 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->miscdev.parent = dev;
 	rc = misc_register(&fifo->miscdev);
 	if (rc < 0)
-		goto err_initial;
+		return rc;
 
 	axis_fifo_debugfs_init(fifo);
 
 	return 0;
-
-err_initial:
-	dev_set_drvdata(dev, NULL);
-	return rc;
 }
 
 static void axis_fifo_remove(struct platform_device *pdev)
@@ -765,7 +759,6 @@ static void axis_fifo_remove(struct platform_device *pdev)
 
 	debugfs_remove(fifo->debugfs_dir);
 	misc_deregister(&fifo->miscdev);
-	dev_set_drvdata(dev, NULL);
 }
 
 static const struct of_device_id axis_fifo_of_match[] = {
-- 
2.50.0

