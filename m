Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73CB7C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655149914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HvMLRoTK6rxSlVUrDF+p0yNYtkvPQrEiYM+HRir/9c=;
	b=BiqGAjkXxDiu+780c+GZTAy9a+mpDGg0S4t7olADfT0oX1kUQsH8i7vcxUzXkbXgMM4pAf
	gbnPeOBsH7vKmiwA2XbdUMGTE9yuwCGy68xPVJ0hAayeJ0sdZVXxvelQII8FhpkF2Q4bXW
	C+fAEOMcnLd7ooZ/a24pQBJAef10vpg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-NbigGoTfNNW_FJsHhVoLfQ-1; Mon, 13 Jun 2022 15:51:50 -0400
X-MC-Unique: NbigGoTfNNW_FJsHhVoLfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A61E801755;
	Mon, 13 Jun 2022 19:51:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 753F42166B26;
	Mon, 13 Jun 2022 19:51:48 +0000 (UTC)
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
	linux-staging@lists.linux.dev
Subject: [PATCH 06/40] media: atomisp: drop IA_CSS_FRAME_FORMAT_MIPI support from ia_css_frame_init_planes()
Date: Mon, 13 Jun 2022 21:51:03 +0200
Message-Id: <20220613195137.8117-7-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

Nothing ever sets the format to IA_CSS_FRAME_FORMAT_MIPI and
frame_init_mipi_plane() is the only code-path which ever sets
frame->contiguous to true.

Drop A_CSS_FRAME_FORMAT_MIPI support from ia_css_frame_init_planes()
as part of the removal of contiguous alloc support from the frame code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/pci/runtime/frame/src/frame.c     | 30 ++-----------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index af23fbb831d6..cb0b579fbadf 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -48,12 +48,6 @@ static void frame_init_raw_single_plane(
     unsigned int subpixels_per_line,
     unsigned int bits_per_pixel);
 
-static void frame_init_mipi_plane(struct ia_css_frame *frame,
-				  struct ia_css_frame_plane *plane,
-				  unsigned int height,
-				  unsigned int subpixels_per_line,
-				  unsigned int bytes_per_pixel);
-
 static void frame_init_nv_planes(struct ia_css_frame *frame,
 				 unsigned int horizontal_decimation,
 				 unsigned int vertical_decimation,
@@ -297,11 +291,9 @@ int ia_css_frame_init_planes(struct ia_css_frame *frame)
 
 	switch (frame->info.format) {
 	case IA_CSS_FRAME_FORMAT_MIPI:
-		frame_init_mipi_plane(frame, &frame->planes.raw,
-				      frame->info.res.height,
-				      frame->info.padded_width,
-				      frame->info.raw_bit_depth <= 8 ? 1 : 2);
-		break;
+		dev_err(atomisp_dev,
+			"%s: unexpected use of IA_CSS_FRAME_FORMAT_MIPI\n", __func__);
+		return -EINVAL;
 	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
 		frame_init_raw_single_plane(frame, &frame->planes.raw,
 					    frame->info.res.height,
@@ -622,22 +614,6 @@ static void frame_init_raw_single_plane(
 	return;
 }
 
-static void frame_init_mipi_plane(struct ia_css_frame *frame,
-				  struct ia_css_frame_plane *plane,
-				  unsigned int height,
-				  unsigned int subpixels_per_line,
-				  unsigned int bytes_per_pixel)
-{
-	unsigned int stride;
-
-	stride = subpixels_per_line * bytes_per_pixel;
-	frame->data_bytes = 8388608; /* 8*1024*1024 */
-	frame->valid = false;
-	frame->contiguous = true;
-	frame_init_plane(plane, subpixels_per_line, stride, height, 0);
-	return;
-}
-
 static void frame_init_nv_planes(struct ia_css_frame *frame,
 				 unsigned int horizontal_decimation,
 				 unsigned int vertical_decimation,
-- 
2.36.0

