Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53155313537
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774124298; cv=none; b=MDYvkW4c09Jkw3T6BP3KbiXF1mNLcV8lgO5rRKKhn6Jco5iTjB5L2jf7Rn5OVZJFgk28YctKM3W4rq6KT0Qq9y5IErVYlhRTYvpApsZ4XEWids+oF7hWWeAqCdeqtiy1fHuDpJJQuXyF78cii5YeUgVMOWFgZfS0+uwRuD+JtH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774124298; c=relaxed/simple;
	bh=21wxwPAzkvw0PM1o1Sir2WjfHA/JhjHvcpA0K/jNURE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSHme612v1MEsukyumYbxUJxTKuILYHmuV3j8Q8z8RS6FyKJG3YM7M+EnQdIIG/DSnenvqUzD9vmFST/i63Ig9qsgCp+xFodjKeduatMblC9GAl9Y8n2KBkCbZuys1nIz1yf9J2PsgtPvTZOKyiuKfyhNw/TKeIOmuRv+xK3QTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEnJ94rO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEnJ94rO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c6fc2910so2128628f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774124294; x=1774729094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzhecMnJJ9tJrL0eFF0dOc/Rvq2owA/QQje9TjQeQrM=;
        b=ZEnJ94rOHPl7kilJomnThFV5TgJqHr3FddQJX/jdeCHzZ4V/VblQW1bUMb6YEnNeTq
         sD5Fc4jGSXcWOtNKr/BMovm7sCruldQe7r8AodoCdRgpgP5jBdbnaE44tuU2IqUPGRqU
         GJbGsoWzNmUfMsbTFFCujHBbaj0KKiCnUNyEka44kbjeKfGlXWVVwpxlE5Ae7awN5clD
         DKLCYOyVwnuCrR45xx6LynYow17s9DZcjppdmN2Wq4NKKBKz24RoObfRKaJAZmPOvvNB
         VVUyfzp8D0Bn+cAa0jNxm0x8vBlYuKTwpszCd9ltBnK5kJYc/3uVIiejmcF35HkfxMph
         9sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774124294; x=1774729094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AzhecMnJJ9tJrL0eFF0dOc/Rvq2owA/QQje9TjQeQrM=;
        b=HyP6zajOFcOrtOsYFyvWgx7bzlngSWnQ+ZfrWzIygq26l0l70Y3049OpXsQR06u3vb
         FGD8vEUHhpNXq1WqbfzLgURJ773IfDVyTelPRVGRE4FC79aAqYqUDKSoEbYwJzBgFLXw
         4of3LUVpZntBIFDR1y/MY0QVXf3IiHzloM+Titd0rS7sEzWz7wpZUnwTUsESXocETUz0
         MpAn8iIMvQNpjtWUzDHXV0ykA59g49jwEIrQSi5CvYyJxduaTu+i5n8SrCrirFCI/yND
         2PtPdvQ5OSUWI5ZPcGtBJReXBVezTDmm66vmWFHFVxi0/VDX0JquPWABZjIvAILnwkTT
         ANJQ==
X-Gm-Message-State: AOJu0Yyf/CbunHRiMNJ149iIeJdMHRDitToVSsQh8QdfxfyPjzRxbkPx
	b00lHWURkD/CfUpqYfOYSrAm7QxKqEiDR2JnF1M6EYcodr/k5q9QLzVR
X-Gm-Gg: ATEYQzzH5qz6+QS7gpfC0n6RWF0nBp3fPbr/TZoC0gfosX4hRAl26aw34kHmYU+6xxv
	i8opPwP0Jj0PAc/43MMA6pRI7ylWWDZX0E4LH3tCVeJTOpf2wvagW7bczRM8swixcwwLOTfpr7y
	QVnz+IDVrYfdw+MaeLatD8afpwYw2EFdTQqsEjxcN+UsTxIqGpok42zsnpUDtHWFlBjB1/jOAow
	xi8Z5mceKURriul9TNS67+exVL5U/D8z6Zfpve+UeiaRpv3ji/F4r52jaezBmq40cKBEbOQk6gn
	KLukpPvq7UoFRFUHHQ4cgPl6CLGX4Ol4nPvzqRaeNOkzO7EILxSJ31OZx5d55sWiJXKqEWajyV4
	FBylX8wDaHBoH5iL+IKBmuBPL1qG6Sto/q8uIvqoYThDM0CqrQneaStTyG4tygvAnLfRyaxIvLy
	lhX7TFK50R6WiiFfoTfOv99ZHpt/34HMP/FA==
X-Received: by 2002:a5d:5f87:0:b0:43b:4f86:e996 with SMTP id ffacd0b85a97d-43b6427ea9bmr11643009f8f.29.1774124293520;
        Sat, 21 Mar 2026 13:18:13 -0700 (PDT)
Received: from potato ([31.176.191.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470380asm15876340f8f.24.2026.03.21.13.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 13:18:13 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: change error handling to use standard errno
Date: Sat, 21 Mar 2026 21:17:38 +0100
Message-ID: <20260321201738.16278-1-omer.e.idrissi@gmail.com>
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

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>

---
v2:
- Return -ENODEV instead of -ENOMEM when sdio_dvobj_init fails

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 ++++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..47189c849b05 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -345,38 +345,44 @@ static int rtw_drv_init(
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
-
-	status = _SUCCESS;
+	}
 
 free_if1:
-	if (status != _SUCCESS && if1)
+	if (ret && if1)
 		rtw_sdio_if1_deinit(if1);
 
 free_dvobj:
-	if (status != _SUCCESS)
+	if (ret)
 		sdio_dvobj_deinit(func);
 exit:
-	return status == _SUCCESS ? 0 : -ENODEV;
+	return ret;
 }
 
 static void rtw_dev_remove(struct sdio_func *func)
-- 
2.51.0

