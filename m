Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61F2F44
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlWAwtV8Xn+KUl9l1Dhr97N/vM/D/N+BeMY2n8hOTxw=;
	b=LA8XwUFWS+QL+Mi2VsYDddey8ywQMVEPv6XtBd7Smac7Aad7tcy/g1D7qvNDVzurbW4unf
	5AnnNnQPARYfhWsdx25MfGoODwyk3Bh038rpnBYXn0bpDvS8rSYUeedlkTs9hToNAG5kfI
	IjW79NECuA9NgKlsd2q63Tcj6wRJUs4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-4B34BO1_MnO65d53Fu6e9Q-1; Mon, 23 Jan 2023 07:54:08 -0500
X-MC-Unique: 4B34BO1_MnO65d53Fu6e9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F31608853A0;
	Mon, 23 Jan 2023 12:54:07 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF45C15BA0;
	Mon, 23 Jan 2023 12:54:05 +0000 (UTC)
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
Subject: [PATCH 39/57] media: atomisp: ov2680: Drop v4l2_find_nearest_size() call from set_fmt()
Date: Mon, 23 Jan 2023 13:51:47 +0100
Message-Id: <20230123125205.622152-40-hdegoede@redhat.com>
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

Since we now calculate timings baded on the desired width and height,
any width and height are valid as long as they don't exceed the sensor's
dimensions.

Drop the v4l2_find_nearest_size() call and instead clamp the requested
width and height.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 75d09c44202c..3d5e18fb45ee 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -512,7 +512,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *fmt;
-	struct ov2680_resolution *res;
+	unsigned int width, height;
 	int ret = 0;
 
 	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
@@ -520,14 +520,11 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		(format->which == V4L2_SUBDEV_FORMAT_TRY) ? "try" : "set",
 		format->pad, fmt);
 
-	res = v4l2_find_nearest_size(ov2680_res_preview, ARRAY_SIZE(ov2680_res_preview),
-				     width, height,
-				     format->format.width, format->format.height);
-	if (!res)
-		res = &ov2680_res_preview[N_RES_PREVIEW - 1];
+	width = min_t(unsigned int, ALIGN(format->format.width, 2), OV2680_NATIVE_WIDTH);
+	height = min_t(unsigned int, ALIGN(format->format.height, 2), OV2680_NATIVE_HEIGHT);
 
 	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
-	ov2680_fill_format(dev, fmt, res->width, res->height);
+	ov2680_fill_format(dev, fmt, width, height);
 
 	format->format = *fmt;
 
-- 
2.39.0

