Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5BD1F8725
	for <linux-staging@lists.linux.dev>; Sat, 17 May 2025 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482201; cv=none; b=RnmTKTdLOU/V61mAf2RhhjegUfHzSSAQyp1GVxVilZayIr+jN0H1mzURC9yyOlwgJNtdcslANRNs3umfvq6MzcVq3yEQEFScQ0hVxw6a4fBaS5UwcNQjgeHWXTEMKeaGD7kW/hHCBJQHdSGMMs/PBeG02oOO2k60x4ar6S1jc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482201; c=relaxed/simple;
	bh=/SB1vAjPIxWiNlOV9rnIEVvEAPZBA1W2H0w6marqKOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2CZu7apKdJ+7r7So5p1MzC6uUg573sJ6mhuj/Go6Fezvf8sxWMid0FVDiK9H7QPQP85Y1so33EFjGLuG1npWJo2vxm2QrJrWg7ctDkB2y5X5ScFeKKxrPRkM+o1i7boT3VIEn/C8//ojk8kSsU0IYn5XUEk4uPIIZ08D2hGhKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ChLJawRu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ChLJawRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnM++5sgw0x3MaThs2NW6M7uSZL/DrL8OMpNuFmVLPo=;
	b=ChLJawRuetX4ULtvPs2E5k22BJcmtBX4DfKpieJMn/bJz2c/9bZDUsAGRUW1Uw6KTzeEu1
	3YTuatzfEsRC7g7HhBknR5/zEemuk2/uGhWhwul1tjdB1NnsLAjbg4FBLsFar1IEWLjpx9
	AdmAwOt0LmdENabKVKz7Cr9hSPUH43k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-1AGOrKE2MxOvTV-jOwdyqw-1; Sat,
 17 May 2025 07:43:17 -0400
X-MC-Unique: 1AGOrKE2MxOvTV-jOwdyqw-1
X-Mimecast-MFC-AGG-ID: 1AGOrKE2MxOvTV-jOwdyqw_1747482196
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 68CFB1800446;
	Sat, 17 May 2025 11:43:16 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABA1018003FC;
	Sat, 17 May 2025 11:43:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 22/23] media: atomisp: gc0310: Drop gc0310_g_skip_frames()
Date: Sat, 17 May 2025 13:41:05 +0200
Message-ID: <20250517114106.43494-23-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The g_skip_frames sensor-op is obsolete, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 73779c20ca68..edcad228272a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -541,16 +541,6 @@ static int gc0310_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int gc0310_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
-{
-	*frames = GC0310_SKIP_FRAMES;
-	return 0;
-}
-
-static const struct v4l2_subdev_sensor_ops gc0310_sensor_ops = {
-	.g_skip_frames	= gc0310_g_skip_frames,
-};
-
 static const struct v4l2_subdev_video_ops gc0310_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
@@ -569,7 +559,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 static const struct v4l2_subdev_ops gc0310_ops = {
 	.video = &gc0310_video_ops,
 	.pad = &gc0310_pad_ops,
-	.sensor = &gc0310_sensor_ops,
 };
 
 static int gc0310_init_state(struct v4l2_subdev *sd,
-- 
2.49.0

