Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20949451068
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061064; cv=none; b=SEYn2EThdsMAVOVACwh5o2CrgFK0buh8AU2k9KQyMuYzs/hTs+GxCjNMTXu2Hc9caOtC0++gJrlRKoyi+6SY9zOjKpUFCCKyjziB/BxYzZsWd86rNQ3J02B2Bh1sEzt0L+80gxw1mMa4vXJ8XKDn1mo3x+x1UdhYJp9i88RfYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061064; c=relaxed/simple;
	bh=WFxD1dCi0gdEf1RrCRcbG6DJ80ofO47eH0nGB+1UHro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dkmrPQUJNiRyfUgjJSEJHjJqPa7c2mma6v+eoKemjJNbxVS4sG+IG1otWtSlVIy1QHpDiyVLEJe4CzQzLWAmA2orDwuQ1FAL7pKBsQk0WuyBX4wA3lHJJvFYNPtWxi2lmiNAWCx8Bzkc+PakYM381yleHOK+OgIJVTDuthxnW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqRqjHdM; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqRqjHdM"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd80f56b27so654859585a.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775061059; x=1775665859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUNe/dYEv7kv40YpEMImc7XF/Oi4b6WN91XD+axok70=;
        b=hqRqjHdMW0/GFpbfn5Rzi/Si7rdOS/YH2DQxFXHwiCu9/urjs7E6PO6uKWmL5f91qo
         M/1+WsBlkTcix0mQZfhrmuE+HbB1KXjLrtCmN54FaSTGYBbXoL9RcG5oKBxCmvXdxNcW
         cbhC31Wu6Etvz6v7M0FFsF/+L62MaTRAqSexE6PGXeY5W9BV4ssClLIMJUAEzsCtp4hr
         /9o9LvVZdNdgL/W0SZeYMJW10F3qtAGcX/vQJ0FJY0oiolXBcha9+YukRWQ9lgEo3sgM
         HIOo5aiG8dT3OLS76KNIqEzzGCVBNGw2Hutsl9r5AE+D+CPfiLkvpEKKnd3cRZV8Zd9w
         nghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775061059; x=1775665859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUNe/dYEv7kv40YpEMImc7XF/Oi4b6WN91XD+axok70=;
        b=K/IjlJoVM9h6FVgpvlLXs5As5CzMeVVBjpjW8zox01b452zZkzUO39Mrakvn1IwUgC
         oWkGOUFpEYI8LZFbvV3xXlD47xJHlp+3rP/jf5ylrVYNpDh6W8tU0EQQ+xjyIfuYIv0B
         efbsr2ZL4ZbONwuL3Nshjjmok2uClhpmUu4rklkQWPY7Jw+h/rlQ1x0+9XVyx8XhYCOv
         vZj0/As5jRnwdR7EnXROysxwcKqNrlzvx3eeJ75gEdJceYxZefqoCCCxZV0CLqFeQ2oL
         XwDXAV5mLV2lNIG+/sGClU0aVTL4RRmtEBKl/BToIoch/bRLVNKhRzKm7yxn1eEoUNS0
         D8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvlOXgIgdJ5rm3IH7XjzcHpw3Q/WOpa7OXmUoiviAsPiGSBG6tUTBGvkHTUgtLGQXKiFNqEPgXdABtouAH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy40blMoGwrUTdtQ62cnBA9qI55wj2pybFYvCplreEW8Sa31kP4
	FAUkVZ78TciKg7uZEW1TfvbP02O/Ua36H2dPeV04fKz73fN/Npf+lc+9
X-Gm-Gg: ATEYQzxWr2p1mP3/eHvBjufyo6ZrPiHl6woXKgTMcH0WxDxGP2rAOzPtkqaiDSpgKYY
	zSlHJLC3VK4SjrGh6ML91v2Lj8GAUFcuCZ0Kg/iXUH5Rx2ohEgYnjAJK19Sn4RdaOUqEIknzxel
	2odCuJAL8ETZVNIk+qwGLptiaECnAuwPIyyaXeuRmf/+8U0rC+nCuXpDQKlQjuQWcX7u+ADCvJt
	JmNldoFBYTUUa1n1/lZeYNsW+cMKJwULfWPdliFOAqBpLDz0gT/oayr41y59gi/2eToeFwGe56r
	KIXYh1a9EJ1bKJRi1JyyR1ZnT414V5sthKbvuIqFlgE2VwDOsEmKldTthAlA7fNNRcLH6olmEkA
	qgbIFv+iL+rW5A4boRCEienACZVTEo9NLP362tAeIfjD2vZGLokzx+0nsPApuppGqU77hd7UFTj
	oCH9Cr1QrKLcuzLBMCC76Af6TdxM41
X-Received: by 2002:a05:620a:1981:b0:8cf:d5f3:9a1a with SMTP id af79cd13be357-8d1b5c2a262mr623888785a.51.1775061054536;
        Wed, 01 Apr 2026 09:30:54 -0700 (PDT)
Received: from localhost ([104.39.66.164])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a874459asm12496985a.39.2026.04.01.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:30:54 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
X-Google-Original-From: Yuho Choi <yqc5929@psu.edu>
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
	Yuho Choi <yqc5929@psu.edu>
Subject: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
Date: Wed,  1 Apr 2026 12:30:50 -0400
Message-ID: <20260401163050.34830-1-yqc5929@psu.edu>
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

gc2235_remove() is the full teardown path for a successfully probed
device; it unconditionally assumes a fully-initialized device.
gc2235_probe() must unwind only the resources that were actually
initialized at the point of failure.

Handle each failure path with explicit unwind labels that free only
what has been initialized. Return success only after the full probe
sequence completes.

Fixes: ad85094b293e ("media: atomisp: gc2235: Remove driver")
Fixes: e838b8c69e45 ("media: atomisp: Drop intel_v4l2_subdev_type")
Signed-off-by: Yuho Choi <yqc5929@psu.edu>
---

Changes since v2:
- Replaced gc2235_remove() calls in remaining two error paths with
  goto labels to unwind only initialized resources
- Added Fixes tag

Changes since v1:
- Edited the commit message to be imperative mood
- Corrected the previous mangled patch

 .../media/atomisp/i2c/atomisp-gc2235.c        | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de2..eedaedc84284b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
 	ret =
 	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
 				   ARRAY_SIZE(gc2235_controls));
-	if (ret) {
-		gc2235_remove(client);
-		return ret;
-	}
+	if (ret) 
+        goto out_free;
 
 	for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
 		v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
 				     NULL);
 
 	if (dev->ctrl_handler.error) {
-		gc2235_remove(client);
-		return dev->ctrl_handler.error;
+        ret = dev->ctrl_handler.error;
+        goto err_free_ctrl;
 	}
 
 	/* Use same lock for controls as for everything else. */
@@ -837,13 +835,24 @@ static int gc2235_probe(struct i2c_client *client)
 	dev->sd.ctrl_handler = &dev->ctrl_handler;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret)
-		gc2235_remove(client);
+	if (ret) {
+		dev_err(&client->dev, "media_entity_pads_init failed\n");
+		goto err_free_ctrl;
+	}
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret) {
+		dev_err(&client->dev, "atomisp_register_i2c_module failed\n");
+		goto err_entity_cleanup;
+	}
+
+	return 0;
 
+err_entity_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
+err_free_ctrl:
+	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 out_free:
-	v4l2_device_unregister_subdev(&dev->sd);
 	kfree(dev);
 
 	return ret;
-- 
2.50.1 (Apple Git-155)

