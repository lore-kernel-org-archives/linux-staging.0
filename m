Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ACA397E89
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479910; cv=none; b=fLbnf7PHWA/TqL4RtJsTgOW7/pqi/6/rEitUyZNVqNPEr19oAYX/komhYY1aF7JdMRsSUvtesAyQJemgyr283g5qzbrLE663PwtOxlruLs7vcD4gBL9VXFpd0wpLPKf2CM94T7NBBSRO96BjogxTc98wi7Q+Z+89iNVwickj3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479910; c=relaxed/simple;
	bh=rf3vPXa7x1VywS4MiMkGOUIsNiVXVvgwlwYOCkZNs/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L29Zvedpzvo1iGrxBF+6PUs1cvKh4xBqy0tDzdBgtozUl9ihDmIRw6+3frs4QG/IKSTUV+v44v7wi0GXgD9QropCe9XqUwNUdL71RJEahJXY1aALQ7aXijIM2gTzfLdWkxpAlhyTuKYUV5/9Q5VKTGC0Y9Y1YdYDUB6DA8luhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5HIwRac; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5HIwRac"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9910707d82so40855966b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 16:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479907; x=1775084707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiwFETKkt3NdDNZkVN46Gf8wVpkOW4mHE9IXrg+0ugk=;
        b=W5HIwRacvuHfvUpQL2FJ1TJ4g0TYdV2OB7K5RntrpLAEWMeD6fV5hnO+jTU9qVLGnM
         +P9hEPFRf2uy4FTOpvw6vU3R5RvRFGtfvLEMwymxhz5SgxAcwklXtgRXknnwJugJYLDT
         I9nBGIFcZA0SwlcnM9JIWWd3ywRCn74zh7DgwmcaXN5znNGhn614s7j68bRE40rwHz4S
         IiGWO1PfxfRHZhBvxGcXht/9Uoqm2nvpmszkWvg/qNOiSy3+hPy1GS2Pg12z0plxa5kh
         i4EUyzQUlA+PQ+COKRdLWe7RVxdXn44iVXfHnx8QkkJE6CV8QBwbLeTsk6mkMdT6IaHq
         TLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479907; x=1775084707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiwFETKkt3NdDNZkVN46Gf8wVpkOW4mHE9IXrg+0ugk=;
        b=QBebB8ncJcUvkTQEEhhpaxcnnUhvVzCzrkkge4FBS9JQioay7D/B7xgD0CmCXUcrC5
         M+Sqy9xWIwPkro582yg2p71Bb7EB+jNt5G7BwK0/LN4P2DAi6bpTg+qfel2w1PYnWmBC
         JwYR9inFL2/lu/4P/J2Iwd+F0MEj8eiy0ZdbcDC7EIjCe4CIk4OhK92YPQ9pP2IoCQKs
         TL+BcLDyU3w4AP7s7G2KWPLWZxfcT1XgSxTw2zPx4R5GPWfBxpe2SKxclhVoTd4ixTXD
         nuOe/FQPmzILSC+3rsbwSAm8EFtapdnG+xpT0GSvEYQJ9loyefCUtVnP7xMaKEXMvTmb
         8tUw==
X-Gm-Message-State: AOJu0Yx89KfGPZCYH3TURHcXCmDt655/vGBbVEkbMzUMNnAOICgOTSfo
	kCfjdsxdf70WDFvjD5xReyC/S5Gw+xWpTc7qSdWLNGNIntPW0P+AzgcMMDaA5pMY
X-Gm-Gg: ATEYQzwupoWNqmb2A0uYVbjQZHFOwSUTAhgSb1SNprwrZifRXOzH6DBt3WKU0IOnoj1
	A/HVZZCFgRb7HGjfVphbQmkukg4WV0VfsrQcd590i9RjMRvwbmVTp2ZVo5Brw0lYeK+1DOZS41I
	U+K2fY4rHzCbPV4wFhWUzkbXdZUTvLw4jpBpHh3VUKxsfKHf0MV5vxdGRc9ko94j7+ZYcq4Q21q
	HSQkrm+AuwgdsX+zUrePcj+F1jfgsUT0HKjB1J5RdkpytNU7Dpi2DG/YkGGFSQqdWzO/797xtlQ
	XeXQ+uCOMISu/l3nCap99aIQ7mbT+2oMdM549RPrSwQOKL0NeexU2o3X/VTpVsZFVdfdFGMd4a0
	VzSzivwlc7OonPiFH4Hcrjl27Gi/zZb1L5L+Bj1+7nZWmvSzXuIQm67Bty8UWmWN6qbjLKy4U5G
	kEV1BHmJp2NWB4rNfpt3EUdAlGFnu3Bu7AT4aJRxgimrmAnQ==
