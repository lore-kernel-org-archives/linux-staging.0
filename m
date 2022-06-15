Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A453D99
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 20:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655326249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaSjhZnwVRNF58VVg3QSOIwQoMpatxpTHzRWRHTMgfg=;
	b=DMsKnPQT3fgK8J+eqGRX14e7XVEjSETcnp/QxFSGYrDka0O1uNWh6vv0HawSiQa0HlHj+w
	qSvlRI+is6tOocZ4ObNiZsq7jz+N3nl2E5M7DGVwVD95VArW9+URt4CCsqO3WKn9ZowEcs
	f6FCXtCBz12UvtELV3feAlmzTs/ENaA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-U2Y5Qo3rPE2JABKw-wdljg-1; Wed, 15 Jun 2022 16:50:46 -0400
X-MC-Unique: U2Y5Qo3rPE2JABKw-wdljg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E7D23C10221;
	Wed, 15 Jun 2022 20:50:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D57D111F5;
	Wed, 15 Jun 2022 20:50:43 +0000 (UTC)
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
Subject: [PATCH v2 03/40] media: atomisp: drop contiguous argument from ia_css_frame_allocate_with_buffer_size()
Date: Wed, 15 Jun 2022 22:50:00 +0200
Message-Id: <20220615205037.16549-4-hdegoede@redhat.com>
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

Drop the contiguous argument from ia_css_frame_allocate_with_buffer_size()
its only caller always passes false.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/pci/runtime/frame/interface/ia_css_frame.h    | 7 ++-----
 .../staging/media/atomisp/pci/runtime/frame/src/frame.c   | 8 +++-----
 drivers/staging/media/atomisp/pci/sh_css_mipi.c           | 3 +--
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
index c756a134efc3..700070c58eda 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
@@ -109,16 +109,13 @@ void ia_css_frame_free_multiple(unsigned int num_frames,
  *
  * @param	frame	The allocated frame.
  * @param[in]	size_bytes	The frame size in bytes.
- * @param[in]	contiguous	Allocate memory physically contiguously or not.
  * @return	The error code.
  *
  * Allocate a frame using the given size in bytes.
  * The frame structure is partially null initialized.
  */
-int ia_css_frame_allocate_with_buffer_size(
-    struct ia_css_frame **frame,
-    const unsigned int size_bytes,
-    const bool contiguous);
+int ia_css_frame_allocate_with_buffer_size(struct ia_css_frame **frame,
+					   const unsigned int size_bytes);
 
 /* @brief Check whether 2 frames are same type
  *
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 1d8017fc3f70..7a119d2c9256 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -486,16 +486,14 @@ void ia_css_frame_free_multiple(unsigned int num_frames,
 	}
 }
 
-int ia_css_frame_allocate_with_buffer_size(
-    struct ia_css_frame **frame,
-    const unsigned int buffer_size_bytes,
-    const bool contiguous)
+int ia_css_frame_allocate_with_buffer_size(struct ia_css_frame **frame,
+					   const unsigned int buffer_size_bytes)
 {
 	/* AM: Body coppied from frame_allocate_with_data(). */
 	int err;
 	struct ia_css_frame *me = frame_create(0, 0,
 					       IA_CSS_FRAME_FORMAT_NUM,/* Not valid format yet */
-					       0, 0, contiguous, false);
+					       0, 0, false, false);
 
 	if (!me)
 		return -ENOMEM;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 0acf75497ae7..bc6e8598a776 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -431,8 +431,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 				/* allocate new frame */
 				err = ia_css_frame_allocate_with_buffer_size(
 					  &my_css.mipi_frames[port][i],
-					  my_css.mipi_frame_size[port] * HIVE_ISP_DDR_WORD_BYTES,
-					  false);
+					  my_css.mipi_frame_size[port] * HIVE_ISP_DDR_WORD_BYTES);
 				if (err) {
 					for (j = 0; j < i; j++) {
 						if (my_css.mipi_frames[port][j]) {
-- 
2.36.0

