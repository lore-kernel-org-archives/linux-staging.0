Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A92C2C99
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636305369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YqyauolxCwJzENXehwNcrAs/KmXm1xUKj3TqZRG8H1M=;
	b=GC2GDEwueghdKthD5OuBb8e4OT6fytuZ0h/SwKuw5S3NxckJotI2BogRn4w5DXXBGkYe+a
	sHExMXMGK14cRM55RkmZYj5Yp+lMlzqR3oy2LH1K/MapZlds4+ZcoMKRZhosHYUw5gukhQ
	uExBDm2JhDG7OuFqJMMYUP2rpGkOG/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-pG036CGqOruzRHVuqAfdVw-1; Sun, 07 Nov 2021 12:16:08 -0500
X-MC-Unique: pG036CGqOruzRHVuqAfdVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6742D104ED1A;
	Sun,  7 Nov 2021 17:16:06 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6288E57CD3;
	Sun,  7 Nov 2021 17:16:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@infradead.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 06/11] media: atomisp-ov2680: Save/restore exposure and gain over sensor power-down
Date: Sun,  7 Nov 2021 18:15:44 +0100
Message-Id: <20211107171549.267583-7-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11

Save/restore exposure and gain over sensor power-down and don't write them
to the sensor when ov2680_set_exposure() is called while the sensor is off.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/i2c/atomisp-ov2680.c    | 15 ++++++++++++++-
 drivers/staging/media/atomisp/i2c/ov2680.h        |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 83608ba4e70a..5b192218ba91 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -359,7 +359,14 @@ static int ov2680_set_exposure(struct v4l2_subdev *sd, int exposure,
 	int ret;
 
 	mutex_lock(&dev->input_lock);
-	ret = __ov2680_set_exposure(sd, exposure, gain, digitgain);
+
+	dev->exposure = exposure;
+	dev->gain = gain;
+	dev->digitgain = digitgain;
+
+	if (dev->power_on)
+		ret = __ov2680_set_exposure(sd, exposure, gain, digitgain);
+
 	mutex_unlock(&dev->input_lock);
 
 	return ret;
@@ -748,6 +755,10 @@ static int power_up(struct v4l2_subdev *sd)
 	if (ret)
 		goto fail_init_registers;
 
+	ret = __ov2680_set_exposure(sd, dev->exposure, dev->gain, dev->digitgain);
+	if (ret)
+		goto fail_init_registers;
+
 	dev->power_on = true;
 	return 0;
 
@@ -1140,6 +1151,8 @@ static int ov2680_probe(struct i2c_client *client)
 	mutex_init(&dev->input_lock);
 
 	dev->res = &ov2680_res_preview[0];
+	dev->exposure = dev->res->lines_per_frame - OV2680_INTEGRATION_TIME_MARGIN;
+	dev->gain = 250; /* 0-2047 */
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
 
 	pdata = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index c1998c9132a2..ca20ce5aa285 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -174,6 +174,9 @@ struct ov2680_device {
 	struct ov2680_resolution *res;
 	struct camera_sensor_platform_data *platform_data;
 	bool power_on;
+	u16 exposure;
+	u16 gain;
+	u16 digitgain;
 };
 
 /**
-- 
2.31.1

