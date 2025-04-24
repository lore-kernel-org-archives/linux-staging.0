Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E737D19A2A3;
	Thu, 24 Apr 2025 03:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745464331; cv=none; b=lMcDs34WoQ/HrVXjQmLsgtC2dnY0FpjjtU1nS7fci+9p95loCpENKWVnkMiR5Qn6ouwI1fGu/IrWjB9LbpePjrIFF1Z04CVYkkgP6svCP8RIl1qkNwC4iv4z9NC3Icw2g6G6NF1zmJGXQTzDNoFSvNNojNaBx8Ruy9+F6pWquIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745464331; c=relaxed/simple;
	bh=KxI7ZwwdRe9K0y2ib/3b0x21CNzXlTubOfKD4w810Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qOf680oF/78P5ZxwwPHOkmJlExdzPFDn+fZgoM0IzEe5F7+sndK2L7SPWmwOorerd4HnxR9pXYAsGEmJ0HwPjR8j8w8DDSzqVY0vajQEg0DypYhg4MiA8AmvksDxcit0q9fISQUdshkWu1vHbpWe1z7rOn0zOwCZp4hgEkjrAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ctgxr0x1; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ctgxr0x1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=A09Ml
	t/Mb26VyS9VXRXqUFoJt2UqYjVyFJddK4O2fxQ=; b=ctgxr0x1JThALzXsRdeaN
	7pkAerYCeHPIosPVi8PI4o1TwF42xWo2lXhxOLesmiq7GY365TGJYlLDWy5ZIA68
	8KDOXv5lQ/4LT7TrFlYuDlFV17VV4CglWrpitQSy4HPeQ/YsC2mvTINGJFffXdaA
	J3OQV8R32qvzPBUGwoYJ7M=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnTxrBqwloZo4dCA--.57924S4;
	Thu, 24 Apr 2025 11:10:58 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 RESEND] media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
Date: Thu, 24 Apr 2025 11:10:53 +0800
Message-Id: <20250424031053.3508137-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnTxrBqwloZo4dCA--.57924S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxtFWfKr15GFy5JFyxKrg_yoWkWwc_CF
	4FqryxXrWUC3ySy3W5tF1I934Sqrs29rWFq3Z0vFZ5XFWjy3WYvr4qvws3X34jgryS9F9I
	yr18Jr1akr12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtCJPDUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0gA5bmgJqTxwAgAAsD

Add video_device_release() in label 'err_m2m' to release the memory
allocated by video_device_alloc() and prevent potential memory leaks.
Remove the reduntant code in label 'err_m2m'.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes in v2:
- Remove the reduntant code. Thanks, Dan!
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index e5e08c6f79f2..19fd31cb9bb0 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -912,7 +912,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
 	return &priv->vdev;
 
 err_m2m:
-	video_set_drvdata(vfd, NULL);
+	video_device_release(vfd);
 err_vfd:
 	kfree(priv);
 	return ERR_PTR(ret);
-- 
2.25.1

