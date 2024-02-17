Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B5651A4
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169094; cv=none; b=DW20PzIvy+6OxltzD7mc77W7T3trkRbi8P75hNsc6M2ngCRf1FB7o8sHUvsM3IG29hRjcQV8c+/21bS3MBXP1pONW4qCUKarkXMGLMCbbI10Nq7EnwoRCyOCjkeyDhZX5JSJ0vKcZZwzyMyBB/CcZDL4949RM4CjfB0tSHCeyAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169094; c=relaxed/simple;
	bh=UrCQQxu8wBrCARkGsA0k45w/EsXOxfOGkfpkKb/drr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEyRLQ8Hwi+9Xkje0G/FZ6rWRjeoLBROX3jTRJfVTSb4KfdP4qWdQ2LbyUwfiLdQZGBH3GrNS9QIaurlTB+v0ej9A45Di8tHJkfx5eY5eWj96cbTWA+2CpbEfZCWUBz55pix+fvRINg9AJwxMld9aZ6+hhyvb7cz2tP9FUgKHgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H18WKIkO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H18WKIkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Jk/Wjgit8vPCUNupIftP3Nnf9Um0EqGRiw6KxRGK0w=;
	b=H18WKIkOeupugAdHxggVjCpmQP4Zj5YQzyonQtsKVL7/mm/THQsm38IHzChBKSi6/bsS6t
	pw17fYyWyresZ5o1W6GN+SRGrPaMfRWTVAq72WseXThw7/0T4ifVv010lZ4wfIlmsDNOH6
	UWPT8UWc6+dkkVGUXL1YEzDfJTf2x3o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-Lb0kwEu4OouNRHcJdb4mJg-1; Sat, 17 Feb 2024 06:24:49 -0500
X-MC-Unique: Lb0kwEu4OouNRHcJdb4mJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDA8287B2A0;
	Sat, 17 Feb 2024 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 654BA1C1C7E2;
	Sat, 17 Feb 2024 11:24:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/9] media: atomisp: Rename atomisp_set_crop_and_fmt()
Date: Sat, 17 Feb 2024 12:24:31 +0100
Message-ID: <20240217112438.15240-3-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Rename atomisp_set_crop_and_fmt() to atomisp_set_sensor_crop_and_fmt()
to make clear that it operates on the sensor subdev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8593ba90605f..eb37bb6e41f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3721,9 +3721,9 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	*padding_h = max_t(u32, *padding_h, min_pad_h);
 }
 
-static int atomisp_set_crop_and_fmt(struct atomisp_device *isp,
-				    struct v4l2_mbus_framefmt *ffmt,
-				    int which)
+static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
+					   struct v4l2_mbus_framefmt *ffmt,
+					   int which)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_subdev_selection sel = {
@@ -3817,7 +3817,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 
 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
-	ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
+	ret = atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
 	if (ret)
 		return ret;
 
@@ -4263,7 +4263,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 
 	/* Disable dvs if resolution can't be supported by sensor */
 	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
+		ret = atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
 		if (ret)
 			return ret;
 
@@ -4281,7 +4281,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		}
 	}
 
-	ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_ACTIVE);
+	ret = atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (ret)
 		return ret;
 
-- 
2.43.0

