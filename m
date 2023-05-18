Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF65D21069
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684423951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wq+JH4WYI5ojhlQMuUU9E11CnIEjq4jKTPta7tKeN8=;
	b=JhqiGFj+TQKjmsG/iC8thpj33JJemH3qPwxU44UebSMDOnntlVV7SrZLaOjzKx6t36HHQB
	KIlcT4976u/EAihNEHWgzSe/iDIqRCYzvhQhuq2CsGt6etbsTlIFWyS3Kb0aWF266C/6fz
	tr4c89FQKtn7Qfy15QK94xF4Oj/xC3I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-yAn-SG1pP_eLE_YSFV0V7Q-1; Thu, 18 May 2023 11:32:26 -0400
X-MC-Unique: yAn-SG1pP_eLE_YSFV0V7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78DB9282CCAC;
	Thu, 18 May 2023 15:32:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF4244078909;
	Thu, 18 May 2023 15:32:23 +0000 (UTC)
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
Subject: [PATCH 5/9] media: atomisp: gc0310: Fix double free in gc0310_remove()
Date: Thu, 18 May 2023 17:32:10 +0200
Message-Id: <20230518153214.194976-6-hdegoede@redhat.com>
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

gc0310_remove() must not call kfree(dev) since the gc0310_device struct
is devm managed so explicitly freeing it causes a double free.

While at it add a missing mutex_destroy() call for the input_lock.

Fixes: 340b4dd6c183 ("media: atomisp: gc0310: Use devm_kzalloc() for data struct")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 0d4d47af73ba..89f8c6cac581 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -376,8 +376,8 @@ static void gc0310_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
+	mutex_destroy(&dev->input_lock);
 	pm_runtime_disable(&client->dev);
-	kfree(dev);
 }
 
 static int gc0310_probe(struct i2c_client *client)
-- 
2.40.1

