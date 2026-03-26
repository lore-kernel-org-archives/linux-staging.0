Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E15381B0A
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513001; cv=none; b=uJgFKcbcnuUzb1cH+mYqSkBi57sL0l8eqXvZNzAS+VstiDsP62+Xw1wctYfqV+00GE17Ej+lgMEEMmcqzlghI9YGycv57fWe9GwObYED8QdqFASVVQyfWEb0sHKYEUiWMMzowsHZI72y8KcVmDk/EHP+4GAeF4pVMQtZ4Jr67iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513001; c=relaxed/simple;
	bh=yMyzaFoknNuQ6pVvN+fu/ld64KkXbgcWoC8dH9PpS/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBx6jjlGO+cEQ69kJ8jhyXOnBVE7GILOMUo8VokMA9EbYR9VImAjF/8T925FDGcH7L/ra1bTRk2T7bIFTFPoDbcW1iAyj68Pl/kUSs3x707WYLxlfBAYDK7h+XphmlISlN2eIEGhKt8GvROMt0W7cFuLKCgSsyxOul0h3ycKO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sugF/q65; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sugF/q65"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so5467255e9.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512998; x=1775117798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=sugF/q65HKwPFa/6n72NLSoj3aArcw9SQlml+ye9MJ50trP7c5TP6UrVbJ8otjTTGy
         elDUNEiflqDJYi3qgj6wWyjjKw9Y0KEmZMxYRfeXkhprMVOkOGte1SCK1xYPEcZ43DqD
         zNE8CuX2AF59snLFB7bnBamYOWSvVFeSikPitZDb7lWKxvo3Ff5IbBlU4pjx+q4SmIlI
         lpz8pkwN28Talm7ORVKItkXBzKFV0fay+JlgpA1RBQKwfLSK+mSW3MT4Nkx1HZtEtABb
         0jfQigy0/WdRdtZB6hAAonSJoyKp9QwtMdGV2+axSBi0RU7spuv9O0QaVN95AetJu8YM
         /5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512998; x=1775117798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=LmbA0/E/rDg2wJ/NPtIV5GxbV745bI2btcdSRhOWbF6OOYsT1N75dwoKZRfW7WrUbq
         0bjwlGoSBQeM3HXCijcIOCx77CbrxW9HrO2xCN/TdCRUXoQRlKn0AHga7Dr/MOBFpApN
         9GH+m55I3ahg/wA4vsPuMXFwCZz7FyPxu2CrcUMZpVLmZIvkIBIP8Q4vYBirSZx0KGZc
         tvex6c2lDUXqvO+BTSADE6O+tqYg4iZ8sDUG0C6WXGfAJPfGHAZSgF9PqMBZG97wHAje
         oWPlhRQPgC8WpcqSDybHr9sYrD6XL1mKTi8b26WKdf5/sFlqlBO/KCbIVhDMo+2W6T+M
         uTUA==
X-Gm-Message-State: AOJu0Ywq1iy+k8bjRJYik8BvuYMYuiENJBvPqBjo+/GvO1GmMkqu8jlz
	vmN5IFzwsDTJRdsr9FS4Yf67iRr1UGImSVewzNZ+79WOTbCna5TxQKdiYQeglbBQ
X-Gm-Gg: ATEYQzyHG/eBtXN6Jjtjo5/RcYrsW9FpAhiw/VB2Im8X6Y36A9XGpQLBMrpMZokkIqz
	WWc0NVxaAYQZRPhY/te/tIcFkYwFMh8hKy8sEcXogURnaHQHRCWJDzNCpI71fCDFRe8zbBYPEAl
	kxXVBciDYvX4kxw/GxVV6D01TZjB4G8G3P2M718YBgefs7EkV66qJtEVtm5vtfskEwBcxIhtJap
	gaHS5Vo4K//jytWmrEHUAlkj6C1KAldz3ANOPvG/WM9befBodv83uNSHsiA9TTXpFkPZVhTB1gw
	t5pbrGcTNxNw2BGBEFe4+qRxQGP+DoUG9DZnpqVbTQReQJBjOghIF9/RcS+DjiwmMq22XLQi041
	JEAzGXB6f9nPI0gsN4+GGbuhtP3si7mX4c8oLwj90meuzDAanoyJwtTDcAFgVOf1h0hxCvOMKWJ
	kbKEujWMcfkk6DpciJ/fdAPJo=
X-Received: by 2002:a05:600c:34ca:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-48715f0369fmr97165755e9.0.1774512997950;
        Thu, 26 Mar 2026 01:16:37 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm32886045e9.2.2026.03.26.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:16:37 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 1/4] staging: rtl8723bs: use direct returns in sdio_dvobj_init()
Date: Thu, 26 Mar 2026 09:16:23 +0100
Message-ID: <20260326081627.5841-2-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081627.5841-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com>
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

