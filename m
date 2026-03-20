Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F6A35F614
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773991813; cv=none; b=EOiizZUHJjEQKyzUDpwRg5nVa4DGIp+y9KBHjnoHKHvlbNwk6Ug0mwVHf20HzC8Ich0CHYz6wynU7P/OII/JiE1VNndJrSYdidc3tSEdrQfDs+tUp5SoxGDgGwUi7UI3pZUfEuRNrnVWj4c2EX6JJKx01melEU7KwANj8XRDz8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773991813; c=relaxed/simple;
	bh=2s+3JUKVwXs//qhUZDX+kepxYgNIL2IFkq8qjI+6j0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cU94shyXPHAnSej8kU92hnEjKpe7SJx5bEGVdBjCu0g6INr8uWoZyKirXJaTHQRPyNUzqBWUGI+wiA1jbECsZLPweWJT4kc8QTl8o2Dcy0CyZ64utYH+G/p+slTxdxPbYEJ45xx09C9/HI8cjudJh6zkStgxTEacZd4R/01vKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvmninlY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvmninlY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so2479025e9.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773991810; x=1774596610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W45HpX5niuHro12lOKLPgOnlXJW5x1S152G0+z7gMOg=;
        b=PvmninlYa6BwtFM0amOQvu8NN5kth1syVZJII7iHJSpDiB+rRPTdO+i13Ncuz08P4m
         S5DgAif4XcEVwumgHeFJKBxADN8jiI4lc3ZciyrRowCIcbqcy5f+uY+5ph4VvT7i8PN4
         lfr+kDI+GTxZ0ICdosnRDUgUeg4tc+zcWOdzzIPYKZuEbGxWvu6KwG3Uv0HVihe/JMxu
         xgGoPWeKR03iz55NcEGwb++oYazhgHwKmkAkNJZZjFa2NRx1nPvKG1Lfdnt723DNXR88
         gwM6e0dByER0shFPKXgKw7SU1Z6yP8uULK5SoEe7JwbX4Imb5swJ0EsKii0i68v7yj4Q
         WxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991810; x=1774596610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W45HpX5niuHro12lOKLPgOnlXJW5x1S152G0+z7gMOg=;
        b=lV4yQBpfZSZr6JwHI0VWbE1mepK6TIguu58RI0IRsQqSVZg9SYLpOgCYVPSqAPGOnZ
         JydkNIfe/dtE0UGKowU/2v8U5oKSM1TGg+22ssOqj0+AUiQC8J23dVA2nqeblHnIeXWo
         dkETY0GvpUP0yyOPmWVwae1ZY3YpsZ0rxUNDFHRLsd39Ui6pMOCBDm9DCdtG6UEyUeLf
         RwueHq/xfjOFWbV7VDEH6bDHVcmZsNPbn5xTmbQfAE0QiCBqc1eke7I/h0Nr8RfSIHcg
         h/95GFC2zi1vwv6q07/0WDtIzpvRCvc8eTr1432YBHh7gPlkIs4g7IM8d2NXrEUX2Hi3
         M63Q==
X-Gm-Message-State: AOJu0YzPFWdqda9uy1jzUdb7qJJQcORrP8rp8SIJ3OlljcsdCqtF60Nk
	QjEF3/6oD/Sd5tJOAMaOuJw5YuatRZ9V9bZJjJdTRQREzh6mnXFw59WJ
X-Gm-Gg: ATEYQzyEBgDXu9y1clLKUaSzg4+8AArzcU3AJhj/3wiGR0EQJw8ONqk2t9qXZrhmBag
	XfImRGjp8U1nn0IaXlzWbQ0es+ksK71M4mjaYKByAumCvp2VM1E3cMcFIsqaB3dp9l8+4Lc5AWx
	SH9TQuOztjn+UYFrbietAUjzy395s4R2btub9wx40qWiSmIUhuykA/41pXYkikJEaA4y9qntNsz
	OFdWVwPDvFDKdmJUub0KECFyNPKRiZABb6C51v8PVBzP5WLzgmELxiW6fIgHuEmcvrefWdhkUzM
	oEwL3gnfzwi0bMMNQdMmF3v5CGNsooW1VzBPCQf89TdibpsS2/cy/JbXaJxnsKNagOQcoT/f7TF
	ZMW+yiEpGASkW4H8aSFCOY4pU9gzYzQGPD6Qgdr57YpngOEWHin9SBG/0QHWWBlY6SzHJkyUren
	WBUjJWj0ru7PuExH7R+5c3iGYXzRH5pirEog==
X-Received: by 2002:a05:600c:c167:b0:486:fc94:d8f2 with SMTP id 5b1f17b1804b1-486fedbc066mr28798995e9.14.1773991810423;
        Fri, 20 Mar 2026 00:30:10 -0700 (PDT)
Received: from potato ([31.176.170.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe89e2b5sm11875105e9.13.2026.03.20.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:30:10 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] [PATCH] staging: rtl8723bs: change error handling to use standard errno
Date: Fri, 20 Mar 2026 08:29:50 +0100
Message-ID: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
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

