Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82658146D6A
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834071; cv=none; b=b/rZC+FJow+wA7QmuK2bbMBVVOekBnS/0Sol3QdHcsnFEaCrhs/XSdEmjkX4TS2WW5BvVYgTn0iTUnSyq/UaUVsAZ9F/D7sKRF0iAWZ+PGs+x6hULJTRdlp/5XVjWBTVLLLHPDShbhZF7P17RmhqH7fPYvbQRSi8ALXjwLIlF+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834071; c=relaxed/simple;
	bh=3cazwMJtsoHsgyTdJwUQjHhmVBKMX8oJ8sMHpXzyn6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNaQAfe72xWpDpzEdUp1t2fk4nPMu8R67QI2DmYCt4NPJzuq2v1ae82032VNDJfYc9gI2gX3ODXeVcqbbhPKb/+MEjG5hOZf1PHvz+cnitizP2eXUYxFzSHPQzl4ceqMmI8l1uRBrk4rGT7rnlagwmNBEwH4MsZ66duACDQQpdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIw/1JRW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dIw/1JRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728834068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myIZloc/IR0tcmVaTEShSRjZ134QHehFws73ciXiCZw=;
	b=dIw/1JRWRMayaslEIySJ2tf1zYMKHOlM/87djIfrXb7xjHT5WZwDhciN6oF54Yas2P0OB6
	+nDm7ldUolZSp3AzaKFD0VNOmNERmOy3UjLnD+WaA/8l2/5tdWHz1iewMaPIq16h4d5DZP
	eTcR7F736+clQdhjInHme1lE8RyFPLU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-uyWBOKFOPcm0eE8GjQ4FfQ-1; Sun,
 13 Oct 2024 11:41:05 -0400
X-MC-Unique: uyWBOKFOPcm0eE8GjQ4FfQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98B6219560A2;
	Sun, 13 Oct 2024 15:41:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.70])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10B3219560AE;
	Sun, 13 Oct 2024 15:41:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/4] media: atomisp: Fix WARN_ON() in vb2_start_streaming() triggering
Date: Sun, 13 Oct 2024 17:40:53 +0200
Message-ID: <20241013154056.12532-2-hdegoede@redhat.com>
In-Reply-To: <20241013154056.12532-1-hdegoede@redhat.com>
References: <20241013154056.12532-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

If atomisp fails to start the stream the buffers must be returned to
the VB2_BUF_STATE_QUEUED state before returning an error from
atomisp_start_streaming().

This fixes the following WARN_ON():
[  250.313554] WARNING: CPU: 3 PID: 2178 at drivers/media/common/videobuf2/videobuf2-core.c:1801 vb2_start_streaming+0xcb/0x150 [videobuf2_common]

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d7e8a9871522..47d8a17379b0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -881,8 +881,10 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	mutex_lock(&isp->mutex);
 
 	ret = atomisp_pipe_check(pipe, false);
-	if (ret)
+	if (ret) {
+		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
 		goto out_unlock;
+	}
 
 	/*
 	 * When running a classic v4l2 app after a media-controller aware
@@ -895,6 +897,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	mutex_unlock(&isp->media_dev.graph_mutex);
 	if (ret) {
 		dev_err(isp->dev, "Error starting mc pipeline: %d\n", ret);
+		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
 		goto out_unlock;
 	}
 
-- 
2.47.0

