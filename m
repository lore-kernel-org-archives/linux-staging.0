Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19093D8F
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680361211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9bxYclTLgvm2p4T7WEwjxdU7TdJiJQDYi5GQDLCCYE=;
	b=OkOn7p0GrPwv1UWCQuUM0Kpc+DbcEKPBZrwJJ1ujzpiJnpfdhpgF6AXI/+d+YvQRyiZx2O
	cjp3AfTQ7z5JvwYhaZDG/0/atHYaH/UkB7+XJuDoLQ/RLE4TuMgDNaywMRluwAFYakQpn4
	oFrhGZIrKdvvhrFGGRwBfb0qEyk+jfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-HpVyV5CePs6sIoRraTba6w-1; Sat, 01 Apr 2023 11:00:07 -0400
X-MC-Unique: HpVyV5CePs6sIoRraTba6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 664418533DD;
	Sat,  1 Apr 2023 15:00:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE9D8400F59;
	Sat,  1 Apr 2023 15:00:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 17/28] media: atomisp: gc0310: Use devm_kzalloc() for data struct
Date: Sat,  1 Apr 2023 16:59:15 +0200
Message-Id: <20230401145926.596216-18-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

Use devm_kzalloc() to allocate the data struct. It is always free-ed as
the last step of probe-error-exit or remove, so it can be devm-managed.

This will make unwinding things easier when support is added to the gc0310
code to use standard GPIO APIs instead of the custom atomisp_gmin code.

This also allows dropping the out_free label and use direct return
on errors.

This may seem like a functional change since the out_free label also
did a v4l2_device_unregister_subdev() but at the 1 changed return
the device is not registered yet, so that always is a no-op and can
be dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 1224213d4195..5016e0b65af1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -550,7 +550,7 @@ static int gc0310_probe(struct i2c_client *client)
 	int ret;
 	void *pdata;
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
@@ -561,10 +561,8 @@ static int gc0310_probe(struct i2c_client *client)
 	pdata = gmin_camera_platform_data(&dev->sd,
 					  ATOMISP_INPUT_FORMAT_RAW_8,
 					  atomisp_bayer_order_grbg);
-	if (!pdata) {
-		ret = -EINVAL;
-		goto out_free;
-	}
+	if (!pdata)
+		return -EINVAL;
 
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_enable(&client->dev);
@@ -598,10 +596,6 @@ static int gc0310_probe(struct i2c_client *client)
 		gc0310_remove(client);
 
 	return ret;
-out_free:
-	v4l2_device_unregister_subdev(&dev->sd);
-	kfree(dev);
-	return ret;
 }
 
 static int gc0310_suspend(struct device *dev)
-- 
2.39.1

