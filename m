Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B599B3B7753
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513120; cv=none; b=q5muypx8HNj42XNF0/lvr4iPhFgAAS1Hud/ixI8m68SsZklf9eJP9J4IDLWhziXauMJFGKgFRQXvD9u3AZ1YpJvutp5YqusRUHhTZMVPuqYdyPV9V59Tw9wHXGBxOL1C+lLLxeMCJCALE/iNiI8JKJYB5VrqK4mcrm0v+iSTIyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513120; c=relaxed/simple;
	bh=yMyzaFoknNuQ6pVvN+fu/ld64KkXbgcWoC8dH9PpS/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/39ELFvZBevmfhvF+JvpQYcUFfpNLNT/XPzDzSGj8F5PLEF/z3j3JOe95+oWjZ/01UtA3FI4jZbnI4+JBIaKNusquYn5jvqbc+0b1+oEgMDPjIrlFOu2ns+7Lcp70qpKAkeSuFGSQ1t+eCRI7EApvxsS6RVLu69qMvCJJSqyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSl6SPYe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSl6SPYe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b98652f05so65417f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513117; x=1775117917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=QSl6SPYe1T2LnZBB9u3rLDgQNLsnPoFs4Yrx5AJgwlXgCJsrXXaS/C4A2zIiNw2dH5
         dYP0y1hgqkOS+I4D8raUV5zheIS2ehcMZgv+YcYl6frd3bRxXvMuibwEQCxbY1FX/sK6
         PiRvrNlBafCnDOmVyXRkQleRWr2hF3B5zt78tqOSJ9MH4F8Xcrn31Rj7M48cKgks3ECx
         eL693pwAKjX8uqCj7VU9qBoXG6qDToJvKCnJMLIvUDZ5MlwA0PxUgsdSqENOYpWttLMu
         eZgxxP4B4zdc/qAi/4XSTvCnClB3ADhVhzPPC7RXwPQxsumMBt0Moza7+65zCpTIG+Kn
         CBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513117; x=1775117917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=lzT54hiKTRStdA+rmZD22dbRUh1oqf0OfpN6ZvaT30rYz8RmJ9VMmcv7jrGf65XyW/
         S42liqZOzD3GNZnXJgKFMb7y1BcxO4TcWeaOPnBIf6Wn9hmKIidS4baRCUFsXlTsC7y5
         EOSNxAWkLmP6ZOHHeKZunWRrvdDQnyKe/LW+Grr5UUDIWkQ76MYSd/C9XAHSjXb5Vfqb
         1PrsqvxfGnddNxgSY1KbtUnigcF9xE3u7PcmAgxy4Vwbmw+CRsbl5WUXwmpKPhCpxHvV
         71wjeDQoXYQw8iTdmMaMmeMnP0wIjNIVKzL8QSwGucMVktrERrvMc6qfbvm4uFIx3O9O
         vlxQ==
X-Gm-Message-State: AOJu0Ywh8+lGyKhPTPkvOm9/xmDQ7iddf68aAA6jyn8NiZQyLtgjrZsU
	xrRN1nJDzSBXICM4IKyMwjYxibHyHPKyWNtWU8QCFBGBy4a9Fv4MIPcp
X-Gm-Gg: ATEYQzz91JQD7wtR/IA5Ev7BIzLzxS4hboqIyv5fT6Tq6OHxw/lM4daKVVbwsG7OKzq
	EFrh4cvSvUuk1k5CyeplyE15oUuSAXxYmoLbmnmEnU1yXGKRSHi9wDcLBMNfhBLxyz/HszIyjXG
	Azb0RCDVoaVvLLsAIM+pGj/33HX5lbQrMGuCT3yKmUxxrkZCGRdqu8k256i+aGELFeOQva7XYdn
	kGetKJmx+VElXhwqyp+63CZRuo0d1dKv6bY9YRczkcandRHH1dzd2V2ZJPfmrawCKTEq+tZvmsP
	RBjTNMQOkWJfKuIULAhJukdZhW0NCVcI/JBAHINVPfSSSRfW+x2HZ4opxkTP/GQxfuiJFnPqycb
	HmnIFsQYJ8r/iZAPgTU2rEq08HYMPqVIRJ+FmxVXDppV+Gif/Wrpt3w802FN8ISz/2OwWcQlADr
	RtSEqDwGrfvAfmVFrlCuA6hTA=
X-Received: by 2002:a05:6000:4010:b0:43b:50e2:1c9f with SMTP id ffacd0b85a97d-43b88a0d306mr10229176f8f.31.1774513117102;
        Thu, 26 Mar 2026 01:18:37 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm6130521f8f.17.2026.03.26.01.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:18:36 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 1/4] staging: rtl8723bs: use direct returns in sdio_dvobj_init()
Date: Thu, 26 Mar 2026 09:18:25 +0100
Message-ID: <20260326081828.6314-2-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081828.6314-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081828.6314-1-omer.e.idrissi@gmail.com>
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

