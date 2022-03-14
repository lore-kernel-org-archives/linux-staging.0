Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DB7A
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647252949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yBBtuI6F18YPuS7YTSgGKI6xMx2O4uTZcjV3VPAgn7U=;
	b=gXh0EbreEoLL9OT6t8QhmaqwmUdgy8L/0J/dXQr7kDi57tG/n5/pRVRihhmVGgw0wm7CT4
	9mY7OfCDjpRkzQSxp+woZTAQkD5B/9enV7E7tbRdz2MxLLDe24A8CGsbbkLUd8N0EiaPwT
	Q8bNlGbmcKnfGcc2nucBJ7Ym9yAyEHg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-YQeAdOhmOyeUuGI8kVL1zw-1; Mon, 14 Mar 2022 06:15:45 -0400
X-MC-Unique: YQeAdOhmOyeUuGI8kVL1zw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8EEF3802AC4;
	Mon, 14 Mar 2022 10:15:44 +0000 (UTC)
Received: from kate-fedora.redhat.com (unknown [10.2.16.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4C874AE321;
	Mon, 14 Mar 2022 10:15:41 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hdegoede@redhat.com,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 1/2] staging: media: ipu3: Fix AF x_start position when rightmost stripe is used
Date: Mon, 14 Mar 2022 18:15:22 +0800
Message-Id: <20220314101523.129672-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

For the AF configuration, if the rightmost stripe is used, the AF scene
will be at the incorrect location of the sensor.

The AF coordinate may be set to the right part of the sensor. This
configuration would lead to x_start being greater than the
down_scaled_stripes offset and the leftmost stripe would be disabled
and only the rightmost stripe is used to control the AF coordinate. If
the x_start doesn't perform any adjustments, the AF coordinate will be
at the wrong place of the sensor since down_scaled_stripes offset
would be the new zero of the coordinate system.

In this patch, if only the rightmost stripe is used, x_start should
minus down_scaled_stripes offset to maintain its correctness of AF
scene coordinate.

Changes in v2:
1. Remove the setting of the first stripe.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index d9e3c3785075..5a8c07f34756 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -2556,6 +2556,10 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
 		/* Enable only for rightmost stripe, disable left */
 		acc->af.stripes[0].grid_cfg.y_start &=
 			~IPU3_UAPI_GRID_Y_START_EN;
+		acc->af.stripes[1].grid_cfg.x_start -=
+			acc->stripe.down_scaled_stripes[1].offset;
+		acc->af.stripes[1].grid_cfg.x_end -=
+			acc->stripe.down_scaled_stripes[1].offset;
 	} else if (acc->af.config.grid_cfg.x_end <=
 		   acc->stripe.bds_out_stripes[0].width - min_overlap) {
 		/* Enable only for leftmost stripe, disable right */
-- 
2.35.1

