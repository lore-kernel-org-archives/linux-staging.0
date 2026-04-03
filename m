Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39570138490
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775175808; cv=none; b=ihLW89TYrH1nJtywscinLM2VdDu6kbqL2LRHIYkGBq9PKA5jlz2GpB9+RNrf/c0pny7dYOsoWDq2lg7IgM+7hbgbwdDivfsJ1ZwXCXbEOoawhN39fBiwkoWhsPCn5JPu3uDIyO3XLX3r4s8e2ZVEVIn6B6nY6lz+YGR+G3dOr9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775175808; c=relaxed/simple;
	bh=MHysRRh3hIUZ58zqF7zneS9FyZKt7+ftsdeVzCtr4Us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dfBG5IvOT9lM4pmXnOQCiTXsrTS4BW2qpjY46mkSE8e2U8ZR4ftgx14TsSF6tjw9pmF0V6JiEePpdi1c2zPkE5mFKYq5EGoxJ6PdGPFSWIzeFyFjAkeR4hJhAy9qE7xBiOQQq566y2fhWszKzJ7B8D5qdgEWHo+IrVcPXXMS6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgmZ9VQz; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgmZ9VQz"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50919fc3a14so14778361cf.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 17:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775175805; x=1775780605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gcgUlRJBBlinNi9TlCHjloLPOB6uLf9+TDA/1HPzAQ=;
        b=CgmZ9VQzjmdmYpxbAzW+63NpLqzeIvhAoanhlB2H92QSolIbeyk66CSokOddWOci5h
         t4xBxNzKqQntlq2SMrOFSqXnUJ5LLMoIlNPFxY89ybvFZe/fBmmQEJRT2TMWpzyiQFbh
         tlblrtA/vyWOT368F/K+X0lNSMRBahPjMUO1QYBl5XDXKa41vr8iIywV0ZgV/sOZTBGx
         vTCZH/F0xm8gYfz1COuNgiKnabpYXGMC3YHK+I2q7IGabF76qHCpjpUyRteq0/CtJglr
         xoKfqvzVF98ug9hEnYdgvQrWqu6Yyc4WRga6hkPKZcH23H1vYYUXDyS0oF+W+RTjZ+oC
         hSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775175805; x=1775780605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gcgUlRJBBlinNi9TlCHjloLPOB6uLf9+TDA/1HPzAQ=;
        b=juatDNmSCCERMGlnEgxnNOqE92+UYOzAiMP1SgPrb6xzmQootpJsIZFV07mEJ9Lhvh
         DP1F6YShC/tceGkXG7j47DQYrP2T3I1QwFvTEhma0oDfB/d1d7VjomriDVoE8PIOoL4X
         A6JXwkeBwfUgipvMKLk0ddYdP2PuzUARRmPzWFDQ4FQNHO+gSFv9Vyy9kdL4p+TMKVfU
         JBKgjVEfoxJ2vD4oniowzjeVmcugabC0DvqLwAahIuvPCOdfbGGwninEgMWkYT34G07d
         tOI0ketLYe7LmxbC0ornqAkjxTmTD4SmnvncK5Cu34nG2sdLDTZBnhGT4wS+aTCnew+u
         2qBA==
X-Forwarded-Encrypted: i=1; AJvYcCU/oDwfjx1bO23JX9nxTlfQ/dsuFK0a3ZZhhzZ/0adraBD9AaIf/y0ysRSIVanvKoIJhOQGK2cTINSQ22+R@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5ObbzPaNsrIbyhKH+FrvrUlcVWYQf7HkzhQxPQvxzm/L1aAah
	h/6ET7ivg/WK/z+Iu2aXdfVTqEBv1grpuNl6PYezV6PwfGghVZvp7aHq
