Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649637F018
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773870092; cv=none; b=lI70sRV/YRIvGqcHbYxG4Nr6HN6bYhagg+mRBKEngPYZW7dAunG1nLGpDX1oH+CeMASs2EtDLDXQb5fgR4IjEGnEPDe/briK3dlQvfM1GQcr1WiPklSFl8FW60IbafaJrsAqZRRhwNvpjerZAxOB5kL08IrStTR+dn0o6TQFQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773870092; c=relaxed/simple;
	bh=CCLfGPmo3oEX7y+08RUpRymT5dj7PG7uc1SEeuV84mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfWjem33pVvpcer683uPc4tr8bC/5juqFCfyOqQwWg/kFv9HijiomIarReguScTB41rhs9cDB9auQErNCBDsNUFbW1hPz049XJeph2u6JMB8BezK9k17hEZAmOZa4NDgaVZ/9dxuu09kSIjgB/WsyVhe1RsmptNc0sUWYsgvYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUUnhcTK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUUnhcTK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so3051725e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773870090; x=1774474890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1az6/7PZmrBFavANPUIaTOGaFYDI7vbi47TrxB/EPko=;
        b=DUUnhcTKKEM8ReQCCQo9YaOV8DaTdIRmnzUblMiKhE279H6EPD1F/0afzbTlti9nJz
         SybptH84CeOKRXYblUn3O3qOPtxMDWpHvSDHoVDIULlovCJzmKj5ulo45CgY/F95cj4P
         tSj1+Jau+c4e5rVxSs+rBdNQBduV8X6k2r2yeygoWkuCueyr4qxO++17yWXk/2QVN+hY
         cjLRGZn/U9r5GGW9ZtD6uZIatk0x7F7J53X0+hnDk0DI59PmPnZ05auW5gOkFmYtZkpA
         PjPaXhvKqF+rnGWGpRuICAk+Ww9KP6JNwCAYeyyv2A5EKFb1+U3r7Eyx2fYpa6s9lWit
         a6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773870090; x=1774474890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1az6/7PZmrBFavANPUIaTOGaFYDI7vbi47TrxB/EPko=;
        b=dRvOb0cRsDbM+jKfti5WDr22dDb4dKKMyz7zaGhANxelO8DS/CtBOzS0Dq1EOPSW/v
         aJXtae8npmZ/YUW+iJwRKSEeNOP870TQzVab++kmxMKGCkSvusEqEZIg2T8W89609xvS
         +eY6z0Ud26jAy20VokQve+lsw936nmLjTf5UYjDmQ2jWxoojV+2sYI4r43a2VCbZ5y5e
         dZ16ic9e3URgOLpz3z+rCdvnsuyKYMOj+PfMCAq++TpwQAhz6+WuAcf3LMqlMzQRTR/e
         XHN+niL8BbOfvcop2+yTmT9R5kWOLitMGypgtAXccte3xVqTVlRhM/AIJ+vQL33T0iYo
         Jbnw==
X-Gm-Message-State: AOJu0YxfD5NeTQaYRneDiFMSmdFRDAnxdwoOXwohh00gu5jDYUxehMN+
	IKcJMRu8b/nXftHtojkleOW+nSI9H7EwS6gT+qtfIwbQ0mtJRB/mB3wDOIWIqg==
X-Gm-Gg: ATEYQzzuSKOYQpYMq9CkFGO4wWW6Ss9I2KBnbPknf/6Ma5hNp39aTW3EZnkpd+0ze3f
	lkX12EhTjl0PYnu9tXj0BxoK4LjEiL4qNqsEt1CehfdeJwP9K9n3IRFIizEbfUip4IZAUy3QDKQ
	ooDJsvwW+zfSu0H5L3bmNLFO3IxN86OPfCg1Hl6015AaGwTkWP5f4zNX+K+NEbOJ4BZFJdK6Ruq
	rtuXeWcOp/oEzf2lb5/w4QoxvmIwS1DMkigWwAi/GAeHmL0IjWzHUS7//b0NnpPAsloS0J7F5Mw
	StNTSUuwC9gQHTn1Su6JNLc0vPOx/BqUbhTtKYaGFe+VMvsZByfLMeQv1F4BP3k1XgqEClmnSCP
	H4iG/mAxoH/9xtNk4t1sIOgRHw4H3DvE2kQqhrreaRJkg+aSdbcWtRc5g3yvmgtigm4NH1t1xdg
	QFVS3W0dCiRIMzU+2y49sdcaA=
