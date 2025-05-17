Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268BA1F5834
	for <linux-staging@lists.linux.dev>; Sat, 17 May 2025 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482171; cv=none; b=p6ugAScxUH/7ADBeH0PhSPPHxE37z0XPSWsF3sy8Xgm/iJ0z4nduHbtyVMPCKFl/hUPq2VSW6b27jk2umTsIwBBCte1aMWRn9qSpDNMexrYxBI28EN5xePk4lndJ/e803oDIQQH6ywiMQMYX8mVonEyuDaO85cbc0QKw+mRN9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482171; c=relaxed/simple;
	bh=Bwjrj7qYCnhh15bg0hlrNt4dtFfkqIHpQq5Og1RDDnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFLDREL94GXBnIYA7fraOqQZC4lyvcJfBLZ/CPeMk/jHGtdpypv9pernOEYJGlyB0MGlYzR99BD2S44gL78mIeWZZ742NiSa8vocL8AbP8YoYod+8anrnIjIjlJDUVQp+/zgzYrwODZV5fD6au5O3kC7aVfn2CClHRBkjdbggLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N6pNO1pJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N6pNO1pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIMJajLixwd4QF7Tp5+ILmU18vnNryBdxf1XjhLPF70=;
	b=N6pNO1pJYaz6COWapmMJAMFpEtf8NHDS2jRBQGOgb/AGb6tmWaxmU1Yd5Asikh3tQzhRPh
	XSukogN1LvJ4VbQ1vSD2ikQBQEYm4C9Ii4CgZMq/Ibc9UVZPCo0+CG39jNwIQES4c2yATL
	dg8netonn0h8cVQjiauouhNPbriAeic=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-Z18RjzsoNwGyg9HKYNWb6g-1; Sat,
 17 May 2025 07:42:47 -0400
X-MC-Unique: Z18RjzsoNwGyg9HKYNWb6g-1
X-Mimecast-MFC-AGG-ID: Z18RjzsoNwGyg9HKYNWb6g_1747482166
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 717BA18004A7;
	Sat, 17 May 2025 11:42:46 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6027E180045B;
	Sat, 17 May 2025 11:42:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 17/23] media: atomisp: gc0310: Use v4l2_subdev_get_fmt() as v4l2_subdev_pad_ops.get_fmt()
Date: Sat, 17 May 2025 13:41:00 +0200
Message-ID: <20250517114106.43494-18-hdegoede@redhat.com>
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

Now that the sd-state's fmt is properly initialized by
internal_ops.init_state(), the driver can be safely switched
to v4l2_subdev_get_fmt().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 7f655285bf62..a9d0afbbe7ef 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -390,18 +390,6 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int gc0310_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *format)
-{
-	struct gc0310_device *sensor = to_gc0310_sensor(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	fmt = gc0310_get_pad_format(sensor, sd_state, format->pad, format->which);
-	format->format = *fmt;
-	return 0;
-}
-
 static int gc0310_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
@@ -596,7 +584,7 @@ static const struct v4l2_subdev_video_ops gc0310_video_ops = {
 static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_mbus_code = gc0310_enum_mbus_code,
 	.enum_frame_size = gc0310_enum_frame_size,
-	.get_fmt = gc0310_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = gc0310_set_fmt,
 	.get_selection = gc0310_get_selection,
 	.set_selection = gc0310_set_selection,
-- 
2.49.0