X-Gm-Gg: ATEYQzzm/FM82jFBwsF+THuxJBbeQpVmxvippgeumPBS9aMfbzCGqzzO5ViUDK0XDjO
	/wLb9Wwx/vqxNFvlNjJusHVMIf0+yN7qeqNRYvvis4mVqRFO9xduzc7/ahSzKmIb2H2XHjXOFg4
	/DnelKhk5j/JvpqQCg8WDxka7SeEX9DOiU/eIRNURtytNvET8fEWCmrBmf4f0eiSv+WU8wSlswo
	g/xDE18E7X3t6lD9aZ2iYTsdbjdDCvp5LkrgFtiLzmO3Emm79JxNNy2han7EpD5cFD0Qs3r06YZ
	kFaGx9BIQryeAuUpUS6qMFtnEy3gLrTX1DejJoeahqpJGlZ9G1cfu4awoygGEzZWpMdgu0pNE6e
	wKPvYLeNkoTdoCtrqzJ0h5loTyItpfnDnFaRQP6B7+EA2zT4NNPHIT5yoRS+7SzKGvxVDPnWRg0
	DQCF7eKHCIO3pKwzE+TOPi15hrCas=
X-Received: by 2002:a05:622a:684f:20b0:509:238f:ad92 with SMTP id d75a77b69052e-50d62894aa8mr17321391cf.24.1775175804180;
        Thu, 02 Apr 2026 17:23:24 -0700 (PDT)
Received: from localhost ([165.85.38.17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b88914csm35692941cf.23.2026.04.02.17.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:23:23 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
Date: Thu,  2 Apr 2026 20:23:19 -0400
Message-ID: <20260403002319.12771-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gc2235_probe() handles its error paths incorrectly.

If media_entity_pads_init() fails, gc2235_remove() is called, which
tears down the subdev and frees dev, but then still falls through to
atomisp_register_i2c_module(). This results in use-after-free.

If atomisp_register_i2c_module() fails, the media entity and control
handler are left initialized and dev is leaked.

gc2235_remove() unconditionally calls media_entity_cleanup() and
v4l2_ctrl_handler_free(), but these are not initialized at every
error path in gc2235_probe().

Replace gc2235_remove() calls in the probe error paths with explicit
unwind labels that free only the resources initialized at each point
of failure, in reverse order of initialization.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes since v3:
- Replaced goto out_free/gc2235_remove() with explicit unwind labels
  to release only initialized resources at each failure point
- Replaced the "Fixes" tag with the original commit for the driver

Changes since v2:
- Replaced gc2235_remove() calls in remaining two error paths with
  goto labels to unwind only initialized resources
- Added Fixes tag

Changes since v1:
- Edited the commit message to be imperative mood
- Corrected the previous mangled patch

 .../media/atomisp/i2c/atomisp-gc2235.c        | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de2..998c9f46bd068 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -809,7 +809,7 @@ static int gc2235_probe(struct i2c_client *client)
 
 	ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
 	if (ret)
-		goto out_free;
+		goto err_unregister_subdev;
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
 	ret =
 	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
 				   ARRAY_SIZE(gc2235_controls));
-	if (ret) {
-		gc2235_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_csi_cfg;
 
 	for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
 		v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
 				     NULL);
 
 	if (dev->ctrl_handler.error) {
-		gc2235_remove(client);
-		return dev->ctrl_handler.error;
+		ret = dev->ctrl_handler.error;
+		goto err_ctrl_handler;
 	}
 
 	/* Use same lock for controls as for everything else. */
@@ -838,14 +836,23 @@ static int gc2235_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
-		gc2235_remove(client);
+		goto err_ctrl_handler;
+
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret)
+		goto err_media_cleanup;
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
+	return 0;
 
-out_free:
+err_media_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
+err_ctrl_handler:
+	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+err_csi_cfg:
+	dev->platform_data->csi_cfg(&dev->sd, 0);
+err_unregister_subdev:
 	v4l2_device_unregister_subdev(&dev->sd);
 	kfree(dev);
-
 	return ret;
 }
 
-- 
2.50.1 (Apple Git-155)

