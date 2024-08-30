Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0432C16E860
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725008110; cv=none; b=lvUqacqHcrWgYkeBWhqJlt+zTdtCjw8WJ0loy/7lbSWFixsBF+X4w1wsiQrnELM0m6uj81C8weFmO7P0MLArBfOKCegEWt05kBHF3dXRFZeXTmG8gKgzMVshV1gGmD3SOEBgKiqpWs/p5KLOIX5wIXaQI6Bwyla54XE4tqW/vTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725008110; c=relaxed/simple;
	bh=RdjVHbeZoFvx5m5iQYjzlxUKmcbjgkNut26IZi1V3qo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H4M4Fxm8cidmOvq67oBvQ5VQFyVrVtmQzzutaPoDhR0uu6JUQ2uAven3djNVclfhyzSCzjZek7K7k74IJASkCrOg5osCE8wHjsfjOk3FSwbgnq/58+SOg+ieZVZabhOkpb3xd8VbZdl0fDK7Qc+mbsJb8IHeXxWFWVdZHXOnbOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=doMCWboR; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="doMCWboR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Dvy8j
	7AoC1OlJ0wDtYazawXf4q28RiwSHT7u6spV7BQ=; b=doMCWboRorHDKdQoLP+VR
	STCjFf1TR2nLxgZCu1QPOpBFUnQzCEac3m+y9P0u/7TdmlAqsJt7SCrMcUr/NMpr
	htQ/6C7k1cuqWj42KerSBSBHTgcTV3lLT6SdZ7oEaz+FELXAm6eXkMXeWrnQLB/R
	P/JmVyOIIcE7X6nhwsPDVk=
Received: from iZbp1asjb3cy8ks0srf007Z.. (unknown [120.26.85.94])
	by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wDnjzHfiNFmI7vHKA--.63909S2;
	Fri, 30 Aug 2024 16:54:55 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] staging: fbtft: fb_ili9320: Fix 'Unnecessary parentheses around' issue
Date: Fri, 30 Aug 2024 16:54:38 +0800
Message-Id: <20240830085438.4299-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnjzHfiNFmI7vHKA--.63909S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4xtryrJw4rWF17CF1ftFb_yoWfXrg_Cr
	W0vF9xGrW0kryxtr4Fq3W5Xr92vFn7Xr40qrn2y39xZay5Za98GrZ7Z3WDJayUXa9rGryx
	Cry8Ga1DKF1UGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRZjjy5UUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRQBLamXAokl6QwAAsT

There is no need to add parentheses around 'devcode != 0x0000' and
'devcode != 0x9320'

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51548..409b54cc562e 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
 	devcode = read_devicecode(par);
 	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
 		      devcode);
-	if ((devcode != 0x0000) && (devcode != 0x9320))
+	if (devcode != 0x0000 && devcode != 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
 			devcode);
-- 
2.39.2

