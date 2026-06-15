Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBD36655C
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508539; cv=none; b=RXWiELvSrS4kcQRj0C9IeSS4zitdIRutgz6p7vSf22ARpZY+83NuejKrgPoLeH7/t54PCuIPRQhbMUlCn92roDIjk8WZicZs4nmRIUxUihbQNIC+NLP6OVK1ZOQJJpeHGlI71BaRl4RZmbAPFkMZSLovXBvtepub61H/ePaoDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508539; c=relaxed/simple;
	bh=BJEQSfnICxNL4gBKDnFKKg6SdvfFBlfnBZPqIdqvJuw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OztAzJxIOQ/ImBOctLHuuDcV9mGouiszArfkUt3u9wpIEaBAI8EuYVCiFZ4oLIGb1t6gFCldyBYjgNVEf+UNklXbXeLVjXsXqqsb1QyHaQIEz5gWUnoNa1ehhG/tDZmbGodc6lMb05VrleroVhMAiK1pm0mMZxBEYOT6EX0Joh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=bcdaifaC; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="bcdaifaC"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 426442c91;
	Mon, 15 Jun 2026 15:28:47 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andy@kernel.org
Cc: error27@gmail.com,
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
Subject: [PATCH v2 2/2] media: atomisp: fix memory leak in atomisp_csi2_bridge_parse_firmware()
Date: Mon, 15 Jun 2026 15:28:41 +0800
Message-Id: <20260615072841.3113700-3-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eca2ed46103a2kunme2f225d529d488
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTx9OVh8eS0MaGBkdGB9JTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=bcdaifaCDe6CZhHPVGSiSZ4UrN/hLcN7kDXEHcI8vPnSIVpPOrah9XG6neSqNlHeikWqWZ38OPCBptE3ZriWsK+OaEd/V9z+oJevuaHr4m+Ue13km1qAyBkD90zQLpMt9HwrQv1vqwJvulrC9PbXw6xqgh7ojAVkkjaPzhFEK5M=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=4NCYQKkGXvEYYLtJeBgciB1+waSNC29y7g9YmEtGw8c=;
	h=date:mime-version:subject:message-id:from;

atomisp_csi2_bridge_parse_firmware() initializes isp->notifier and may
allocate async notifier connections via v4l2_async_nf_add_fwnode_remote().
However, these resources are currently leaked if a subsequent entity
registration or probe step fails, or when the driver is removed.

Fix this by introducing dedicated helpers to clean up and unregister the
async notifier state. Call atomisp_notifier_cleanup() to release the
allocated connections in both the entity registration failure path and the
overall probe unwind path.

Additionally, invoke atomisp_notifier_unregister() during the device
remove path to ensure the notifier is properly unregistered from the V4L2
core before its underlying resources are freed.

Fixes: 8d28ec7e9145 ("media: atomisp: Add support for v4l2-async sensor registration")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 5ba9584b81d7..1073d9e5eafb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -798,6 +798,17 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 	return atomisp_csi_lane_config(isp);
 }
 
+static void atomisp_notifier_cleanup(struct atomisp_device *isp)
+{
+	v4l2_async_nf_cleanup(&isp->notifier);
+}
+
+static void atomisp_notifier_unregister(struct atomisp_device *isp)
+{
+	v4l2_async_nf_unregister(&isp->notifier);
+	atomisp_notifier_cleanup(isp);
+}
+
 static void atomisp_unregister_entities(struct atomisp_device *isp)
 {
 	unsigned int i;
@@ -869,6 +880,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 csi_and_subdev_probe_failed:
+	atomisp_notifier_cleanup(isp);
 	v4l2_device_unregister(&isp->v4l2_dev);
 v4l2_device_failed:
 	media_device_unregister(&isp->media_dev);
@@ -1444,6 +1456,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
+	atomisp_notifier_cleanup(isp);
 	atomisp_unregister_entities(isp);
 error_uninitialize_modules:
 	atomisp_uninitialize_modules(isp);
@@ -1471,6 +1484,7 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	hmm_cleanup();
 
+	atomisp_notifier_unregister(isp);
 	atomisp_unregister_entities(isp);
 	atomisp_uninitialize_modules(isp);
 	media_device_cleanup(&isp->media_dev);
-- 
2.34.1

