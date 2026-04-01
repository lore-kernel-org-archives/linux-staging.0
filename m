Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D23DCDA2
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062968; cv=none; b=VVrUW8KAscsWS5S/7qOhX2jnTfWKK2ycAvt+iI07OGjU3TgCVTEYfnRBFTbtUuJk/Dx5ntInJqBmRb6R9qXCEdtg3xkluFoLvbB/otr96PkxrGigDcoo4BzwvrAYrZHB/HkdOXh6NRBqtcOgUo2UcW4ruUMnYV4sMPu3W+t9/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062968; c=relaxed/simple;
	bh=HBzz5tCb4AUIUFviOE8eRLefp4KWy0BmJ2F/IOn50kM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d1x9gJ1j2EeyM7wdB47l7vajVRQZBXR9IoywJZOSvgA6r4uDX9oe2LT7n4Xbs9mnrq6vIm/x84eGaMPcg837F3bcAYgWGPU6eL4V5WHy7RMhW5Jh45+xAla4LzZIFAMZi42pGM4UCDLqONzhHXTUfHrX/2ZannhrxzLA2TP2GKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDBE2lbr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDBE2lbr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so9018345ad.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062965; x=1775667765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBxoBABnFgARb0xnCBOsok+3wHCtlybCDJIvzC32HEk=;
        b=pDBE2lbrexmn00KVcmJqT05KeM5lyLV4dtMYuLpZjZhez84Y/53YcjHExMtDomuEvw
         SuoDAGfWKIIbsVJLmuLpHgfeKnFHzSgbxRv5hI4iFXKCnUMAkAJNjxmW7JYF3+XAdTBK
         Xc1pWn1uFKLioEU7C5Wx6pzzpkRo6n1OV+UUja3ioUqXzntsTjpGqoEVzDfkLCH6KrtS
         B4xrVlq4vJt9yYZ+rPf7YEcbXKRMo359CguiKLu/nITExeNyQPTxPTGiAEclRkBG/ekt
         saBz2v+4Ue9rtpJ7Hw0IuoDCA32jHB4I75veDtjMXYo5syN1Ilpc2y6MnFP3vDUmugh4
         h1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062965; x=1775667765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBxoBABnFgARb0xnCBOsok+3wHCtlybCDJIvzC32HEk=;
        b=hkvD/qZUP2Pr/x6FxuAmF5U38c7CwULCq12MvaGq5D7ipVSa/wsVwSxcsx5PM6B0Qd
         c1iS1dDfVdFLkjVbmGmFncIv5jV5dcNRGrwzVJ9FYvjNyBb7fC7xbUCISj6drjsIRnt8
         AVpwO0c/VJ6bMVKKCqCIILvvTn88AkmnsJiTfPi8WjlfM/VNWMJLyxQmxxN+U35F78ZK
         b3bQM9yEDXqn9db4EqlroM/0o26QI7Y9/wWMgcjvzuWO5yZGgOPVHiJTZSLBB+bJL+x9
         eSpulh9ptOfr4jpDZtS1PkSO7eInMpsKLsJGG1aZYy0Y1KL3uvW2Y/sVJTsbV3kwBTne
         LeDA==
X-Forwarded-Encrypted: i=1; AJvYcCV7orv998O8xhMzhbA1J3qdppQFwURfKLyJ69tn2Ei9Xi1MBVyct3PKPW6whGDfb6Il1oWOl5Wbd84GeAzD@lists.linux.dev
X-Gm-Message-State: AOJu0YzEDaveCmMOHq/AJxPlBeRfOFQknhjro75bKWEImrlNiDICIJOb
	RnwC4N3olrL+/zEagTFP+T44/Oxos5vgZ9KDsleH2nJ1TxwiOPfwkMpQwE/iHS8O
X-Gm-Gg: ATEYQzzEjulcutZ9VOkqtDx3ECnZlcGufAYP0iXgrJaJd2+lHzoHE9JlXbJWI809855
	hb+YmLOuA0V5PKDD/FrnTYBZvRIYwD5rVdqGUbXAQ3C3RYJ8aQ8Wey5c/SOPLfOTt9MhlfEWXb4
	vu2ZDPCVGzAf6HzRoggdd531qoBmL/q7hUDpEXT6u/aoJAtxD5tB4kEsKrddb1wdYNrsWBZ+8xK
	kUCYqD3U29xYsblT3P3aENAkoij+gcsaAf1czFYQKLy9XXRZSc9Zy6GfFH/8m/NSDDv9E8IEXcH
	QKex0yMEUg7OiAebQKVxc4gPaXX7SsgI5UJ3gU1WPWYcaHZH/gyCg1hpbHGyzW7FkDs+/J9HiX3
	SnMf1Sk0wRZbKiz+/02fN4nrD7/xg5pWbcBxQN9LjXc0V85jCfcWZSwunyNghDgYPmExjnPaPOU
	v3hKjXLGuiWWuRaY7UJkyG2OWkhZOG+jGVYfADLgdtMV8=
