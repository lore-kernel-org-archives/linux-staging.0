Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F42586
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661180787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41YpTOTgLvbZMPe5Zv7iSZk+AU334dF3rRHPZUnAho0=;
	b=LVyMoZukib7Pn7Lji1StcybBkGSPpi+BbLOyLkp7ajs9s0jXHfy77MexGXs2JjviSgiG/S
	ab3bnzUL1mnvNE3tQr6iAgSeROJ9oE0eVpjkNR3cWS1oe1yZrUCzAz9aEWRHKRSYRhbac/
	XhiEEXDMONHc8w+vvc1cjCGmlAC7tqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-Klnlu2O-MiG9IiMRDMsiMg-1; Mon, 22 Aug 2022 11:06:21 -0400
X-MC-Unique: Klnlu2O-MiG9IiMRDMsiMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88535802D2C;
	Mon, 22 Aug 2022 15:06:20 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AAE640CFD0A;
	Mon, 22 Aug 2022 15:06:18 +0000 (UTC)
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
Subject: [PATCH v2 03/13] media: atomisp-ov2680: Don't take the input_lock for try_fmt calls.
Date: Mon, 22 Aug 2022 17:06:00 +0200
Message-Id: <20220822150610.45186-3-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1

On ov2680_set_fmt() calls with format->which == V4L2_SUBDEV_FORMAT_TRY,
ov2680_set_fmt() does not talk to the sensor, so there is no need to
lock the dev->input_lock mutex in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index ab52e35266bb..9ac469878eea 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -841,8 +841,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	if (!ov2680_info)
 		return -EINVAL;
 
-	mutex_lock(&dev->input_lock);
-
 	res = v4l2_find_nearest_size(ov2680_res_preview,
 				     ARRAY_SIZE(ov2680_res_preview), width,
 				     height, fmt->width, fmt->height);
@@ -855,13 +853,14 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		sd_state->pads->try_fmt = *fmt;
-		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
 
 	dev_dbg(&client->dev, "%s: %dx%d\n",
 		__func__, fmt->width, fmt->height);
 
+	mutex_lock(&dev->input_lock);
+
 	/* s_power has not been called yet for std v4l2 clients (camorama) */
 	power_up(sd);
 	ret = ov2680_write_reg_array(client, dev->res->regs);
-- 
2.36.1

