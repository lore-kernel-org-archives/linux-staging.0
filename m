Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CA63B6
	for <linux-staging@lists.linux.dev>; Wed,  2 Aug 2023 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690970232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0B/SwHvEupBfY53luYRb2ZoNvHoya7wk2msaeew6RM=;
	b=cKPeDaXYIRPD5GKp+y9ZgFTpMaL9a8uTh9Cw1C1ysCiVPojWs82mJ3dDyYRgR/Mg27an0k
	CYq/o+J7bOBBvGtrueASvdv2sqvTLcnTDB0beDPN6wMRfcMB41YYhcU3zTQEiUwIQh7Ik+
	4KwS18iQv9FcuPyF26wwsFaIyWL91JY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-BljbdApAMzqFAIp7rSmiMQ-1; Wed, 02 Aug 2023 05:57:09 -0400
X-MC-Unique: BljbdApAMzqFAIp7rSmiMQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A245F381AE46;
	Wed,  2 Aug 2023 09:57:08 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8633401061;
	Wed,  2 Aug 2023 09:57:05 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 06/12] media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver generic
Date: Wed,  2 Aug 2023 17:56:00 +0800
Message-ID: <20230802095606.1298152-7-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

Removed #ifdef ISP2401 to expose the necessary functions for ISP2401 and
also make the driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 67c581d3c1a6..8b5fb3703d59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2957,7 +2957,6 @@ init_vf_frameinfo_defaults(struct ia_css_pipe *pipe,
 	return err;
 }
 
-#ifdef ISP2401
 static unsigned int
 get_crop_lines_for_bayer_order(const struct ia_css_stream_config *config)
 {
@@ -3059,11 +3058,11 @@ ia_css_get_crop_offsets(
 			     pipe->config.input_effective_res.height);
 
 	input_res = &pipe->stream->config.input_config.input_res;
-#ifndef ISP2401
-	effective_res = &pipe->stream->config.input_config.effective_res;
-#else
-	effective_res = &pipe->config.input_effective_res;
-#endif
+
+	if (IS_ISP2401)
+		effective_res = &pipe->config.input_effective_res;
+	else
+		effective_res = &pipe->stream->config.input_config.effective_res;
 
 	get_pipe_extra_pixel(pipe, &extra_row, &extra_col);
 
@@ -3101,7 +3100,6 @@ ia_css_get_crop_offsets(
 
 	return;
 }
-#endif
 
 static int
 init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
-- 
2.41.0

