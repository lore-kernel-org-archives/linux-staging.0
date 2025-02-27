Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4D138DF9;
	Thu, 27 Feb 2025 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642370; cv=none; b=lI8ed9ApvqEdgKNytAVdEpDB4z98O5hx1S1fFpu046z+nhTF2E5as3vF/tV8Weyf0+iEWkmezcgSvgT8FICCVegnqt8Q9w3bkqsOnKeCeve51xMN7W7thn0gkcJYfkc9gexE+i/jFgyl3CB8uqusgyQAydGgAXWiDV9ZYQ0p0Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642370; c=relaxed/simple;
	bh=jJwqgKWR5JOY+McBAKuUmoyfRIE0w/3F/QEWmYkYatA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c8gwddPePP/j0/leLl5B2iFSNYnP12r0aW4MU2PQxW8rHMKzlb1GoA3dHGcx0QiWkk4rSQBmvWMkDFr4DHX60j4pbsk5DMgYAKiMe1g0zyHiSa6VA8g2TshoZ8SGcGqPgFo8TYGDlTgFe6xlYWvVhHSCNsw7zCGP/KJFutiaSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Pdw9TsGx; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Pdw9TsGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1r95T
	CcHEiHpvMqFCEcTBmSykQv+FZGWvggAUclAA/A=; b=Pdw9TsGxqEIb8P1Njcyt2
	65sRf1XYHRd/Y87FZJJVFM9B4S1n7jBzIVrgtfyMiwaao9AucI5GaqA2BCTeXhDb
	Yd2ifvgOtUDxN86mHg4aNwTGJc/2Xgvj2+/YzKg8T8f5oy6tsbENpHM4/8BWwLsa
	oHjEHQsO9B5l7chEHKG388=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBnKk_0F8Bnz+IEPA--.57589S4;
	Thu, 27 Feb 2025 15:44:54 +0800 (CST)
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
	stable@vger.kernel.org
Subject: [PATCH v2] media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
Date: Thu, 27 Feb 2025 15:44:51 +0800
Message-Id: <20250227074451.3698971-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnKk_0F8Bnz+IEPA--.57589S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxtFWfKr15GFy5JFyxKrg_yoWDtwc_CF
	4FgryxZrWUC3ySy3W5tF10v34Sqrs7urWFq3Z0va95XFWjy3WYvr4qvws3X34jgryF9F9I
	yr1rJr1akry2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtnYw7UUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0g0BbmfAEbmqBQAAsQ

Add video_device_release() in label 'err_m2m' to release the memory
allocated by video_device_alloc() and prevent potential memory leaks.
Remove the reduntant code in label 'err_m2m'.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
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

