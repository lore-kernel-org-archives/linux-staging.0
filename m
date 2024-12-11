Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A8E1DDC19
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 17:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733938540; cv=none; b=W+W/NRUNvJQCCt3x8bB5dBc0fvIHm3RQ1Ah2HMXY2mhFQRL2uw4itMHteY/sZyb0BGhRS+Ur10JSTMeUrCRVMnO02FTSv5a3M9QWfZhd51mBQXhi5z8hKuekCy2Fh/PcTRnCWhnUQtxHvJoElttamN7cv+CHPhqNlkppAFlpeK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733938540; c=relaxed/simple;
	bh=rgoOLp9R3iTyNCAk2OsGG+3qmwhQcZujQNprSi0noi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+TVplhan561qi5i0am51VfExop3SHPCuG702oKEqIaFmrg0T+XFdqsYS7SHRII+nI7eUjLAYY2wYxzFtOXtJakG6ySbBmb3JC8zoN6R6FRVJI+0uY2q7d+B9ptz+AjLMzRqIZYt2p0j4I3IMus/G/sjB9oQAYgL8qU7gi53Oxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKBrsMej; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKBrsMej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733938537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIZ4g0Xd4iqRq87UWw6BCvGirg0eO455cfJpn+W54+Q=;
	b=NKBrsMej3Erm0FXz6q2e/ySBkZ1Apoy3IS5fW0a6DWdyzJM958qTAi/RMYJa1sFbqexnt7
	WLSqqyfwKtXd4pIVYN9Z+AdmNg2YzNtMFI+40Eu1xra4ZXfpOh26L/3BUj/ZqSUaG8DkH9
	LXLIcmufwMrnPC/wszJD0kzdCUv+Tl4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-Du3edwArOEuQwo8pD3hjwQ-1; Wed,
 11 Dec 2024 12:35:33 -0500
X-MC-Unique: Du3edwArOEuQwo8pD3hjwQ-1
X-Mimecast-MFC-AGG-ID: Du3edwArOEuQwo8pD3hjwQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DFF31955F3B;
	Wed, 11 Dec 2024 17:35:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.61])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B8541956089;
	Wed, 11 Dec 2024 17:35:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] media: atomisp: Avoid picking too big sensor resolution
Date: Wed, 11 Dec 2024 18:35:16 +0100
Message-ID: <20241211173516.350779-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

atomisp_try_fmt() is limiting the width of the requested resolution to 1920
before calling the sensor's try_fmt() method. But it is not limiting
the height. In case of the old mode-list based t4ka3 driver which has
a mode list of:

736x496
896x736
1936x1096
3280x2464

This results in 3280x2464 being selected when try_fmt is called
with a requested resolution of 3280x2464, which is not supported because
its width > 1920 .

Fix this by also limiting the height when in preview mode.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add "U" prefix to max values and use min(...) instead of min_t(u32, ...)
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 02ccf80e6559..52e71a7f69ca 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3784,9 +3784,14 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 			return -EINVAL;
 	}
 
-	/* The preview pipeline does not support width > 1920 */
-	if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW)
-		f->width = min_t(u32, f->width, 1920);
+	/*
+	 * The preview pipeline does not support width > 1920. Also limit height
+	 * to avoid sensor drivers still picking a too wide resolution.
+	 */
+	if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
+		f->width = min(f->width, 1920U);
+		f->height = min(f->height, 1440U);
+	}
 
 	/*
 	 * atomisp_set_fmt() will set the sensor resolution to the requested
-- 
2.47.1

