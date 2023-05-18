Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3A321069
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684423956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQpbnMptJb6odDEC/or4lzJKM409r5z1A+o7C2M7BWM=;
	b=ECuyjT7LM9A+v7fK9CPTzGvgrTaHop7xs/gx7RatD9F6H+E30wF7O1gFmvtBqU7UL5Xz+A
	xYFQkXSpGvYCVmOSptDmE3t9l2I9lCUhyS1I3mpKuT3UJhplAi3eZpIWLGzowCmo5qUYst
	RBUo7AVzM6V09hfBbdBSPxskhtHydWQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-ijVm0HdYOlmn4drJFiqYhg-1; Thu, 18 May 2023 11:32:30 -0400
X-MC-Unique: ijVm0HdYOlmn4drJFiqYhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4856867959;
	Thu, 18 May 2023 15:32:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66AF14078908;
	Thu, 18 May 2023 15:32:27 +0000 (UTC)
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
Subject: [PATCH 7/9] media: atomisp: gc0310: Remove gc0310_s_config() function
Date: Thu, 18 May 2023 17:32:12 +0200
Message-Id: <20230518153214.194976-8-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
References: <20230518153214.194976-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

gc0310_s_config() used to call camera_sensor_platform_data.csi_cfg() back
when the gc0310 driver was still using the atomisp_gmin_platform code
for power-management.

Now it is just a weirdly named wrapper around gc0310_detect(), drop
gc0310_s_config() and make probe() call gc0310_detect() directly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 20 +++++--------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 35367d6efd2c..486ea7979c57 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -172,7 +172,10 @@ static int gc0310_detect(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
+	ret = pm_runtime_get_sync(&client->dev);
+	if (ret >= 0)
+		ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
+	pm_runtime_put(&client->dev);
 	if (ret < 0) {
 		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
 		return -ENODEV;
@@ -261,19 +264,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int gc0310_s_config(struct v4l2_subdev *sd)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret >= 0)
-		ret = gc0310_detect(client);
-
-	pm_runtime_put(&client->dev);
-	return ret;
-}
-
 static int gc0310_g_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_interval *interval)
 {
@@ -403,7 +393,7 @@ static int gc0310_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
 
-	ret = gc0310_s_config(&dev->sd);
+	ret = gc0310_detect(client);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
-- 
2.40.1

