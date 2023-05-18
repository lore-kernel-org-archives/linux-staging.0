Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECE42107C
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684424264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBXEHbEDKmcse396WHZeZQsyTYAVHG1j+n5jYr1zIPU=;
	b=GoK/cW6FsYG47duzIrpb9FCPi3rX9t/F/Co7LW76GPQO9y465kGsuP7KTkSt8Rgb0C44UQ
	DpHv8LR6baXyKJcblcbeyZiDY/8oMmnl4xDJdJsnb/YUlnEuisCfuqtQYGx8KOD9f/sFJ2
	w+ACmsV5Hw2ULoMOHRPF3cYp2dC6jFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-dus0PfZqO4aLiVf6d_ot4A-1; Thu, 18 May 2023 11:37:40 -0400
X-MC-Unique: dus0PfZqO4aLiVf6d_ot4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 756E0101A555;
	Thu, 18 May 2023 15:37:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E48C763F8F;
	Thu, 18 May 2023 15:37:37 +0000 (UTC)
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
Subject: [PATCH 2/9] media: atomisp: Remove unused fields from struct atomisp_input_subdev
Date: Thu, 18 May 2023 17:37:26 +0200
Message-Id: <20230518153733.195306-3-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
References: <20230518153733.195306-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Remove unused fields from struct atomisp_input_subdev:

1. frame_size is never used at all
2. sensor_index is always 0, just directly pass 0 in the single user.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c    | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     | 7 -------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index feaf4037a389..ee0dd5eb4711 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -126,15 +126,12 @@ struct atomisp_input_subdev {
 	enum atomisp_camera_port port;
 	struct v4l2_subdev *camera;
 	struct v4l2_subdev *motor;
-	struct v4l2_frmsizeenum frame_size;
 
 	/*
 	 * To show this resource is used by
 	 * which stream, in ISP multiple stream mode
 	 */
 	struct atomisp_sub_device *asd;
-
-	int sensor_index;
 };
 
 enum atomisp_dfs_mode {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 900e4c79cd78..2cde1af77a2d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -673,7 +673,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 
 	/* select operating sensor */
 	ret = v4l2_subdev_call(isp->inputs[input].camera, video, s_routing,
-			       0, isp->inputs[input].sensor_index, 0);
+			       0, 0, 0);
 	if (ret && (ret != -ENOIOCTLCMD)) {
 		dev_err(isp->dev, "Failed to select sensor\n");
 		return ret;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 93998fdc836d..a2440f270ffe 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -866,13 +866,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 			isp->inputs[isp->input_cnt].type = subdevs->type;
 			isp->inputs[isp->input_cnt].port = subdevs->port;
 			isp->inputs[isp->input_cnt].camera = subdevs->subdev;
-			isp->inputs[isp->input_cnt].sensor_index = 0;
-			/*
-			 * initialize the subdev frame size, then next we can
-			 * judge whether frame_size store effective value via
-			 * pixel_format.
-			 */
-			isp->inputs[isp->input_cnt].frame_size.pixel_format = 0;
 			isp->input_cnt++;
 			break;
 		case CAMERA_MOTOR:
-- 
2.40.1

