Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FED2107A
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684423946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxV8KVIKHlEgmg3dCfW2L8bUk1uiBPvCDIyn7VgJ5O4=;
	b=ImQuHmxTctQn3+Ma8HrmPtqYFuO1fbeCTboCq67VITETRbU10NztK/8kg5MK/cg3fJzZYn
	vkALAaiKI1DWsrScsyErLp/d+LxB6KxDQFBioCnHbfe6j+W06T6OCputlxMjqpiu5jL/z1
	a1D4a8s165aE6KuGAnvPp4IwVaSAeV0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-KTKkyC18OS6YyHLg6QyG2Q-1; Thu, 18 May 2023 11:32:22 -0400
X-MC-Unique: KTKkyC18OS6YyHLg6QyG2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F04EF3801F4D;
	Thu, 18 May 2023 15:32:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7339B407890A;
	Thu, 18 May 2023 15:32:20 +0000 (UTC)
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
Subject: [PATCH 3/9] media: atomisp: gc0310: Turn into standard v4l2 sensor driver
Date: Thu, 18 May 2023 17:32:08 +0200
Message-Id: <20230518153214.194976-4-hdegoede@redhat.com>
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

Switch the atomisp-gc0310 driver to v4l2 async device registration.

After this change this driver no longer depends on
atomisp_gmin_platform and all atomisp-isms are gone.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 7 ++-----
 drivers/staging/media/atomisp/i2c/gc0310.h         | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index de7de1765e6b..1db9580fca78 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -35,7 +35,6 @@
 #include <media/v4l2-acpi.h>
 #include <media/v4l2-device.h>
 #include <linux/io.h>
-#include "../include/linux/atomisp_gmin_platform.h"
 
 #include "gc0310.h"
 
@@ -374,8 +373,7 @@ static void gc0310_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "gc0310_remove...\n");
 
-	atomisp_unregister_subdev(sd);
-	v4l2_device_unregister_subdev(sd);
+	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
 	pm_runtime_disable(&client->dev);
@@ -434,8 +432,7 @@ static int gc0310_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = atomisp_register_sensor_no_gmin(&dev->sd, 1, ATOMISP_INPUT_FORMAT_RAW_8,
-					      atomisp_bayer_order_grbg);
+	ret = v4l2_async_register_subdev_sensor(&dev->sd);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index d40406289598..b5200a9c08a2 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -31,8 +31,6 @@
 #include <linux/v4l2-mediabus.h>
 #include <media/media-entity.h>
 
-#include "../include/linux/atomisp_platform.h"
-
 #define GC0310_NATIVE_WIDTH			656
 #define GC0310_NATIVE_HEIGHT			496
 
-- 
2.40.1

