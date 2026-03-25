Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518F433A00C
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465578; cv=none; b=TrpPjWMqn7BjODqaC0QKS2XhRNo88LII0iT8ViRlarMYyQIRdaDj1L6PfGE1ZpRhI45yCizuYmZUiVhiBG1cZxShkmTpbZq7VAvzYjl5Z22xVP8mVb/xaE5ThZqc+VXaOy6wwlw2z5ocHYrYICc2/NXMvG+RX8ZnxRV9LPWvfGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465578; c=relaxed/simple;
	bh=yMyzaFoknNuQ6pVvN+fu/ld64KkXbgcWoC8dH9PpS/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHsRJRbM0LMkTmZje+xcaQP5OOjCKtIH985GbY1dDUHuEh6suv7vpMVADKj1h9FWLpzXuC+SnTibrSiFLZxHRLj9GiiqYeUKm8iaTtFDPVB1wPTKa7+A/ZgZ593+2mtb0B4d05ML7QBgQDu+sjvyTV1cFonV4ROUYqvLqXsO6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZahcT9CC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZahcT9CC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b611274bso78865f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774465576; x=1775070376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=ZahcT9CCE9lbvVH6o27Oxt0w9IoZNVvJVoSib4SM94PbGD1vm80FXZXjvDroIEQ440
         XsTGCgTkdkraXu/C06S7YJEH+7yMc1GTF5stT2+aqCYy3J5tJ8x9WVkD4f20UxIupVq2
         j/j/UiPjWxeox5gLwgr77XRwnTGwLihzvjBXhTapQEhYum8Rj+FAMwIhX6dTKHvYJBgN
         an1rWc2NJq73UWv7bzpOggIlz1MShv8O3m6RWUr/jizVs3Euibd2srBXpfClwNk6vloE
         QOGoI8HFfTKbVJBJx95CbC5pu0UkMeDsreVS+99VjxbHhppSk2FfesGv071Hj53r2Th/
         FNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465576; x=1775070376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=NnyDUIxF0F7MaYyumM+o3ASiLDCJ8l4uz5o0HQrHAbKit1Uh96e5eKI+IiudRiaa+9
         RSJe/M6XzGAAuyVjSGwo9OzROf7wtsYllSp08JRaMMq9ZFV1vsJVsSGH1rIiRAevRvsu
         s8awjxFf4KkgJkvB6pLNA6Sa0mhVUn6W66HgOdatFVWUTjpi5x91Kg2KlR2ZAOjyg7wl
         mDEemrNGXgar/SMQfhoMA8YyL3ZcQvxyvGGPo9Z+zjn5/JFo6q0L6QEYt1Q/l2xnLqn8
         IYBnhFW/jxbf/ExLEd1v1TdwkrZ4A7g2vz+ZY18TsKrjAjc0xj4eYrFwTVeR8EuOA9BY
         27nA==
X-Gm-Message-State: AOJu0YwrokuVUyHT6mrpInzsqo2hZuNWH+EaFFyNcB6RnRWCU3XSQXA/
	4sPROkyR8e7nY6P9GWf+OXm+xzvCSinEX/b3FwH9WAYG+z9zcCISnKv2
X-Gm-Gg: ATEYQzzFhYPaw38GHPoAW+KzTXsmV5FACW7pZo1mE9dwHNGcIOvsZMQmUHNefNpoSYh
	XIxJzkGT1GXHsekyLC4EXiZO07MIg4JqjQMagoS3KrZ56YFcLHbVab21AjLzvHvYZeAn5+71GxN
	KAFXsSgSFz7IfT4u3Mg8/YAm4job4OBLUG2omQXJn9KqCFxXKbSnhszJ+4O6Uay4Fk6BtnYgKIq
	f/XdbwVYstz1jhuOob8FtXFoIqR7cqdiu3suKG89oC5e5X8TMox/AP4qGI4I2TRXLsnWmzg9Qqt
	mxAGhQ2+ejfE5Trf4qyrSXKOTDmE3w3AtoaRPwiOEOO8S3tNquVTt2bex5cpemHgpANGmFzIW0M
	qmyyOiO810klGzmXdhBOctlfXM95LNcP5Kwr1kRV70O+iUTH0AEiZhOfeVlvLaaqGXp2teNHcXp
	c6MmP0HsIJt4LQi01FKgNhwB8=
X-Received: by 2002:a05:6000:2506:b0:43b:852d:a382 with SMTP id ffacd0b85a97d-43b88a0cfb3mr7301831f8f.41.1774465575653;
        Wed, 25 Mar 2026 12:06:15 -0700 (PDT)
Received: from potato ([31.176.175.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm2090294f8f.27.2026.03.25.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:06:15 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: use direct returns in sdio_dvobj_init()
Date: Wed, 25 Mar 2026 20:05:58 +0100
Message-ID: <20260325190601.7906-2-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325190601.7906-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260325190601.7906-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sdio_dvobj_init() use direct returns

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..358eac0837cf 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -155,13 +155,12 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 }
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
-	int status = _FAIL;
 	struct dvobj_priv *dvobj = NULL;
 	struct sdio_data *psdio;
 
 	dvobj = devobj_init();
 	if (!dvobj)
-		goto exit;
+		return NULL;
 
 	sdio_set_drvdata(func, dvobj);
 
@@ -172,18 +171,14 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 		goto free_dvobj;
 
 	rtw_reset_continual_io_error(dvobj);
-	status = _SUCCESS;
 
-free_dvobj:
-	if (status != _SUCCESS && dvobj) {
-		sdio_set_drvdata(func, NULL);
+	return dvobj;
 
-		devobj_deinit(dvobj);
+free_dvobj:
+	sdio_set_drvdata(func, NULL);
+	devobj_deinit(dvobj);
 
-		dvobj = NULL;
-	}
-exit:
-	return dvobj;
+	return NULL;
 }
 
 static void sdio_dvobj_deinit(struct sdio_func *func)
-- 
2.51.0

