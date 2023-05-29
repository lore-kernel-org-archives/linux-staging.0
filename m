Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCD26AAB
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685356737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eY5GRIhxRHm9R1UYzqtHgxYfbhDkhjEaYt7dTNhkMmo=;
	b=b+VnoXhcq1b24NmuMw/SW9g1Mc4K+sCLr/oE4i8HbhXVs4YN20Vrl9Z/n3s6VpU7jAaIpc
	fDe9Ld9vn7Bzw76Lt8kUe5qz4xZC2kp9FzMrucH1f7kFVXDp2qePA8j+xTpt9pfqojhtUB
	pct5ndBWr5hJJPVWLARhAmZp3QL9EVc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-Dw7hnFSSPEqUB5J1fI032w-1; Mon, 29 May 2023 06:38:52 -0400
X-MC-Unique: Dw7hnFSSPEqUB5J1fI032w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C8F31C06904;
	Mon, 29 May 2023 10:38:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D36622166B2B;
	Mon, 29 May 2023 10:38:49 +0000 (UTC)
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
Subject: [PATCH 16/21] media: atomisp: Pass MEDIA_BUS_FMT_* code when calling enum_frame_size pad-op
Date: Mon, 29 May 2023 12:37:36 +0200
Message-Id: <20230529103741.11904-17-hdegoede@redhat.com>
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

A sensor driver's enum_frame_size pad-op may return -EINVAL when
v4l2_subdev_frame_size_enum.code is not set to a supported
MEDIA_BUS_FMT_* code.

Make atomisp_init_sensor() get the sensor's MEDIA_BUS_FMT_* code and
pass this when calling the enum_frame_size pad-op.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 1 +
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c    | 1 +
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 14d21c6e227d..9fded17a2c71 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -125,6 +125,7 @@
 struct atomisp_input_subdev {
 	unsigned int type;
 	enum atomisp_camera_port port;
+	u32 code; /* MEDIA_BUS_FMT_* */
 	bool crop_support;
 	struct v4l2_subdev *camera;
 	/* Sensor rects for sensors which support crop */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8ba1d11ae907..980465fd5a83 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -707,6 +707,7 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	struct v4l2_subdev_frame_size_enum fse = {
 		.index = fsize->index,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.code = input->code,
 	};
 	int ret;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 506f04ca92b1..3a2e15605919 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -933,12 +933,18 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 
 static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 {
+	struct v4l2_subdev_mbus_code_enum mbus_code_enum = { };
 	struct v4l2_subdev_state sd_state = {
 		.pads = &input->pad_cfg,
 	};
 	struct v4l2_subdev_selection sel = { };
 	int err;
 
+	mbus_code_enum.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	err = v4l2_subdev_call(input->camera, pad, enum_mbus_code, NULL, &mbus_code_enum);
+	if (!err)
+		input->code = mbus_code_enum.code;
+
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_NATIVE_SIZE;
 	err = v4l2_subdev_call(input->camera, pad, get_selection, NULL, &sel);
-- 
2.40.1

