Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FABA4C6B
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683981145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWXGSa0z5CFwYizucVe2FkHyOf8pOSXomUvLZFl67kY=;
	b=GnfSV/Tdo9gIcB9JiBDar2hYqPIQZuA+tm5k1uZp4BKAsh7MoXu+g4tL3bJ3+xuTpn42NV
	S5ZIasqnl0l4WQd1n2kTLHI9F1PqCDqAtbJPyt0b1JoFJ1rlBGQ7PDEYaUHhOF7NVq75Zo
	+DNZIkzPxt7NYpL60Vpn7nUi/FY67Ss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-lmN8cbe8OP-dVY1aTNeJ0A-1; Sat, 13 May 2023 08:32:22 -0400
X-MC-Unique: lmN8cbe8OP-dVY1aTNeJ0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFFFC857E60;
	Sat, 13 May 2023 12:32:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE0240C2076;
	Sat, 13 May 2023 12:32:20 +0000 (UTC)
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
Subject: [PATCH 11/30] media: atomisp: Remove atomisp_subdev_register_video_nodes() helper
Date: Sat, 13 May 2023 14:31:40 +0200
Message-Id: <20230513123159.33234-12-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Now that there is only 1 /dev/video# node left there is no need to
do this in a helper. Just make atomisp_register_device_nodes()
call ideo_register_device() directly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_subdev.c | 18 ------------------
 .../staging/media/atomisp/pci/atomisp_subdev.h |  2 --
 .../staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +++-
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 1c5e489b4405..98292530e330 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1002,24 +1002,6 @@ int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
 	return v4l2_device_register_subdev(vdev, &asd->subdev);
 }
 
-int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
-					struct v4l2_device *vdev)
-{
-	int ret;
-
-	asd->video_out.vdev.v4l2_dev = vdev;
-	asd->video_out.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_out.vdev, VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
-
-	return 0;
-
-error:
-	atomisp_subdev_unregister_entities(asd);
-	return ret;
-}
-
 /*
  * atomisp_subdev_init - ISP Subdevice  initialization.
  * @dev: Device pointer specific to the ATOM ISP.
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index ee7d0ee5d6e4..28afcdd41ef3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -367,8 +367,6 @@ void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
 void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd);
 int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
 				   struct v4l2_device *vdev);
-int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
-					struct v4l2_device *vdev);
 int atomisp_subdev_init(struct atomisp_device *isp);
 void atomisp_subdev_cleanup(struct atomisp_device *isp);
 int atomisp_create_pads_links(struct atomisp_device *isp);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 4370d560308e..f914ab9068c1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1016,7 +1016,9 @@ static int atomisp_register_device_nodes(struct atomisp_device *isp)
 {
 	int err;
 
-	err = atomisp_subdev_register_video_nodes(&isp->asd, &isp->v4l2_dev);
+	isp->asd.video_out.vdev.v4l2_dev = &isp->v4l2_dev;
+	isp->asd.video_out.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	err = video_register_device(&isp->asd.video_out.vdev, VFL_TYPE_VIDEO, -1);
 	if (err)
 		return err;
 
-- 
2.40.1

