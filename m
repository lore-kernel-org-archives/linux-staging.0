Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8932F2E
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mrke5JufIOmcGBUjvE3Pl/Ei2jA/GlG1QFPe4gfBo2o=;
	b=JYVWJcpShtEVY1/IUY2028wY8qVWu0K9/woH5JMT4IrwxeYO3zJVl4Q4HkBMuTiDVOQLgj
	HY5FhiDDbnnDtflQ8tvDTufziebCJzFCI9uq1GQHVXY5zGdzGuG8aqPCtEs/px+PhtVfdV
	ZSurGD7Ayw0IBwl4ssKUov2K94xoNGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-Ld_NtXkoPhC6kk6NVZQIyg-1; Mon, 23 Jan 2023 07:53:51 -0500
X-MC-Unique: Ld_NtXkoPhC6kk6NVZQIyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A02FC8853BA;
	Mon, 23 Jan 2023 12:53:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E842C15BA0;
	Mon, 23 Jan 2023 12:53:48 +0000 (UTC)
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
Subject: [PATCH 33/57] media: atomisp: ov2680: Add test pattern control
Date: Mon, 23 Jan 2023 13:51:41 +0100
Message-Id: <20230123125205.622152-34-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Add a test pattern control. This is a 1:1 copy of the test pattern
control in the main drivers/media/i2c/ov2680.c driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 33 +++++++++++++++++++
 drivers/staging/media/atomisp/i2c/ov2680.h    |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 14002a1c22d2..6ca2a5bb0700 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -127,6 +127,24 @@ static int ov2680_gain_set(struct ov2680_device *sensor, u32 gain)
 	return ovxxxx_write_reg16(sensor->client, OV2680_REG_GAIN_PK, gain);
 }
 
+static int ov2680_test_pattern_set(struct ov2680_device *sensor, int value)
+{
+	int ret;
+
+	if (!value)
+		return ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), 0);
+
+	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, 0x03, value - 1);
+	if (ret < 0)
+		return ret;
+
+	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -151,6 +169,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_GAIN:
 		ret = ov2680_gain_set(sensor, ctrl->val);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov2680_test_pattern_set(sensor, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -644,6 +665,13 @@ static const struct v4l2_subdev_ops ov2680_ops = {
 
 static int ov2680_init_controls(struct ov2680_device *sensor)
 {
+	static const char * const test_pattern_menu[] = {
+		"Disabled",
+		"Color Bars",
+		"Random Data",
+		"Square",
+		"Black Image",
+	};
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
@@ -658,6 +686,11 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
 					    0, exp_max, 1, exp_max);
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 1023, 1, 250);
+	ctrls->test_pattern =
+		v4l2_ctrl_new_std_menu_items(hdl,
+					     &ov2680_ctrl_ops, V4L2_CID_TEST_PATTERN,
+					     ARRAY_SIZE(test_pattern_menu) - 1,
+					     0, 0, test_pattern_menu);
 
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index e3ad20a7ffd5..45526477b612 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -120,6 +120,8 @@
 #define OV2680_MWB_BLUE_GAIN_H			0x5008/*0x3404*/
 #define OV2680_MWB_GAIN_MAX				0x0fff
 
+#define OV2680_REG_ISP_CTRL00			0x5080
+
 #define OV2680_START_STREAMING			0x01
 #define OV2680_STOP_STREAMING			0x00
 
@@ -171,6 +173,7 @@ struct ov2680_device {
 		struct v4l2_ctrl *vflip;
 		struct v4l2_ctrl *exposure;
 		struct v4l2_ctrl *gain;
+		struct v4l2_ctrl *test_pattern;
 	} ctrls;
 };
 
-- 
2.39.0