X-Received: by 2002:a17:903:32c2:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2b25ed654ecmr85278575ad.0.1775062965153;
        Wed, 01 Apr 2026 10:02:45 -0700 (PDT)
Received: from hosnbs8526786.. ([27.7.150.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478d329sm2965875ad.34.2026.04.01.10.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:02:44 -0700 (PDT)
From: Sairam Bandikanti <sairambandikanti@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sairam Bandikanti <sairambandikanti@gmail.com>,
	Claude <noreply@anthropic.com>
Subject: [PATCH] staging: atomisp: fix memory leak in sh_css_load_firmware on error path
Date: Wed,  1 Apr 2026 22:32:18 +0530
Message-Id: <20260401170218.40504-1-sairambandikanti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sh_css_load_firmware() allocates sh_css_blob_info and fw_minibuffer but
all error paths inside the firmware parsing loop use bare 'return'
statements, leaking both allocations. Additionally, when the
fw_minibuffer allocation itself fails, sh_css_blob_info is leaked.

Replace all bare returns with goto to a common err_alloc cleanup label
that frees both allocations before returning.

Signed-off-by: Sairam Bandikanti <sairambandikanti@gmail.com>
Assisted-by: Claude <noreply@anthropic.com>
---
 .../media/atomisp/pci/sh_css_firmware.c       | 62 +++++++++++++------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf55..dec79d0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -263,8 +263,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	}
 
 	fw_minibuffer = kzalloc_objs(struct fw_param, sh_css_num_binaries);
-	if (!fw_minibuffer)
-		return -ENOMEM;
+	if (!fw_minibuffer) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
 
 	for (i = 0; i < sh_css_num_binaries; i++) {
 		struct ia_css_fw_info *bi = &binaries[i];
@@ -278,18 +280,23 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 
 		err = sh_css_load_blob_info(fw_data, bi, &bd, i);
 
-		if (err)
-			return -EINVAL;
+		if (err) {
+			ret = -EINVAL;
+			goto err_alloc;
+		}
 
-		if (bi->blob.offset + bi->blob.size > fw_size)
-			return -EINVAL;
+		if (bi->blob.offset + bi->blob.size > fw_size) {
+			ret = -EINVAL;
+			goto err_alloc;
+		}
 
 		switch (bd.header.type) {
 		case ia_css_isp_firmware:
 			if (bd.header.info.isp.type > IA_CSS_ACC_STANDALONE) {
 				dev_err(dev, "binary #%2d: invalid SP type\n",
 					i);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto err_alloc;
 			}
 
 			dev_dbg(dev,
@@ -313,17 +320,22 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 				dev_err(dev,
 					"binary #%2d: invalid firmware type\n",
 					i);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto err_alloc;
 			}
 			break;
 		}
 
 		if (bi->type == ia_css_sp_firmware) {
-			if (i != SP_FIRMWARE)
-				return -EINVAL;
+			if (i != SP_FIRMWARE) {
+				ret = -EINVAL;
+				goto err_alloc;
+			}
 			err = setup_binary(bi, fw_data, &sh_css_sp_fw, i);
-			if (err)
-				return err;
+			if (err) {
+				ret = err;
+				goto err_alloc;
+			}
 
 		} else {
 			/*
@@ -331,18 +343,32 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 			 * (including bootloaders) (i>NUM_OF_SPS)
 			 * are ISP firmware
 			 */
-			if (i < NUM_OF_SPS)
-				return -EINVAL;
+			if (i < NUM_OF_SPS) {
+				ret = -EINVAL;
+				goto err_alloc;
+			}
 
-			if (bi->type != ia_css_isp_firmware)
-				return -EINVAL;
-			if (!sh_css_blob_info) /* cannot happen but KW does not see this */
-				return -EINVAL;
+			if (bi->type != ia_css_isp_firmware) {
+				ret = -EINVAL;
+				goto err_alloc;
+			}
+			if (!sh_css_blob_info) {
+				/* cannot happen but KW does not see this */
+				ret = -EINVAL;
+				goto err_alloc;
+			}
 			sh_css_blob_info[i - NUM_OF_SPS] = bd;
 		}
 	}
 
 	return 0;
+
+err_alloc:
+	kfree(fw_minibuffer);
+	fw_minibuffer = NULL;
+	kfree(sh_css_blob_info);
+	sh_css_blob_info = NULL;
+	return ret;
 }
 
 void sh_css_unload_firmware(void)
-- 
2.34.1

