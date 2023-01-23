Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A782F2E
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HH+W0THNcT4GdeR88h2fHJLU+YwmPYL4+jrMul1sU6g=;
	b=Zx646gKCpMAcTpy06RpBoLRuy1RSMDIlF7Qch8VDve2q/pBVmfsRZ4a6h520VFYDQUP/0K
	CXfC+QsOsblBAXKKeUvS4FlGSJvOqExoKrthAb88jKRXl8V5Uht5gd2TvmfBZrwSlK9/5C
	HwqbDt++rh36+3a/lX0ZXuqpgF4987I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-k06Z0fN2P8aVVBmzLVC8Mw-1; Mon, 23 Jan 2023 07:54:41 -0500
X-MC-Unique: k06Z0fN2P8aVVBmzLVC8Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 433D9800B30;
	Mon, 23 Jan 2023 12:54:41 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6026BC15BA0;
	Mon, 23 Jan 2023 12:54:38 +0000 (UTC)
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
Subject: [PATCH 51/57] media: atomisp: ov2722: Call atomisp_gmin_remove_subdev() on probe failure
Date: Mon, 23 Jan 2023 13:51:59 +0100
Message-Id: <20230123125205.622152-52-hdegoede@redhat.com>
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

Call atomisp_gmin_remove_subdev() on probe failure to properly free
the GPIOs and other resources acquired by the gmin_camera_platform_data()
call earlier.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index d819ab5de28a..d874e12da8cc 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -994,6 +994,7 @@ static int ov2722_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 
 out_free:
+	atomisp_gmin_remove_subdev(&dev->sd);
 	v4l2_device_unregister_subdev(&dev->sd);
 	kfree(dev);
 	return ret;
-- 
2.39.0

