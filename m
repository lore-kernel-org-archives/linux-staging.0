Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FA06AA6
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685356742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8i5rqvCYDXsKLT2n/PrU89zTeCQnNlUGSNta4Kpb1Y=;
	b=Uonm3t50KLnj2cgvyF6/E8uAxnR77gyltqTpP+qefIKVmkpRWmGRwcc7P1qSSIqPrlF5fZ
	2j4QER1mkL9tRAOJBDD1yKw28mpvFt+jznnjRKLiL/Ueu8m1TRQwE442BIesVKp2eiJRZb
	VfwaHM3/J29kj3/j7+IABNhlAr/u+5A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-xfxOaZGpMvCOo-mfUUTCLQ-1; Mon, 29 May 2023 06:38:59 -0400
X-MC-Unique: xfxOaZGpMvCOo-mfUUTCLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B9C6185A78B;
	Mon, 29 May 2023 10:38:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E88AB2166B2B;
	Mon, 29 May 2023 10:38:56 +0000 (UTC)
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
Subject: [PATCH 20/21] media: atomisp: Add enum_framesizes function for sensors with selection / crop support
Date: Mon, 29 May 2023 12:37:40 +0200
Message-Id: <20230529103741.11904-21-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Some sensor drivers with crop support (e.g. the ov5693 driver) only
return the current crop rectangle + 1/2 (binning) of the current crop
rectangle when calling their enum_frame_sizes op.

This causes 2 issues:
1. Atomisp sets to the crop area to include the padding, where as
   the enum_framesizes ioctl should return values without padding.

2. With cropping a lot more standard resolutions are possible then
   just these 2 and many apps limit the list given to the end user
   to the list returned by enum_framesizes.

Add an alternative enum_framesizes function for sensors which support
cropping to fix both issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/TODO            |  3 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index 5e7bb6eb351a..13b4a9015a7b 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -28,9 +28,6 @@ TODO
 * The atomisp ov2680 and ov5693 sensor drivers bind to the same hw-ids as
   the standard ov2680 and ov5693 drivers under drivers/media/i2c, which
   conflicts. Drop the atomisp private ov2680 and ov5693 drivers:
-  * Make atomisp code use v4l2 selections to deal with the extra padding
-    it wants to receive from sensors instead of relying on the ov2680 code
-    sending e.g. 1616x1216 for a 1600x1200 mode
   * Port various ov2680 improvements from atomisp_ov2680.c to regular ov2680.c
     and switch to regular ov2680 driver
   * Make atomisp work with the regular ov5693 driver and drop atomisp_ov5693
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 980465fd5a83..196ef250aedd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -697,6 +697,72 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	return 0;
 }
 
+/*
+ * With crop any framesize <= sensor-size can be made, give
+ * userspace a list of sizes to choice from.
+ */
+static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
+					      struct v4l2_frmsizeenum *fsize,
+					      struct v4l2_rect *active,
+					      int *valid_sizes)
+{
+	static const struct v4l2_frmsize_discrete frame_sizes[] = {
+		{ 1600, 1200 },
+		{ 1600, 1080 },
+		{ 1600,  900 },
+		{ 1440, 1080 },
+		{ 1280,  960 },
+		{ 1280,  720 },
+		{  800,  600 },
+		{  640,  480 },
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
+		if (frame_sizes[i].width > active->width ||
+		    frame_sizes[i].height > active->height)
+			continue;
+
+		/*
+		 * Skip sizes where width and height are less then 2/3th of the
+		 * sensor size to avoid sizes with a too small field of view.
+		 */
+		if (frame_sizes[i].width < (active->width * 2 / 3) &&
+		    frame_sizes[i].height < (active->height * 2 / 3))
+			continue;
+
+		if (*valid_sizes == fsize->index) {
+			fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+			fsize->discrete = frame_sizes[i];
+			return 0;
+		}
+
+		(*valid_sizes)++;
+	}
+
+	return -EINVAL;
+}
+
+static int atomisp_enum_framesizes_crop(struct atomisp_device *isp,
+					struct v4l2_frmsizeenum *fsize)
+{
+	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
+	struct v4l2_rect active = input->active_rect;
+	int ret, valid_sizes = 0;
+
+	ret = atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &valid_sizes);
+	if (ret == 0)
+		return 0;
+
+	if (!input->binning_support)
+		return -EINVAL;
+
+	active.width /= 2;
+	active.height /= 2;
+
+	return atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &valid_sizes);
+}
+
 static int atomisp_enum_framesizes(struct file *file, void *priv,
 				   struct v4l2_frmsizeenum *fsize)
 {
@@ -711,6 +777,9 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	};
 	int ret;
 
+	if (input->crop_support)
+		return atomisp_enum_framesizes_crop(isp, fsize);
+
 	ret = v4l2_subdev_call(input->camera, pad, enum_frame_size, NULL, &fse);
 	if (ret)
 		return ret;
-- 
2.40.1

