Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FB3FE1
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655326313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vSAsrM+hFx8B6motayZDO4RQOz+UShtXoPBZCx2Q4U=;
	b=PFV2w0ihtudxrYYuYVb7v93rrpEUWOK3LEA5eAaFchUZpcIa1AnmhoTinhkMLpArpH1Xl2
	QgeanyWoPWLQlJK+neXBknMzy+XZOU1UZTeE1I2kX/0t5TACZp/y3zobGMMwC61BXwlZVo
	H1MNMYN8jAydPNSbbwFmIvzk+h0k9vU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-4peWi4y4PpKCXLdn_c2yQA-1; Wed, 15 Jun 2022 16:51:50 -0400
X-MC-Unique: 4peWi4y4PpKCXLdn_c2yQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 949E8382ECCD;
	Wed, 15 Jun 2022 20:51:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03380111F5;
	Wed, 15 Jun 2022 20:51:47 +0000 (UTC)
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
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 38/40] media: atomisp: use atomisp_destroy_pipes_stream_force() in more places
Date: Wed, 15 Jun 2022 22:50:35 +0200
Message-Id: <20220615205037.16549-39-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5

Use atomisp_destroy_pipes_stream_force() in 4 more places,
instead of open coding it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 889ada3e5923..cc8bc3fd1f10 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -810,14 +810,7 @@ int atomisp_create_pipes_stream(struct atomisp_sub_device *asd)
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd)
 {
-	struct atomisp_device *isp = asd->isp;
-
-	if (__destroy_streams(asd, true))
-		dev_warn(isp->dev, "destroy stream failed.\n");
-
-	if (__destroy_pipes(asd, true))
-		dev_warn(isp->dev, "destroy pipe failed.\n");
-
+	atomisp_destroy_pipes_stream_force(asd);
 	return atomisp_create_pipes_stream(asd);
 }
 
@@ -1166,8 +1159,7 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 	return 0;
 
 start_err:
-	__destroy_streams(asd, true);
-	__destroy_pipes(asd, true);
+	atomisp_destroy_pipes_stream_force(asd);
 
 	/* css 2.0 API limitation: ia_css_stop_sp() could be only called after
 	 * destroy all pipes
@@ -2072,13 +2064,8 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 	unsigned long irqflags;
 	unsigned int i;
 
-	/* if is called in atomisp_reset(), force destroy stream */
-	if (__destroy_streams(asd, true))
-		dev_err(isp->dev, "destroy stream failed.\n");
-
-	/* if is called in atomisp_reset(), force destroy all pipes */
-	if (__destroy_pipes(asd, true))
-		dev_err(isp->dev, "destroy pipes failed.\n");
+	/* if is called in atomisp_reset(), force destroy streams and pipes */
+	atomisp_destroy_pipes_stream_force(asd);
 
 	atomisp_init_raw_buffer_bitmap(asd);
 
@@ -2658,8 +2645,7 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 	return 0;
 
 get_info_err:
-	__destroy_streams(asd, true);
-	__destroy_pipes(asd, true);
+	atomisp_destroy_pipes_stream_force(asd);
 	return -EINVAL;
 }
 
-- 
2.36.0

