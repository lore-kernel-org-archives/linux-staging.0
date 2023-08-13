Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788C917C5
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691940421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=njCjOgKGgSzDsDd00HdB6fBX7QUAsffjlxT9ptgJNyY=;
	b=QBCSUp2QY16AbrA8qeBj8vkHooCzIAsw2eK7OaQUbwgqzKK4exnOBp4RQSTJzPVMlWwcW5
	qKkBx9qg6FMeGCNg6yXa3WACuzkaD2d5aOWCdnp+9LbSxbZHSleo+ikwKtoZeeUQHeO10o
	f6HC3j2RcFuxZHQHl/aBjARmulVKD2g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-Q-gFEzWYNEy8Yucy8BIVwA-1; Sun, 13 Aug 2023 11:26:55 -0400
X-MC-Unique: Q-gFEzWYNEy8Yucy8BIVwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F4DF85CBE6;
	Sun, 13 Aug 2023 15:26:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44D7FC15BAD;
	Sun, 13 Aug 2023 15:26:53 +0000 (UTC)
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
Subject: [PATCH 1/2] media: atomisp: Disable VCM for OV5693 for now
Date: Sun, 13 Aug 2023 17:26:44 +0200
Message-ID: <20230813152645.45834-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

ov5693 sensor modules have a VCM, but for unknown reasons
the sensor fails to start streaming when instantiating
a VCM i2c-client (and the runtime-pm link between VCM
and sensor).

Disable the VCM for now, until this is resolved.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 03940c11505f..2483eaeeac73 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -521,7 +521,12 @@ static char *atomisp_csi2_get_vcm_type(struct acpi_device *adev)
 }
 
 static const struct acpi_device_id atomisp_sensor_configs[] = {
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, true),	/* OV5693 */
+	/*
+	 * FIXME ov5693 modules have a VCM, but for unknown reasons
+	 * the sensor fails to start streaming when instantiating
+	 * an i2c-client for the VCM, so it is disabled for now.
+	 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
 	{}
 };
 
-- 
2.41.0

