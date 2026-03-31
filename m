Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B23B389A
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986453; cv=none; b=LvXL4SPfFBGE3vKzbMrloyIV4lbtLzqbOT4BGxKnaHB6rO2J2aKvtO0JALoiOlOBiGl/6mN9dz0w3LS8N6Zfa2NAiRA7aiu6LkT44XAOtUPO0OD+9P3uMuZ2OBGtZpsuRi/CR8rjCZaLcrtXMnK0m48ya9EoOLlcI3mtirn/+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986453; c=relaxed/simple;
	bh=4MLhWAsRPS/GMJ77cnAfXcOUDdxvrMlvNQbTdfGDqn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blrwCSt0D7N+0vqlREu8XiBd6uNV+UJRkXRHdl5O/8kk0/5r62skebjY1cvhHCu1EA+Zchu7bCUUFnicSWHdKFMJXbu6P9nj+6Xgh/BE1jnfrMImq3tTVMcdj0+9DVkBlLCFxP0NlAR3kmHb2Smz3kYnUHfPGTPhx5DjRl2dK6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOOcUk9L; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOOcUk9L"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5091d71aa11so3325741cf.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986451; x=1775591251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aahcRlRALmhb180/BpxyHuCk6pNr8BEHNKaLvrFYGcI=;
        b=fOOcUk9LglQJ3VYh8Q8/O0t28rLSnVcn7kAIkWVI+i90ttt0YzKxfSY/h335P5EMbO
         ZH1/fqqu/3hMqkPzI7NSK7M98SZxUmEnhENX/e88CX1SycDLrIPwDFYuXFWWZcPjRKbe
         fA/b5JvZJhwKU6AiUFFIBNYSzKKtOnRw4A2C7HGk9/L4YNz+1y+TvKx+OLVYZKRQabPA
         BPP1HgXfeIaEwORqGllEzKtTnsUqF02+l3R13a5wIyxrmxVFBL80Z54OURFwdHZDDGZ0
         Kd7/Nt029dTXt1WoylXACbOKA4Kn47YvI/EDnzJWPL62+UIKIR+9Uzyh8D7lHTHPorxJ
         HK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986451; x=1775591251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aahcRlRALmhb180/BpxyHuCk6pNr8BEHNKaLvrFYGcI=;
        b=LSldiwjZkvelq9F39YO2uszHCZG9QeeWG6X/AKyNmF1zxQCjMUzChgspsA7bm1hTcN
         yQne4ur8BvAEeO1IwFzr81Bnrzh6NPBqSlCwgOPg4+K5H2cdPKqkSpUljVzU38k77k/y
         ZbwCL9CczLAe/GljOmuxlFcve2CHyoYjDwMoBRZd4XtzLRuD3vlj6kzlMnRj5xzBTBLz
         aUNlj/JR+5cLFvEf1ePWxr3loBMCDAD+mgW1w/GvW/wsyGj/5kURkNnchiyp8Wca1MXy
         7PYom6S/z92/ysLWx/4SdhwgRGS0k+KTp11ev6pKTtQvHFHAhORLcvrin35kCHB3nKgj
         cdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdFV+WzCOk75rW9bc1rzJEB2jKwmyD4XJy5QNg0YM14Ja8GoaGD30+GhIbZ+kjsYF29+2kGATdj6HvTD1U@lists.linux.dev
X-Gm-Message-State: AOJu0YwGeTxE/kp1IrPDEzd6xhA8ckOWG6NirA6LNf41JinoxdLRBJA/
	wDVXQbQNjhUpuC078llIqsZrnv1ohZeiadSn1WS0fxm6eGjjM0Njdrby
X-Gm-Gg: ATEYQzw4nOtvsDC0QgzOwhTj48I6O/5LAD4ejqb5Z49xRjTHo9z+IWp23Nb2Xk/ON7d
	uDOPRiDoFTIveYprdmGi0gV2FBAhMc+yUPHqD8qboivu3/reOVWP/lrWwlZp/tOwBxyFwCvFzzp
	EQRxUTeeLvNaNc2MZxTf97A5vLZwIndpSDLd3hAK9L3cVv25YfEDzoCoyXSu2wRNyv8gC1wmdWY
	0nXOyMgA1LJCqNju31v7B5zT15zd3nLEEujh01YlTijVHTcv/23Hx5Rzzv5Q/wkLVbf0fOKPGAw
	F7JRxh3QWOvtn2NoLZEsQMJzv0fINOvQTDfBHOLiPPHHajHb50b36XnUbw9SB+jBfYgZu1qTsv2
	M3JrrEfQGl5bpS71URrLpKl6aepWhcuLBsJQyN/4gL3CAlb0jiuXNdPaDutu3kwaUQ6ALvTgG9z
	4wagsa5s1qkGKMYswqA5BPkT2QROejpSzJ//GureNMSKeX
X-Received: by 2002:a05:622a:8f13:b0:50b:485f:a06d with SMTP id d75a77b69052e-50d2c8aff39mr38438811cf.22.1774986451299;
        Tue, 31 Mar 2026 12:47:31 -0700 (PDT)
Received: from localhost.localdomain ([104.39.66.164])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364edsm96119246d6.46.2026.03.31.12.47.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 31 Mar 2026 12:47:30 -0700 (PDT)
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
Subject: [PATCH v2] media: atomisp: gc2235: fix UAF and memory leak
Date: Tue, 31 Mar 2026 15:47:27 -0400
Message-ID: <20260331194727.52054-1-yqc5929@psu.edu>
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

Handle each failure path locally and unwind only the initialized
resources. Return success only after the full probe sequence completes.

Signed-off-by: Yuho Choi <yqc5929@psu.edu>
---

Changes since v1:
- Edited the commit message to be imperative mood
- Corrected the previous mangled patch

 .../media/atomisp/i2c/atomisp-gc2235.c        | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de2..f4eb15d307fae 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -837,13 +837,24 @@ static int gc2235_probe(struct i2c_client *client)
 	dev->sd.ctrl_handler = &dev->ctrl_handler;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret)
-		gc2235_remove(client);
+	if (ret) {
+		dev_err(&client->dev, "media_entity_pads_init failed\n");
+		goto err_free_ctrl;
+	}
+
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret) {
+		dev_err(&client->dev, "atomisp_register_i2c_module failed\n");
+		goto err_entity_cleanup;
+	}
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
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

