Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9FE367
	for <linux-staging@lists.linux.dev>; Fri,  8 Apr 2022 10:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649414759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNGOrOLahpfdtq4Itt85bojNjsMMU06RvvV1e8kDRUw=;
	b=KiR3Z4b5IBkVLjsw0ODSFQR7FJM0TjPPtZ6BvyZNqo+q5sPrAEVR6FepKxCQ5orPJK/lhW
	irFNhfeKJy9mblMxM/iuSOG4T2Taq/OFAp4r8D3uZSufR4bCU9m/0cFAqJydDfY9a9rJlN
	SpPEc8xli7nsgcfiOABONCARDyiYyq0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-k_B2GAPqOK6ewssLM0W8uw-1; Fri, 08 Apr 2022 06:45:55 -0400
X-MC-Unique: k_B2GAPqOK6ewssLM0W8uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0074C3817493;
	Fri,  8 Apr 2022 10:45:55 +0000 (UTC)
Received: from kate-fedora.redhat.com (unknown [10.2.16.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2193440470D5;
	Fri,  8 Apr 2022 10:45:51 +0000 (UTC)
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
Subject: [PATCH v3] staging: media: ipu3: Fix AWB x_start position when rightmost stripe is used
Date: Fri,  8 Apr 2022 18:42:22 +0800
Message-Id: <20220408104222.13893-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2

An not calibrated x_start setting would result in an incorrect AWB grid
configuration on a sensor when only the rightmost stripe is used.

If the AWB grid coordinate is set to the rightmost stripe, for example,
x_start is greater than 640, the AWB grid will be at the rightmost edge of
the sensor. The AWB statistic will be fetched from the wrong place of the
sensor and results in an incorrect AWB estimation result. Therefore,
stripe offset should subtract from x_start to have a correct grid
configuration for the rightmost stripe.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index f84cf11358a8..76ad802d694e 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -2636,6 +2636,17 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
 	    acc->stripe.down_scaled_stripes[1].offset + min_overlap) {
 		/* Enable only for rightmost stripe, disable left */
 		acc->awb.stripes[0].rgbs_thr_b &= ~IPU3_UAPI_AWB_RGBS_THR_B_EN;
+
+		acc->awb.stripes[1].grid.x_start =
+			(acc->awb.stripes[1].grid.x_start -
+			 acc->stripe.down_scaled_stripes[1].offset) &
+			IPU3_UAPI_GRID_START_MASK;
+
+		b_w_log2 = acc->awb.stripes[1].grid.block_width_log2;
+		acc->awb.stripes[1].grid.x_end =
+			imgu_css_grid_end(acc->awb.stripes[1].grid.x_start,
+					  acc->awb.stripes[1].grid.width,
+					  b_w_log2);
 	} else if (acc->awb.config.grid.x_end <=
 		   acc->stripe.bds_out_stripes[0].width - min_overlap) {
 		/* Enable only for leftmost stripe, disable right */
-- 
2.35.1