X-Received: by 2002:a05:600c:4f0c:b0:485:358b:e80c with SMTP id 5b1f17b1804b1-486f4208becmr91624835e9.0.1773870089547;
        Wed, 18 Mar 2026 14:41:29 -0700 (PDT)
Received: from potato ([31.176.171.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c5318dsm17698845e9.14.2026.03.18.14.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 14:41:28 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] rtl8723bs: replace _SUCCESS/_FAIL with standard errno
Date: Wed, 18 Mar 2026 22:41:03 +0100
Message-ID: <20260318214104.16971-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace non-standard return values with descriptive
linux kernel error codes in probe path.
Also replace the variable name 'status' with 'ret'
to be more consistent with other kernel code

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..ff0ebcb59c68 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -345,38 +345,46 @@ static int rtw_drv_init(
 	struct sdio_func *func,
 	const struct sdio_device_id *id)
 {
-	int status = _FAIL;
+	int ret;
 	struct adapter *if1 = NULL;
 	struct dvobj_priv *dvobj;

 	dvobj = sdio_dvobj_init(func);
-	if (!dvobj)
+	if (!dvobj) {
+		ret = -ENOMEM;
 		goto exit;
+	}

 	if1 = rtw_sdio_if1_init(dvobj, id);
-	if (!if1)
+	if (!if1) {
+		ret = -ENOMEM;
 		goto free_dvobj;
+	}

 	/* dev_alloc_name && register_netdev */
-	status = rtw_drv_register_netdev(if1);
-	if (status != _SUCCESS)
+	ret = rtw_drv_register_netdev(if1);
+	if (ret) {
+		ret = -EIO;
 		goto free_if1;
+	}

-	status = sdio_alloc_irq(dvobj);
-	if (status != _SUCCESS)
+	ret = sdio_alloc_irq(dvobj);
+	if (ret) {
+		ret = -EIO;
 		goto free_if1;
+	}

-	status = _SUCCESS;
+	ret = _SUCCESS;

 free_if1:
-	if (status != _SUCCESS && if1)
+	if (ret != _SUCCESS && if1)
 		rtw_sdio_if1_deinit(if1);

 free_dvobj:
-	if (status != _SUCCESS)
+	if (ret != _SUCCESS)
 		sdio_dvobj_deinit(func);
 exit:
-	return status == _SUCCESS ? 0 : -ENODEV;
+	return ret;
 }

 static void rtw_dev_remove(struct sdio_func *func)
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 +++++++++++++-------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..ff0ebcb59c68 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -345,38 +345,46 @@ static int rtw_drv_init(
 	struct sdio_func *func,
 	const struct sdio_device_id *id)
 {
-	int status = _FAIL;
+	int ret;
 	struct adapter *if1 = NULL;
 	struct dvobj_priv *dvobj;
 
 	dvobj = sdio_dvobj_init(func);
-	if (!dvobj)
+	if (!dvobj) {
+		ret = -ENOMEM;
 		goto exit;
+	}
 
 	if1 = rtw_sdio_if1_init(dvobj, id);
-	if (!if1)
+	if (!if1) {
+		ret = -ENOMEM;
 		goto free_dvobj;
+	}
 
 	/* dev_alloc_name && register_netdev */
-	status = rtw_drv_register_netdev(if1);
-	if (status != _SUCCESS)
+	ret = rtw_drv_register_netdev(if1);
+	if (ret) {
+		ret = -EIO;
 		goto free_if1;
+	}
 
-	status = sdio_alloc_irq(dvobj);
-	if (status != _SUCCESS)
+	ret = sdio_alloc_irq(dvobj);
+	if (ret) {
+		ret = -EIO;
 		goto free_if1;
+	}
 
-	status = _SUCCESS;
+	ret = _SUCCESS;
 
 free_if1:
-	if (status != _SUCCESS && if1)
+	if (ret != _SUCCESS && if1)
 		rtw_sdio_if1_deinit(if1);
 
 free_dvobj:
-	if (status != _SUCCESS)
+	if (ret != _SUCCESS)
 		sdio_dvobj_deinit(func);
 exit:
-	return status == _SUCCESS ? 0 : -ENODEV;
+	return ret;
 }
 
 static void rtw_dev_remove(struct sdio_func *func)
-- 
2.51.0

