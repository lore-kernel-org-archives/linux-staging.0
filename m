Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F380EC8
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662025620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sw0u8eRtCCnZy3F0HLw0bEw8iB+1GTHX6bU6r1JWpII=;
	b=VsAdxdsjqwv8lW2a/LQQ2KI+iLivvyusqmAU9UYhI3srSF+7+Fc+Y9SVfQ/rjVZssKUF0B
	9+vZuNH2Zv+ijQb5JIIX/QXGF/HKuLj+WLbr5xP7JNyZnoLWWgG9/Jc/WW3iO+ykSHCopu
	5wiT3ySqO0w5cSk091GMwzUqL90CBfE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-mLuHwdcuNPKU4C3plRxeWA-1; Thu, 01 Sep 2022 05:46:57 -0400
X-MC-Unique: mLuHwdcuNPKU4C3plRxeWA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C85F8108C1C5;
	Thu,  1 Sep 2022 09:46:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4452C40334F;
	Thu,  1 Sep 2022 09:46:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/14] media: atomisp: Fix device_caps reporting of the registered video-devs
Date: Thu,  1 Sep 2022 11:46:13 +0200
Message-Id: <20220901094626.11513-2-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

atomisp_subdev_register_entities() had V4L2_CAP_VIDEO_CAPTURE /
V4L2_CAP_VIDEO_OUT swapped. Or-ing in V4L2_CAP_VIDEO_OUT for
the nodes which allow capturing from the camera and or-ing in
V4L2_CAP_VIDEO_CAPTURE for the file-injection node
(mem2mem use of the ISP).

Things happen to still work for the capture device-nodes because
the "shared" caps also included V4L2_CAP_VIDEO_CAPTURE, so those
shared nodes advertised V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUT.

Fix things so that only the correct caps are advertised.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_subdev.c        | 24 ++++++-------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 394fe6959033..6d533919d466 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1314,16 +1314,12 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 				     struct v4l2_device *vdev)
 {
 	int ret;
-	u32 device_caps;
 
 	/*
 	 * FIXME: check if all device caps are properly initialized.
-	 * Should any of those use V4L2_CAP_META_OUTPUT? Probably yes.
+	 * Should any of those use V4L2_CAP_META_CAPTURE? Probably yes.
 	 */
 
-	device_caps = V4L2_CAP_VIDEO_CAPTURE |
-		      V4L2_CAP_STREAMING;
-
 	/* Register the subdev and video node. */
 
 	ret = v4l2_device_register_subdev(vdev, &asd->subdev);
@@ -1331,39 +1327,34 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 		goto error;
 
 	asd->video_out_preview.vdev.v4l2_dev = vdev;
-	asd->video_out_preview.vdev.device_caps = device_caps |
-						  V4L2_CAP_VIDEO_OUTPUT;
+	asd->video_out_preview.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_out_preview.vdev,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error;
 
 	asd->video_out_capture.vdev.v4l2_dev = vdev;
-	asd->video_out_capture.vdev.device_caps = device_caps |
-						  V4L2_CAP_VIDEO_OUTPUT;
+	asd->video_out_capture.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_out_capture.vdev,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error;
 
 	asd->video_out_vf.vdev.v4l2_dev = vdev;
-	asd->video_out_vf.vdev.device_caps = device_caps |
-					     V4L2_CAP_VIDEO_OUTPUT;
+	asd->video_out_vf.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_out_vf.vdev,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error;
 
 	asd->video_out_video_capture.vdev.v4l2_dev = vdev;
-	asd->video_out_video_capture.vdev.device_caps = device_caps |
-							V4L2_CAP_VIDEO_OUTPUT;
+	asd->video_out_video_capture.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_out_video_capture.vdev,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error;
 	asd->video_acc.vdev.v4l2_dev = vdev;
-	asd->video_acc.vdev.device_caps = device_caps |
-					  V4L2_CAP_VIDEO_OUTPUT;
+	asd->video_acc.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_acc.vdev,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
@@ -1377,8 +1368,7 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 		return 0;
 
 	asd->video_in.vdev.v4l2_dev = vdev;
-	asd->video_in.vdev.device_caps = device_caps |
-					  V4L2_CAP_VIDEO_CAPTURE;
+	asd->video_in.vdev.device_caps = V4L2_CAP_VIDEO_OUT | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_in.vdev,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
-- 
2.37.2

