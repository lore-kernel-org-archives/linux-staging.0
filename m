Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A603840DFC6
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000120; cv=none; b=mm7bpHHiLtqffOhAkKMqKzQyHnaLJB4YAkNM0vxs5JDOmW7kij2uKEnd0I3PpiGZzZKFre1xDjdpR8bdOAcaRO2PKJ0ot6CcPExVpuxDpnN3swdUoUpZLrGlIKpQSaffYWId8jmVF2k4qV1aIv7T8HorKzyZCD+rKpC7UIaTEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000120; c=relaxed/simple;
	bh=rR4613r473/GpReOQF2c0gi0wcNrtyOYb4RtpDOv59Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFQMBjl31GDGRo1yBjMHARr6VJkiIWG5cNUAv51W827/ZgzzrOAWkI8kp7uZ9WLpTjX45lZHGIFRpBjpKEb9IJxsfHGidnUwGloAeuOhP0HTbc6NlZ4yX+yaardvr5V9O8DpuMuPamYEcuHwY/sKLu/S/B/9cl5DTSzqSW/ENdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rpp21kSk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rpp21kSk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so17003505e9.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774000117; x=1774604917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkCbhWRAULtVVKzFWTVsQsIFodMYtCVdUKkMxRtDx4o=;
        b=Rpp21kSkniOYCfbsUMQNhNObs23tIxa2DUVT4B9F/3EGEwXFHpR3dEZUDu68n9Gfdb
         DDriceLKlBNQ2Y2n1eGkImg/ZRgucgJ/4+7NuzYrPw+PcnmY6+9Mx16kTLcYIxb/XWBp
         CNhKdQ1QMobTUhXoPooXWFCWVHLoWVdli0vKt7LjHuD9AJmP6jBhyYsTg/T58dwmoLEB
         ZnpLUYoqy0P05KdDGto7tYxVlSHNb9wUmcl2wCqEcsUhFFgo4bCSd5eo7935s8DyUBGf
         DHNHiI8NHnCziHKiN7v1qTW9745MPGBN+JetvjESmLYIQVLK/y0fR1vyVb7mbig2BwMA
         3mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000117; x=1774604917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UkCbhWRAULtVVKzFWTVsQsIFodMYtCVdUKkMxRtDx4o=;
        b=saH7dylAif0WZB3n8xWrx2GBszSquMR9I+J1BXdALPAyqJl6bIfxzazbEFiVirSbo5
         1imbDSZewpKOPiQpafaybru362t9HDr7zM3+QsFE83eScDfvnpjYQsR75Ur7GgIvDlQO
         qN6TUDHzX6vcPt3JmGdraRN698Kfwxtj9Xqp3RAqnYyeBujkoNUek0GK8thk5zObHnm3
         OAXJzxwF2L1PJ6wMQ8WSsNCYR1BrbuaqHoMYk8ZN/V6tzPbQ/2vcTtFdxFAaAGG5Oixr
         dgHDDGfmeMTfr6Ln5DQ340vYkQ/lYErkkzrKhgmZMen6LwrW8LKgC0LOFCHM/cSKDrI6
         iYXA==
X-Gm-Message-State: AOJu0YyAm8bhway8ohOsHt8r1G5p5pXtuKPqZkQt2kF1xr6JfEpMffck
	Ya3kuktmzgybxNvsshkns9Zx741EzREOnPkq9CAZTGs/epFhgszx1yrQ0w+84sHh
X-Gm-Gg: ATEYQzzaIfXH5TgsRHvqzoERVZf8YToZvoZUhBXoBxZH7iTyVWc5mDcdmzK2bdrctlL
	G18j3gV2ARB8WvsrlsZc4wUcozEdabM8wOKn2yJLIWBzO2RI/dN7APljXoZLJbLEBIyq4J6pTZb
	Lpvp/kp8L4M4eWzxuhDBR5uY/2sxcRA/ZRYJ91De3+fsIDGpmJ7fEah1gOHl7Oa+q7gYVBKRaok
	t0C+48rJB9hVTy/zB0QIW9GKX8hNv+bSIvVSu/9l3EFarsMZ5BNFJ18SKmemP99j/jrlSpfPwMP
	7ug2oZ3KrH2jwb/0oz30Btql9DR31y6hAu2hZbCMwsIJ4iY9bKmzB11POl+E4Ubx8ppquHdB+Zz
	0GO6G3jDGB1u8ACuu96V3zJGpawlQxQB4KWogrbLsXA7UPp7xXrfs/9A472rapasN0psyCXwo7a
	SzMEEfB8NyuPZyOOikS6XI2Wg=
X-Received: by 2002:a05:600d:8401:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-486fee297bcmr26183805e9.28.1774000116583;
        Fri, 20 Mar 2026 02:48:36 -0700 (PDT)
Received: from potato ([31.176.170.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff118bb4sm19344325e9.2.2026.03.20.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:48:36 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: change error handling to use standard errno
Date: Fri, 20 Mar 2026 10:48:24 +0100
Message-ID: <20260320094824.66349-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
References: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace non-standard return values with descriptive linux kernel error
codes in probe path.
Also replace the variable name 'status' with 'ret' to be more
consistent with other kernel code.

Changes since v1:
-- Replace -ENOMEM with -ENODEV for sdio_dvobj_init fail path

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 +++++++++++++-------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..4c16c514ca39 100644
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
+		ret = -ENODEV;
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