X-Received: by 2002:a17:907:8694:b0:b96:996c:8605 with SMTP id a640c23a62f3a-b9a3f1adbd8mr393398866b.23.1774479906060;
        Wed, 25 Mar 2026 16:05:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:185f:dfa7:bca5:80ff:fe60:41d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef860sm35371766b.48.2026.03.25.16.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:05:05 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: refactor ia_css_stream_destroy
Date: Thu, 26 Mar 2026 00:04:48 +0100
Message-ID: <20260325230453.848584-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the ISP2401 cleanup logic into a separate helper
function.

Fix a logic bug where the loop variable 'i' was being shadowed and
overwritten by a nested loop, potentially causing incorrect cleanup
behavior.

Replace an early 'return -EINVAL' with 'continue' within the cleanup
loop. In a destruction path, it is better to proceed with cleaning up as
many resources as possible rather than aborting early, which would
result in memory leaks for the remaining pipes.

Remove 'assert(entry)' in favor of an explicit null pointer check ('if
(!entry) continue;'). This avoids a macro-based assertions and ensuring
the system remains stable even if a pointer is unexpectedly null during
cleanup.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 89 ++++++++++++----------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..076a75c9d0fb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8189,6 +8189,51 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	return err;
 }
 
+static void ia_css_stream_destroy_isp2401(struct ia_css_stream *stream)
+{
+	int i, j;
+
+	for (i = 0; i < stream->num_pipes; i++) {
+		struct ia_css_pipe *entry = stream->pipes[i];
+		unsigned int sp_thread_id;
+		struct sh_css_sp_pipeline_terminal *terminal;
+
+		if (!entry)
+			continue;
+
+		/* get the SP thread id */
+		if (!ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(entry),
+						      &sp_thread_id))
+			continue;
+
+		/* get the target input terminal */
+		terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
+
+		for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
+			ia_css_isys_stream_h isys_stream =
+				&terminal->context.virtual_input_system_stream[j];
+
+			if (stream->config.isys_config[j].valid && isys_stream->valid)
+				ia_css_isys_stream_destroy(isys_stream);
+		}
+	}
+
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+		for (i = 0; i < stream->num_pipes; i++) {
+			/*
+			 * free any mipi frames that are remaining:
+			 * some test stream create-destroy cycles do
+			 * not generate output frames
+			 * and the mipi buffer is not freed in the
+			 * deque function
+			 */
+			if (stream->pipes[i])
+				free_mipi_frames(stream->pipes[i]);
+		}
+	}
+	stream_unregister_with_csi_rx(stream);
+}
+
 int
 ia_css_stream_destroy(struct ia_css_stream *stream)
 {
@@ -8206,48 +8251,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 
 	if ((stream->last_pipe) &&
 	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num)) {
-		if (IS_ISP2401) {
-			for (i = 0; i < stream->num_pipes; i++) {
-				struct ia_css_pipe *entry = stream->pipes[i];
-				unsigned int sp_thread_id;
-				struct sh_css_sp_pipeline_terminal *sp_pipeline_input_terminal;
-
-				assert(entry);
-				if (entry) {
-					/* get the SP thread id */
-					if (!ia_css_pipeline_get_sp_thread_id(
-							ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
-						return -EINVAL;
-
-					/* get the target input terminal */
-					sp_pipeline_input_terminal =
-						&sh_css_sp_group.pipe_io[sp_thread_id].input;
-
-					for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {
-						ia_css_isys_stream_h isys_stream =
-							&sp_pipeline_input_terminal->context.virtual_input_system_stream[i];
-						if (stream->config.isys_config[i].valid && isys_stream->valid)
-							ia_css_isys_stream_destroy(isys_stream);
-					}
-				}
-			}
-
-			if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
-				for (i = 0; i < stream->num_pipes; i++) {
-					struct ia_css_pipe *entry = stream->pipes[i];
-					/*
-					 * free any mipi frames that are remaining:
-					 * some test stream create-destroy cycles do
-					 * not generate output frames
-					 * and the mipi buffer is not freed in the
-					 * deque function
-					 */
-					if (entry)
-						free_mipi_frames(entry);
-				}
-			}
-			stream_unregister_with_csi_rx(stream);
-		}
+		if (IS_ISP2401)
+			ia_css_stream_destroy_isp2401(stream);
 
 		for (i = 0; i < stream->num_pipes; i++) {
 			struct ia_css_pipe *curr_pipe = stream->pipes[i];
-- 
2.53.0

