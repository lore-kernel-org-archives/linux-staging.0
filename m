Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33913AFD0F
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907548; cv=none; b=sjnPV2n7PF7UQUwJIUkNKPxJ851K2L73G4N8R9D/Hsw+NGaInSqF6vEtbjWgH77X5PQojAahKwOobBIiF8J5Pew9JdIdGT6SN4ur/c9xpDKB08/3Gw/+O5ofkaXN2pi4Yomy/KYGpNwtRHPd36EuF/P6qwkYRoTTZCveamHMd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907548; c=relaxed/simple;
	bh=si2ebiu2bDHgdCYLqsoKLsLRmQmG982ZvPTVe5jAsiU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jO+974IFPUVrRHE4LoN6U8pQQYt7V86EoqH8LLIv0aQVrSMr8mOIIhzSBj145FD8qSKpi9DTEJ9yFuJQhAriI4iZcdA0iVRB2HmBmF18RE7cuC3mskp3BKnSrbukKUkllAbAS85RIUq7ArCF2p9b6MOnRsFqq5C76ubvkHwWU9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=nFTMg4EI; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="nFTMg4EI"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 417c4ff68;
	Mon, 8 Jun 2026 16:27:08 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andy@kernel.org
Cc: hansg@kernel.org,
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
Subject: [PATCH] media: atomisp: Fix resource leak in atomisp_pci_probe()
Date: Mon,  8 Jun 2026 16:27:06 +0800
Message-Id: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea657be1e03a2kunm16811e9be6e94
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkIfVk4ZTUpCSx1PS0sfTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=nFTMg4EIkb/OQqo4Q0yDmnvnKTtjOHv5kUIdixXdek/N60q6Ki6T24N+dDNX5MgODcXolD777cXiy82/trpTHpUlDg9UVwbpHi1ZiLumeV64tLO1kkGBPz7qWpmT+DaLZ1dWfTAIzQ8jpxSvjuufLqzeTsIVJ65KArJyuzF8Eco=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=W2RbCHX5ggtfcHqnc5ufIp0FeZZQMQa5I9HAGMwivaM=;
	h=date:mime-version:subject:message-id:from;

During atomisp_pci_probe(), the ISP subdev is initialized via
atomisp_initialize_modules() prior to entity registration. If
atomisp_register_entities() fails, the current error path only
uninitializes the CSI2 modules. This leaks the subdev entity and control
handler that were previously set up by atomisp_subdev_init().

Fix this by calling atomisp_subdev_unregister_entities() to properly
release the subdev state on this specific error path. Later error paths
remain unchanged, as they correctly use atomisp_unregister_entities() to
handle broader cleanup after successful registration.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing v6.13-rc1.
The tool is still under development and is not yet publicly available.
Manual inspection confirms that the bug is still present in v7.1-rc5.

An x86_64 allyesconfig build showed no new warnings. As we do not have an
Intel Atom ISP platform to test with, no runtime testing was able to be
performed.

Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..d4e4e845f66e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1401,6 +1401,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = atomisp_register_entities(isp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
+		atomisp_subdev_unregister_entities(&isp->asd);
 		goto error_uninitialize_modules;
 	}
 
-- 
2.34.1

