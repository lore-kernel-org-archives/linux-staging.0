Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80B7483
	for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691847395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RNX1BzU+T+Xz8IH6oydVygmv3wQ30NXpfy0+avjdd1o=;
	b=M/lI4kGxBbkYfELLcM+zjhLE4nyLPH3vtq9Kqm+CDH+a8KzMy9R2lc0+v2XN5Hz6WbhKO1
	B9dDvuqlLyoFUsnK7WFjVzURKeEa4JVfErYOPEbS8+AdRqys/yYI66OsenyxLjSPaLkae5
	g0zQss0jlhq0k0dkxCmOQVnRIQTuRb4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-6BDpPCMWNByBlATOG1kmPw-1; Sat, 12 Aug 2023 09:36:31 -0400
X-MC-Unique: 6BDpPCMWNByBlATOG1kmPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06E3E85CBE0;
	Sat, 12 Aug 2023 13:36:31 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C0F15CC9A;
	Sat, 12 Aug 2023 13:36:29 +0000 (UTC)
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
Subject: [PATCH] media: gc0310: Stop setting v4l2_subdev.fwnode to the endpoint fwnode
Date: Sat, 12 Aug 2023 15:36:28 +0200
Message-ID: <20230812133628.355812-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Endpoint matching is now handled by the v4l2-core and drivers no longer
should set v4l2_subdev.fwnode to the endpoint fwnode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 9a11793f34f7..c438accb0472 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -83,7 +83,6 @@ struct gc0310_device {
 	struct mutex input_lock;
 	bool is_streaming;
 
-	struct fwnode_handle *ep_fwnode;
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
 
@@ -599,37 +598,37 @@ static void gc0310_remove(struct i2c_client *client)
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
 	mutex_destroy(&dev->input_lock);
-	fwnode_handle_put(dev->ep_fwnode);
 	pm_runtime_disable(&client->dev);
 }
 
 static int gc0310_probe(struct i2c_client *client)
 {
+	struct fwnode_handle *ep_fwnode;
 	struct gc0310_device *dev;
 	int ret;
 
-	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev)
-		return -ENOMEM;
-
 	/*
 	 * Sometimes the fwnode graph is initialized by the bridge driver.
 	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
 	 */
-	dev->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
-	if (!dev->ep_fwnode)
+	ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
+	if (!ep_fwnode)
 		return dev_err_probe(&client->dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
 
+	fwnode_handle_put(ep_fwnode);
+
+	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
 	dev->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dev->reset)) {
-		fwnode_handle_put(dev->ep_fwnode);
 		return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
 				     "getting reset GPIO\n");
 	}
 
 	dev->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(dev->powerdown)) {
-		fwnode_handle_put(dev->ep_fwnode);
 		return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown),
 				     "getting powerdown GPIO\n");
 	}
@@ -652,7 +651,6 @@ static int gc0310_probe(struct i2c_client *client)
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	dev->sd.fwnode = dev->ep_fwnode;
 
 	ret = gc0310_init_controls(dev);
 	if (ret) {
-- 
2.41.0

