Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2441A3C73DE
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389904; cv=none; b=JfAyg+eyLU7Vt5oKrnTd3qQ41uHIAoUKbmdYke4ev5+8a1viI3gDYaIqIpese2NI/MLCAaXCLBaS5lTP9wglYAp5xJ137s3cAPMucc9xbCiyprKqA73sk3n9uF5QwOPwO1xO0An2DWN+T39+ZG/mOaRIL0Gdp/MbUh5cAFcdws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389904; c=relaxed/simple;
	bh=yMyzaFoknNuQ6pVvN+fu/ld64KkXbgcWoC8dH9PpS/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojGcIFDlrLQTZghXcaDhzVu+/ahu82LUc4PPxrvGO4/RlmWXiWtuUxERNXNeSfjQpbnTzEnC9nfm1W4ynNSg3nGPty4j+rjtcW0LMInDxt5pQDYuxymhkYvJ1ky+OmOSM3wveOYw5r35CC8u8hq7Vx0LEcvZ4lNOE3HP3v2chdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXnA8Syl; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXnA8Syl"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cfc1aced74so675441585a.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774389902; x=1774994702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=nXnA8SylSJxDgMz7w6UK8zg9mynLTBGfN9/mMernkhrTOkKOgk7Id75xAKFXF6Lb22
         mwjzC7PjoMOOsileag2wpw+RPw8FVXFYqbrva3aJqOLF17TuwamPmNESa2LdhcqOaLxq
         y7g+Js2vO7/eTlJSx6lKAau5v14cLzIWreImt0LLNmQcoL+lDoX/8eGjAoOwFOrKFbQl
         a9J6Dcs3N/AGX87X9bcFX9hdXCPkQPOfwIYOnuw0xosLXr2AgLwujmu0dMUVlCMT0Fu0
         IUIMUJ/hGAP6kXdjOzqpMw50JfkgdYxEzJRtvQs9gah6RtRRl5GGgAI3dgnk0DUYRH8c
         rYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389902; x=1774994702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=rIi2/OydVtpHzvs5OaQsUENAi/Np1R8x8jqyc6c0EWRoOd09Ysn1p0r1UFNO9MF8nh
         nvIaoIB+Q53OcavKN8AdcG6LPRm/A8H/pwHKVcUsApmXKRNTkNLJv29+rSxJfs9NX2um
         +LEJ7yPvsdFqHw4qPYCVnSRhkY9CTdp+RnBMQ0uO0UwNJ1EribLzuGeUNeqFixWw8t++
         Ow/GViO7Wr4K55+S0damUemdxv1A8G66yBF5ffA0lQ7PAxXoEs+wMq/wDQgFVLzeJsTb
         3DyQJyfXPUMh2+qgv+Sm4Jv0t33M/1a9StNVGS8XIMt/uI4yfPdL3C8D4Aw3XboH4Khq
         vaJw==
X-Gm-Message-State: AOJu0Yy+SExq25uhgVrBgCbwEaAE/BDwEqgc1NRm7d+aVLLHvnqQwFy5
	mFXpQevTxlogKxTtPmNXwFoldKrrnAqV9Cl+ssUjYC7WbCPOwmPziZuDLPdAehBC
X-Gm-Gg: ATEYQzxTjeMyxHcy5khoml/sf64XzU7zN6D1fsaC2BjbCwDt220VtBr/0SQG8uMJZ/t
	/CKzWIuj1odlof78mtUEMz21ZutCuXNKPJgsQ8xlzuBC+pxaUAdkkJh7CT/yt9Lm728ORarIdy8
	rJYdxbcsd+QTXyQ+0iQs4te1SamvpyBGCYGfQ9fERYt/JIguvWPi1/M2qIx2I+xvCYfpxmM9my2
	68Qg4CReYANyzRJzsoacnQ1EiZVbWVA2MPxT7cc84Zqqa8ICGjPQ64QzcppGlwrV6+imHkEZvvQ
	P4OY0DtXjv8TW/6a0qhYeqzYeLePlDgFfEGEKylaMMVlnhK1EVmzLYw8Ggfd0bxohe44R1TFuRS
	+/xT8alrDEnQ5Z2gwwGVxYPz9E8oU9g9L6Yr4rfw6oidlQMfoI5J33lAo4gNKS6x/B6GWHfLoac
	TP79A/4x3A0ieHiVGvyh2eR1CzrXs77/clsQ==
X-Received: by 2002:a05:620a:3726:b0:8cd:b315:6af6 with SMTP id af79cd13be357-8d000f22dbamr193350785a.8.1774389901876;
        Tue, 24 Mar 2026 15:05:01 -0700 (PDT)
Received: from potato ([31.176.161.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm127590976d6.39.2026.03.24.15.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:05:01 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: use direct returns in sdio_dvobj_init()
Date: Tue, 24 Mar 2026 23:04:52 +0100
Message-ID: <20260324220453.47406-2-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
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

