Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0B6D1A7
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182587; cv=none; b=uuTmhBU2N4fXoKgRlS32TpxrcUR0lVHjkIuKQaY11mWQ4r/dgZFwh1LM+GxX1B4S/JImIQThs1yJzY3BGs4aoSqPjl83sqP7zMjGhHZRTLCVaNaGFKx05jjiyhBl7Ks7mHTW6nTOfDx6HTb++K5IB86H9sXwf4wzmJG66Dsfn1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182587; c=relaxed/simple;
	bh=5PiI2EAGhlCp5O7Mu/AfGmr2NBv2RumY+w+9GqUDSYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Op6nejej7Xm95/DqZKbpKcqqthpj/MOM4fSF7Kg6zqza9UG2Gdj7zpi7ycajvdoYdsoBakcqT1rwRUUPqMJauVA0p8hhhHG7V4+gkd7snkmJs7aUP4kejdvmSRU7WhyH7iblzBiTuBvN7HNxjlrmVXl4dGj4KFdxuKjGRpYrLGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cu4OP95+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cu4OP95+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEtlZak3Z40jh25+hruqW/khfsHk4/m1Rl4X63tPTWk=;
	b=cu4OP95+pH7buxiheWfv7bzrzxMpLtb3WdA25uwMeipf+rXo9/Rt/zvzC/THnngmVLyJNY
	TUSmnPOG8KKu8ZTb3mx8X8bmwEy8+i65xMd1GrSps3lPf2yyoLGtvz2IYUhrzWDQ2OmqmN
	mfLQCmufOujl5uUm50mS4RvLL8vKLo4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-Y1TUjfGsNS-jBsi8kihbSQ-1; Mon, 15 Apr 2024 08:03:03 -0400
X-MC-Unique: Y1TUjfGsNS-jBsi8kihbSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C265810431;
	Mon, 15 Apr 2024 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA82FC13FA1;
	Mon, 15 Apr 2024 12:03:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 20/23] media: atomisp: Remove empty s_power() op from ISP subdev
Date: Mon, 15 Apr 2024 14:02:17 +0200
Message-ID: <20240415120220.219480-21-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Remove the empty isp_subdev_set_power() callback.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 1bb33460210c..3a3e84a035e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -149,18 +149,6 @@ static long isp_subdev_ioctl(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/*
- * isp_subdev_set_power - Power on/off the CCDC module
- * @sd: ISP V4L2 subdevice
- * @on: power on/off
- *
- * Return 0 on success or a negative error code otherwise.
- */
-static int isp_subdev_set_power(struct v4l2_subdev *sd, int on)
-{
-	return 0;
-}
-
 static int isp_subdev_subscribe_event(struct v4l2_subdev *sd,
 				      struct v4l2_fh *fh,
 				      struct v4l2_event_subscription *sub)
@@ -596,7 +584,7 @@ static int isp_subdev_set_format(struct v4l2_subdev *sd,
 
 /* V4L2 subdev core operations */
 static const struct v4l2_subdev_core_ops isp_subdev_v4l2_core_ops = {
-	.ioctl = isp_subdev_ioctl, .s_power = isp_subdev_set_power,
+	.ioctl = isp_subdev_ioctl,
 	.subscribe_event = isp_subdev_subscribe_event,
 	.unsubscribe_event = isp_subdev_unsubscribe_event,
 };
-- 
2.44.0

