Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625661F8ACA
	for <linux-staging@lists.linux.dev>; Sat, 17 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482189; cv=none; b=jsxxAPUoPjbxyuV0MkNAzO8JUcHM2b91dV5lMURyECzMBwCCX6stjnsBjGD/3sD0XINWdMuWXopyQg3Wgd3Akk9SlSwUk2ZsSvbzg4fst6clfBAwaHFfzG2FSZYnml9UI33z6qaOV2CIRjFPlkNWK89fuLiPaaprgPW6tjruV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482189; c=relaxed/simple;
	bh=Uo1NbIe2rVo/tMnsMhmSJefmiidzCKqLWgwf6epA0YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWsq+MPWF3QMZI2n2YpywC3/5MMnjTMEGc/ZXmmkCI0hgwO/5D4D3016s77EO9fTJ4VHUkn/QBb+6YEK+Zi451SszA9gg5lnCn+daZvslEDHU4dxxUcXxqVXa1CNN/sCKveFNnrFIVAB6r9W8MALyqQsPBO2rXblc3TNvSVnS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCRVU746; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCRVU746"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gf3S86fEkFcj7atUEt6E90ECcJDpWZD+FLQw+yK5qVI=;
	b=CCRVU7465vMpsHlQXzFKmujgL70dwI89IZ/8HCUu8ifAvKb4LuaM6cy+gawKV0dNtAXvZ1
	3W6JPlgI0L0itE25Myj02E+KugueCAl248n7KGtMnckgTUDZbCJmBHdXivOaXsI23UAFt4
	E6ea2+DKjt82YmaN56Id/oZgZkFgl2w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-hDG4P0zEOcy4z-kGPSHgaw-1; Sat,
 17 May 2025 07:43:02 -0400
X-MC-Unique: hDG4P0zEOcy4z-kGPSHgaw-1
X-Mimecast-MFC-AGG-ID: hDG4P0zEOcy4z-kGPSHgaw_1747482181
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BE9C1956096;
	Sat, 17 May 2025 11:43:01 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD27418003FC;
	Sat, 17 May 2025 11:42:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 19/23] media: atomisp: gc0310: Move and rename suspend/resume functions
Date: Sat, 17 May 2025 13:41:02 +0200
Message-ID: <20250517114106.43494-20-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move the suspend()/resume() functions to above gc0310_detect() and rename
the functions to power_off()/power_on().

No functional changes, this is a preparation patch for reworking
the runtime-pm handling in probe() and remove().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 51 ++++++++++---------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 5936e25fb8c7..9532114d6139 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -398,6 +398,30 @@ static int gc0310_set_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int gc0310_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
+
+	gpiod_set_value_cansleep(sensor->powerdown, 1);
+	gpiod_set_value_cansleep(sensor->reset, 1);
+	return 0;
+}
+
+static int gc0310_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
+
+	fsleep(10000);
+	gpiod_set_value_cansleep(sensor->reset, 0);
+	fsleep(10000);
+	gpiod_set_value_cansleep(sensor->powerdown, 0);
+	fsleep(10000);
+
+	return 0;
+}
+
 static int gc0310_detect(struct gc0310_device *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
@@ -779,31 +803,8 @@ static int gc0310_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int gc0310_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct gc0310_device *sensor = to_gc0310_sensor(sd);
-
-	gpiod_set_value_cansleep(sensor->powerdown, 1);
-	gpiod_set_value_cansleep(sensor->reset, 1);
-	return 0;
-}
-
-static int gc0310_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct gc0310_device *sensor = to_gc0310_sensor(sd);
-
-	fsleep(10000);
-	gpiod_set_value_cansleep(sensor->reset, 0);
-	fsleep(10000);
-	gpiod_set_value_cansleep(sensor->powerdown, 0);
-	fsleep(10000);
-
-	return 0;
-}
-
-static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_suspend, gc0310_resume, NULL);
+static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_power_off,
+				 gc0310_power_on, NULL);
 
 static const struct acpi_device_id gc0310_acpi_match[] = {
 	{"INT0310"},
-- 
2.49.0

