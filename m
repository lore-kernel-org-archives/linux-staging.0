Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784CA1CD23
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169094; cv=none; b=XPRg4RpN+1hyY74umXmnZc54vwLCl7HKe1CFmB1VYhgXK9cmkeGDzP8G7zMX+x5wQK8sD/Z6VcFnk2rUg1XTnBkAT/EpT3hbj2haF6QirLalIOghfl+dChjlXD9fLdQB4w1nSUnGMeL+h9muKNCcUJ2QLtN572x8p9dnhiy+6SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169094; c=relaxed/simple;
	bh=Yy6ZhQGvdwv9I5KaiJCZGMizUUFt3DwUeRFu/bhR6LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXOWPpgr2ok5/mnJ2T+rDHL3hYbaf66gDs+sEXXHOp0h1eszSvs/h0q0iblqjdDKT3D9HhHywt7ICT45BLX1ZOK/PLwlWRJ9Kr0/Q7AJyDaKCAlz1hdPq/rVK8WdCvZ7qpJ3Lf0KZETF0uvz+L4RC3De7vuPsMRt396bYz/pYQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LF9QjLvG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LF9QjLvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxtKH/IxVhZWhUh595joMazU/KxejBiOVioc+RVztLE=;
	b=LF9QjLvGTRGB/rE4xkvSYi2+puTyV4hNyAAk+/SiWmLhlNbEWHv1sxtSuG4x49N9Y0cVEt
	2vAhUoeYhG9IyRH+P0z7fAIgJka0rSsPOwoA4L/OH6n/wz1k5wERW3qzdUlORyBjXuVDVB
	w+qXOZEFBK8ZREvZ618mx70+aRhhU5M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-PBD5ubZ6PBSumySnBg6Ggg-1; Sat,
 17 Feb 2024 06:24:47 -0500
X-MC-Unique: PBD5ubZ6PBSumySnBg6Ggg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3410A29AC005;
	Sat, 17 Feb 2024 11:24:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF1AF1C1C7E3;
	Sat, 17 Feb 2024 11:24:45 +0000 (UTC)
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
Subject: [PATCH 1/9] media: atomisp: Remove isp_subdev_propagate()
Date: Sat, 17 Feb 2024 12:24:30 +0100
Message-ID: <20240217112438.15240-2-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

isp_subdev_propagate() is a wrapper around atomisp_subdev_set_selection()
which gets only used in a single place.

Scall atomisp_subdev_set_selection() directly in that single place instead.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_subdev.c        | 38 ++++---------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index a87fc74159e2..8293bda0c681 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -287,35 +287,6 @@ static void isp_get_fmt_rect(struct v4l2_subdev *sd,
 	}
 }
 
-static void isp_subdev_propagate(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
-				 uint32_t flags)
-{
-	struct v4l2_mbus_framefmt *ffmt[ATOMISP_SUBDEV_PADS_NUM];
-	struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
-		       *comp[ATOMISP_SUBDEV_PADS_NUM];
-
-	if (flags & V4L2_SEL_FLAG_KEEP_CONFIG)
-		return;
-
-	isp_get_fmt_rect(sd, sd_state, which, ffmt, crop, comp);
-
-	switch (pad) {
-	case ATOMISP_SUBDEV_PAD_SINK: {
-		struct v4l2_rect r = {0};
-
-		/* Only crop target supported on sink pad. */
-		r.width = ffmt[pad]->width;
-		r.height = ffmt[pad]->height;
-
-		atomisp_subdev_set_selection(sd, sd_state, which, pad,
-					     target, flags, &r);
-		break;
-	}
-	}
-}
-
 static int isp_subdev_get_selection(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
@@ -541,6 +512,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 	case ATOMISP_SUBDEV_PAD_SINK: {
 		const struct atomisp_in_fmt_conv *fc =
 		    atomisp_find_in_fmt_conv(ffmt->code);
+		struct v4l2_rect r = {};
 
 		if (!fc) {
 			fc = atomisp_in_fmt_conv;
@@ -551,8 +523,12 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 
 		*__ffmt = *ffmt;
 
-		isp_subdev_propagate(sd, sd_state, which, pad,
-				     V4L2_SEL_TGT_CROP, 0);
+		/* Propagate new ffmt to selection */
+		r.width = ffmt->width;
+		r.height = ffmt->height;
+		/* Only crop target supported on sink pad. */
+		atomisp_subdev_set_selection(sd, sd_state, which, pad,
+					     V4L2_SEL_TGT_CROP, 0, &r);
 
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 			atomisp_css_input_set_resolution(isp_sd,
-- 
2.43.0

