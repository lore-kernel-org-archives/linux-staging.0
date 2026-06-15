Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BA43002DC
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508539; cv=none; b=URG/Ws0KstndZrk+TFDubdT7a/vbE62Yg9Uwp7K8lBtLZzd8rVeyDg2FyaLoJQ+7kRWnx/9/GZsZR5D4DWEW4BBOmAQ/ruy3yxgQK50rcpkgjz+OACiu5m6YXnMsr/fBdfUr+jzdxcgFC2nmMU5fnDfzTG2KRu86gJo501oEBXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508539; c=relaxed/simple;
	bh=49YSG0xugYHu88e6UqYrXixFYP6jUlLst8e14prOc2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MLRaT5MnwHtUfgBStug/CTLviyxEyw4cxRirK40vGDvjxaTB3kxNFU0XzlbgOAP1+djeYDWV6WCLCRrUbA0k7WIG6eazVZcjuEYbX7BycXWOT7HuSU0iKgWuY4ne1Yr6lhccEixZ9XhRkVCOUe9lMS5qjoNGIcAT9gnLFZ2rzjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=AlpAUJhL; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="AlpAUJhL"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 426442c89;
	Mon, 15 Jun 2026 15:28:43 +0800 (GMT+08:00)
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
	Dawei Feng <dawei.feng@seu.edu.cn>
Subject: [PATCH v2 0/2] media: atomisp: fix probe memory leaks
Date: Mon, 15 Jun 2026 15:28:39 +0800
Message-Id: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eca2ec68603a2kunme2f225d529d47b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkpKVktCSEsdTksfHk4dSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=AlpAUJhL6t4Ekn+s5tsRyMLZGGTxQsp1ADgJHheHuDMuc0Px5n6bWRtRxF0+DGlFeaikoFZifEHa1kWejzlO3NwK5jShl5PGHlNnTu2T6wndGXW425rzk9KTNHw/Bb/BSr1HGFkxn11EM29PxzDmgWvIbUK+Habn3OeZkEVLuVM=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=LHB5zmoGT9lNpKaN2/EbK8IPkvIdVjaqV8u3VOjrvNs=;
	h=date:mime-version:subject:message-id:from;

This series fixes two memory leaks in the atomisp PCI probe and adjusts
cleanup paths.

Patch 1 fixes the cleanup boundary for media entities created during
module initialization. atomisp_uninitialize_modules() did not release all
module-owned state and instead left some media entity cleanup to unregister
helpers. That split is incomplete for probe failures that happen after
module initialization but before all entities are registered, so the
module cleanup path now owns the corresponding media entity cleanup.

Patch 2 adds cleanup for the V4L2 async notifier state initialized by
atomisp_csi2_bridge_parse_firmware(), including notifier connection
cleanup on probe failures and notifier unregister on remove.

Changes in v2:
- Rework patch 1 around the module-init cleanup ownership boundary and
  move media_device_cleanup() after module cleanup.
- Add async notifier cleanup as patch 2.

Dawei Feng (2):
  media: atomisp: fix memory leak in atomisp_pci_probe()
  media: atomisp: fix memory leak in
    atomisp_csi2_bridge_parse_firmware()

 .../staging/media/atomisp/pci/atomisp_csi2.c  |  5 +++-
 .../media/atomisp/pci/atomisp_subdev.c        |  9 +++++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 26 ++++++++++++++-----
 3 files changed, 30 insertions(+), 10 deletions(-)

-- 
2.34.1
