Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB42F2E
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ux65GStCeAew4a3cSv+T3zcur6vR+wMMsnHBzcd+Bzw=;
	b=REinB6QZU5Mo1wEd5WnsrzXLPmeGrP80c7PH2FJWGAJUWo5VtouhODjvb4mqQukn4Tg1DB
	uGqe9+eVh2Dm2yQxdd9Oft6slG/fS/lwi+RU7VRZfivTb8RJm8BLvmrLNEXUGOcIpZh9XU
	YxUmt/FjO5iUFU+nF8Dn1yAr/2rISYI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-biGOmFAbPDe3qG2SqXWpFA-1; Mon, 23 Jan 2023 07:54:47 -0500
X-MC-Unique: biGOmFAbPDe3qG2SqXWpFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9210488B7A0;
	Mon, 23 Jan 2023 12:54:46 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37F1AC15BAD;
	Mon, 23 Jan 2023 12:54:44 +0000 (UTC)
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
Subject: [PATCH 53/57] media: atomisp: ov2722: Don't take the input_lock for try_fmt calls.
Date: Mon, 23 Jan 2023 13:52:01 +0100
Message-Id: <20230123125205.622152-54-hdegoede@redhat.com>
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

On ov2722_set_fmt() calls with format->which == V4L2_SUBDEV_FORMAT_TRY,
ov2722_set_fmt() does not talk to the sensor, so there is no need to
lock the dev->input_lock mutex in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 83d036b5d772..e09c80d1f9ec 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -651,7 +651,6 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 	if (!ov2722_info)
 		return -EINVAL;
 
-	mutex_lock(&dev->input_lock);
 	res = v4l2_find_nearest_size(ov2722_res_preview,
 				     ARRAY_SIZE(ov2722_res_preview), width,
 				     height, fmt->width, fmt->height);
@@ -665,10 +664,10 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		sd_state->pads->try_fmt = *fmt;
-		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
 
+	mutex_lock(&dev->input_lock);
 
 	dev->pixels_per_line = dev->res->pixels_per_line;
 	dev->lines_per_frame = dev->res->lines_per_frame;
-- 
2.39.0

