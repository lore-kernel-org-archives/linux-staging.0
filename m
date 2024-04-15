Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EDA6994C
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182574; cv=none; b=CZJ/NJc3UBt+T6foKBYRu3dGa/mT5S/qi0cM/2FMqm8/9F3CxYaPZYh9Jhm69MP5cvJ7it8FzgvA8OyzUlt+P3ksLph2cLgQ3KXgcIEnre3+ngbPGWybLnDcKyfa9wXR88APcnWMf0Zq9YatXMsdtfSGIfLlsPcMzcekAwbO+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182574; c=relaxed/simple;
	bh=8abwr+b3L1AaVGNNdHGX2GedwzaDTMXGCg2UGiHzzKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvhBZl0Qnz5ywCm/3r835+QIEJuwfdfDW5Sjq0iV9jmML/P98XhXmJ7PVpqy+bnZK6tXWeWjyGlcJwCnXoHUOy782edexhJU2kELQDsTLLVJZ4NZA7hF14Sq/keUmZ9+ZiBjuNenOH1FZgNTojWAoPJB2OHu2iTNvRP0uvCltFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/lQIPwL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/lQIPwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjnGO37/1HmO/T1PUaHWC4oTgJQkZ4oUbzDCgOMCbEE=;
	b=Q/lQIPwLwdmsL3NgivfdzwlP36ayaVltr0lbBUlVS94qLMis/oGy1TQIu+YsFbAuvHYr6W
	TVBPsNE8TZut62j6MefFvzn866d1OWJ+TMeJLRL+sWjzBv7dr0vfbcLSaH2hM76kbD0+eo
	gY7qzWLMOYuf5DrvZBCWg4brQtYT0/k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-yUjjsIzLNn-pcdUxDmFnJA-1; Mon,
 15 Apr 2024 08:02:47 -0400
X-MC-Unique: yUjjsIzLNn-pcdUxDmFnJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E2D928C97C7;
	Mon, 15 Apr 2024 12:02:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5FB6C13FA2;
	Mon, 15 Apr 2024 12:02:45 +0000 (UTC)
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
Subject: [PATCH 09/23] media: atomisp: Drop atomisp_pipe_check() from atomisp_link_setup()
Date: Mon, 15 Apr 2024 14:02:06 +0200
Message-ID: <20240415120220.219480-10-hdegoede@redhat.com>
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

The media-controller core (__media_entity_setup_link()) already checks
that the pads of the link are not streaming before calling the setup_link()
pad-op so calling atomisp_pipe_check() is not necessary;

and taking isp->mutex inside the setup_link() pad-op leads to a possible
ABBA deadlock vs the media-device graph_mutex which in the case of
the setup_link() pad-op is taken before calling the op, while in other
scenarios the graph_mutex is taken after the isp->mutex.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 53225958c23b..1bb33460210c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -644,7 +644,7 @@ static int atomisp_link_setup(struct media_entity *entity,
 					      entity);
 	struct atomisp_sub_device *asd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = asd->isp;
-	int i, ret;
+	int i;
 
 	/* ISP's source is immutable */
 	if (local != &asd->pads[ATOMISP_SUBDEV_PAD_SINK]) {
@@ -663,12 +663,6 @@ static int atomisp_link_setup(struct media_entity *entity,
 		return -EINVAL;
 	}
 
-	mutex_lock(&isp->mutex);
-	ret = atomisp_pipe_check(&asd->video_out, true);
-	mutex_unlock(&isp->mutex);
-	if (ret)
-		return ret;
-
 	/* Turn off the sensor on link disable */
 	if (!(flags & MEDIA_LNK_FL_ENABLED)) {
 		atomisp_s_sensor_power(isp, i, 0);
-- 
2.44.0

