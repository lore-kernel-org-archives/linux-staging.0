Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC1D331A4C
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617723; cv=none; b=jo/+EauzN4jmLGPvRxLtCGRktM0NJMIX+ztGj5DYBHuPjJc5oxpsaeQdNmPUE9xsAw+xSlfwVgpZyjoldmYy91qMbZ+qpGAMpAOy+M13i+H6flWXe+VjASA00D6gkRpCZNRKNagMBQQl1VqfOqmIDgO/D8IkAHqCKO9+nPP041k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617723; c=relaxed/simple;
	bh=zp1isBpugkAt1SBW7d3ODtIwKD8AmXb4UFhEAvq8kb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z8v5VjgYJAJUvZM4vi11x3ulu2ED2kkCByx/Sw7GnnaQvrIy2ilsE2deOHXCmdt4n7paFG/GHVCYt11mG4hcfahBpq2Mx/BAxRrV2fKzYufR7dmGU3nBhPZO5saZzwXkZvANaQ3UMuis5MYidciZ6fJZaV/LT74QnQ3CfoaUiS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=XsGQk4jy; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="XsGQk4jy"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 429ab32a8;
	Tue, 16 Jun 2026 21:43:23 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	error27@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH v3 1/2] media: atomisp: fix memory leak in atomisp_pci_probe()
Date: Tue, 16 Jun 2026 21:43:18 +0800
Message-Id: <20260616134319.3969928-2-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
References: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed0ac252b03a2kunmea38caa144bc6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR9IVkpPS00eH0gdS0lLSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=XsGQk4jy95Za4VeHjaCYR5URzRAdNX8jbZKLjIk2bSO64pJnGD50Uz/kWwCOHcJ5aJwDPb0+SNPcg2428v/L/dMW3LqKZLNIuGa6xZm1tCN4kKdfFPo1LH3cL/hkxFQkXfrEhemvSSVZa0BYdqOWs2Dhyv+Ppa5myrpyL79gdTY=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ZpYu3eBRjjhXMuDJPDSLWq/Czlbv7mcfLTx4ejFc3X4=;
	h=date:mime-version:subject:message-id:from;

atomisp_initialize_modules() creates CSI2 and ISP subdev media entities
before atomisp_pci_probe() registers them. Its counterpart,
atomisp_uninitialize_modules(), only releases part of that module-owned
state and leaves some media entity cleanup to the entity unregister path.

That ownership split is incomplete for probe error paths. If
atomisp_pci_probe() fails after module initialization but before all
entities are registered, the unwind path cannot rely on unregister
helpers to release media entity state whose lifetime started in module
initialization. The CSI2 and ISP subdev media entities can therefore be
left allocated.

Refactor the cleanup boundary so module cleanup releases media entities
created by module initialization, while unregister helpers only undo
registered V4L2 and media device state. Move CSI2 and ISP subdev media
entity cleanup into atomisp_mipi_csi2_cleanup() and the new
atomisp_subdev_cleanup(), and run media_device_cleanup() after module
cleanup in the probe unwind and remove paths.

If atomisp_mipi_csi2_init() itself fails, it has already unwound its
partial setup, so return the error directly. Only the later
atomisp_subdev_init() failure path needs to clean up CSI2 from the
caller.

Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
Reported-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |  5 ++++-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  9 +++++++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 12 +++++-------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..2a85d04ade81 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -185,7 +185,6 @@ static int mipi_csi2_init_entities(struct atomisp_mipi_csi2_device *csi2,
 void
 atomisp_mipi_csi2_unregister_entities(struct atomisp_mipi_csi2_device *csi2)
 {
-	media_entity_cleanup(&csi2->subdev.entity);
 	v4l2_device_unregister_subdev(&csi2->subdev);
 }
 
@@ -331,6 +330,10 @@ void atomisp_csi2_configure(struct atomisp_sub_device *asd)
  */
 void atomisp_mipi_csi2_cleanup(struct atomisp_device *isp)
 {
+	unsigned int i;
+
+	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
+		media_entity_cleanup(&isp->csi2_port[i].subdev.entity);
 }
 
 int atomisp_mipi_csi2_init(struct atomisp_device *isp)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..11d7e04d3ec5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -886,11 +886,16 @@ void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd)
 
 void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd)
 {
-	atomisp_subdev_cleanup_entities(asd);
 	v4l2_device_unregister_subdev(&asd->subdev);
 	atomisp_video_unregister(&asd->video_out);
 }
 
+void atomisp_subdev_cleanup(struct atomisp_device *isp)
+{
+	atomisp_subdev_cleanup_entities(&isp->asd);
+	media_entity_cleanup(&isp->asd.video_out.vdev.entity);
+}
+
 int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
 				   struct v4l2_device *vdev)
 {
@@ -913,7 +918,7 @@ int atomisp_subdev_init(struct atomisp_device *isp)
 	isp_subdev_init_params(&isp->asd);
 	ret = isp_subdev_init_entities(&isp->asd);
 	if (ret < 0)
-		atomisp_subdev_cleanup_entities(&isp->asd);
+		atomisp_subdev_cleanup(isp);
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..5ba9584b81d7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -334,10 +334,8 @@ int atomisp_video_init(struct atomisp_video_pipe *video)
 
 void atomisp_video_unregister(struct atomisp_video_pipe *video)
 {
-	if (video_is_registered(&video->vdev)) {
-		media_entity_cleanup(&video->vdev.entity);
+	if (video_is_registered(&video->vdev))
 		video_unregister_device(&video->vdev);
-	}
 }
 
 static int atomisp_save_iunit_reg(struct atomisp_device *isp)
@@ -814,7 +812,6 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 
 	v4l2_device_unregister(&isp->v4l2_dev);
 	media_device_unregister(&isp->media_dev);
-	media_device_cleanup(&isp->media_dev);
 
 	for (i = 0; i < isp->input_cnt; i++)
 		__v4l2_subdev_state_free(isp->inputs[i].try_sd_state);
@@ -875,7 +872,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	v4l2_device_unregister(&isp->v4l2_dev);
 v4l2_device_failed:
 	media_device_unregister(&isp->media_dev);
-	media_device_cleanup(&isp->media_dev);
 	return ret;
 }
 
@@ -1086,7 +1082,7 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 	ret = atomisp_mipi_csi2_init(isp);
 	if (ret < 0) {
 		dev_err(isp->dev, "mipi csi2 initialization failed\n");
-		goto error_mipi_csi2;
+		return ret;
 	}
 
 	ret = atomisp_subdev_init(isp);
@@ -1098,13 +1094,13 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 	return 0;
 
 error_isp_subdev:
-error_mipi_csi2:
 	atomisp_mipi_csi2_cleanup(isp);
 	return ret;
 }
 
 static void atomisp_uninitialize_modules(struct atomisp_device *isp)
 {
+	atomisp_subdev_cleanup(isp);
 	atomisp_mipi_csi2_cleanup(isp);
 }
 
@@ -1451,6 +1447,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	atomisp_unregister_entities(isp);
 error_uninitialize_modules:
 	atomisp_uninitialize_modules(isp);
+	media_device_cleanup(&isp->media_dev);
 error_irq_uninit:
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
@@ -1476,6 +1473,7 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 
 	atomisp_unregister_entities(isp);
 	atomisp_uninitialize_modules(isp);
+	media_device_cleanup(&isp->media_dev);
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
 }
-- 
2.34.1

