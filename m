Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4D186B
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683981133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oH0GAqqmVpNU4oIRWmkkVKyuUl5Lvi3T95PMgNYG9CU=;
	b=d2Nihi6nNZJBhAH4GgzihqWoYVJkp3VCGV+8OpFqqIuPLujwJ0USefj5MHikeAcVL5RzU6
	cChpy627XbCDlP/aw7ajW73pVPYhOcLZV7zCE3jmHAQo2V2KUZUq0zJsvt6NpwU6VeOKl2
	LbsARvqHpKy+jzJ4Mldwgx4miUFhCoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-onVfNsQ0NT-5ZDPHu7ghFA-1; Sat, 13 May 2023 08:32:09 -0400
X-MC-Unique: onVfNsQ0NT-5ZDPHu7ghFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E5E388B767;
	Sat, 13 May 2023 12:32:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA1C540C2077;
	Sat, 13 May 2023 12:32:07 +0000 (UTC)
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
Subject: [PATCH 04/30] media: atomisp: Drop atomisp_get_css_buf_type()
Date: Sat, 13 May 2023 14:31:33 +0200
Message-Id: <20230513123159.33234-5-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Since continuous mode has been removed, there no longer is the option for
separate capture output + viewfinder output streams at the same time.

So all buffers queued by userspace are now for the normal output stream,
remove atomisp_get_css_buf_type() and always use
IA_CSS_BUFFER_TYPE_OUTPUT_FRAME for buffers queued by userspace.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 29 +------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index a95c41d084c2..143ab78b003b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -342,24 +342,10 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-static int atomisp_get_css_buf_type(struct atomisp_sub_device *asd,
-				    enum ia_css_pipe_id pipe_id,
-				    uint16_t source_pad)
-{
-	if (pipe_id == IA_CSS_PIPE_ID_COPY ||
-	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE ||
-	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO ||
-	    (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
-	     asd->run_mode->val != ATOMISP_RUN_MODE_VIDEO))
-		return IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
-	else
-		return IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME;
-}
-
 /* queue all available buffers to css */
 int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 {
-	enum ia_css_buffer_type buf_type;
+	const enum ia_css_buffer_type buf_type = IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
 	enum ia_css_pipe_id css_capture_pipe_id = IA_CSS_PIPE_ID_NUM;
 	enum ia_css_pipe_id css_preview_pipe_id = IA_CSS_PIPE_ID_NUM;
 	enum ia_css_pipe_id css_video_pipe_id = IA_CSS_PIPE_ID_NUM;
@@ -400,9 +386,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (capture_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_capture_pipe_id,
-			       atomisp_subdev_source_pad(&capture_pipe->vdev));
 		input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
 
 		atomisp_q_video_buffers_to_css(asd, capture_pipe,
@@ -411,9 +394,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (vf_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_capture_pipe_id,
-			       atomisp_subdev_source_pad(&vf_pipe->vdev));
 		if (asd->stream_env[ATOMISP_INPUT_STREAM_POSTVIEW].stream)
 			input_stream_id = ATOMISP_INPUT_STREAM_POSTVIEW;
 		else
@@ -425,10 +405,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (preview_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_preview_pipe_id,
-			       atomisp_subdev_source_pad(&preview_pipe->vdev));
-
 		if (css_preview_pipe_id == IA_CSS_PIPE_ID_YUVPP)
 			input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
 		else if (asd->stream_env[ATOMISP_INPUT_STREAM_PREVIEW].stream)
@@ -442,9 +418,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (video_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_video_pipe_id,
-			       atomisp_subdev_source_pad(&video_pipe->vdev));
 		if (asd->stream_env[ATOMISP_INPUT_STREAM_VIDEO].stream)
 			input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
 		else
-- 
2.40.1

