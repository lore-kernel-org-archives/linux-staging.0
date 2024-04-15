Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7167A0E
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182563; cv=none; b=lJosLuN0ATd9X9yZyYTvOkePWO5tKac0iuZygEjlbCVG54ks0FC/V+cGYMPXobdqMPHbS77ShdqTG08rpAPeV9XxMUV8K6o/nrEShxMT7tudWdDhcer2YXB5LD5snAO/2qD/WbP8OJJpIb2NISCSdEmkPlklR1X5GiBBLPH40wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182563; c=relaxed/simple;
	bh=0ng/Uh2IiF1+biK7I3jkErPf2zT5My7sZKgxs9kxcCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HO+j4HfmAUBXFuNHKjhnibyrUVF5z4TLUrkiPvZbAivT9/XtYYk4fxaBn+864AtfDVbiLhZjRAfqdvXj9r242KbpcQ+lEYbSAv1feEbjewPo1nqzjz98dXA1fz4Z791RFH6gNA1CGeJ5YDcbNgJyXFF+ZNjX3z/9tfFmraUNhvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IF2D/Ldn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IF2D/Ldn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cctytGkP8WgnsEbgahTDeIrEPS2Ieg4avjV+z+utBcY=;
	b=IF2D/Ldn9yaJ+prcNmi7JT7QnTc7/kWX1nDQwzV6S/QT8lwnPpVOD9FhCioD9WXyyFuGG3
	bRPLqcRyy4k6H1aVZ5uQAZKxZu5cocY2370ibkzbfNa7ptOYAdeknxE5ZJ5ZrvyU+EIm/H
	w1YxGWgCjXpTjGHPf+jdMMHNNCNgmdw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-OwGQZXbKPnOcxAmPNGF4zw-1; Mon, 15 Apr 2024 08:02:37 -0400
X-MC-Unique: OwGQZXbKPnOcxAmPNGF4zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 205061049BC8;
	Mon, 15 Apr 2024 12:02:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE553C13FA2;
	Mon, 15 Apr 2024 12:02:35 +0000 (UTC)
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
Subject: [PATCH 02/23] media: atomisp: Turn on sensor power from atomisp_set_fmt()
Date: Mon, 15 Apr 2024 14:01:59 +0200
Message-ID: <20240415120220.219480-3-hdegoede@redhat.com>
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

ATM the atomisp driver does not call s_power() at all when no s_input
ioctl() is done by the application. This breaks older sensor drivers
which rely on s_power() for power-management.

Some drivers have worked around this, e.g. commit c5fafbadaeae ("media:
atomisp: gc0310: Power on sensor from set_fmt() callback") and
commit b3118a942c82 ("media: atomisp: ov2722: Power on sensor from
set_fmt() callback"), but this really should be fixed in the atomisp
driver itself, so that all old drivers can work.

A logical place to call s_power() would be from atomisp_start_streaming() /
atomisp_stop_streaming(). But some older drivers, e.g. the atomisp-ov2722
driver already write mode related registers on set_fmt() instead of waiting
on stream on. So the s_power(1) needs to happen at the first set_fmt().

Add an atomisp_s_sensor_power(..., 1) call just before calling set_fmt()
for this. If the power was already enabled through e.g. a s_input ioctl
atomisp_s_sensor_power() will skip calling the s_power() v4l2-subdev-op
a second time.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6b8ff9f1ae63..83a15a2d358e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3760,6 +3760,17 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	if (!input->camera)
 		return -EINVAL;
 
+	/*
+	 * Some old sensor drivers already write the registers on set_fmt
+	 * instead of on stream on, power on the sensor now (on newer
+	 * sensor drivers the s_power op is a no-op).
+	 */
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ret = atomisp_s_sensor_power(isp, isp->asd.input_curr, 1);
+		if (ret)
+			return ret;
+	}
+
 	sd_state = (which == V4L2_SUBDEV_FORMAT_TRY) ? input->try_sd_state :
 						       input->camera->active_state;
 	if (sd_state)
-- 
2.44.0

