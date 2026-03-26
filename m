Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086D3A7F46
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 21:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560910; cv=none; b=sGUwPb6ax7AHXBansKv1+ymoZ3pOHVeT0/TdogXirg8JJExKv/Y8ZavjyeNcNJRWsi9vRbZYXu0mdmnKnN7IRM/VI7hR2k7HuV7NNrc7QKwIT4wvPvohN4O+iJ6YJB65eZ8q+1DnYg87Ydpr0bTUJRUoRlNA+x6UfrP22Wm/S5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560910; c=relaxed/simple;
	bh=CtnwhLDLOxjCXa3BzzxQo5WlhQ17lqydy/Bm6LiQsfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uej02+koEE4OpwB7TuHFx9OOKBif5YMjz52FtDFDu08JRFwWjkiy4I2HNEh/uKP5V+DakFrHQIOi0Ly1YTNo5+lG1+bEVecQ7aPQ6f/cs8/E2m4NRiDXS382jh6NzL2WjFQuFDQO8fDqCMBXnz+PF0/RwamGrCp4vqdkkPmJcX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUzBLMeL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUzBLMeL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48704db565eso20820785e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 14:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560907; x=1775165707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVJ/09f+kraUH4FlZGqso9M+eYHC0bMs9ktLcorknuk=;
        b=oUzBLMeLZ8vBN5UdocBv6IhInJDzgmlgJCLaTDsjMnRH76Y2kZunOEde3ncopsLzrQ
         qMJzA0KBjTiKOMDUSauzLzXFBFuO1KiGYa+AKsd/9KoZO6TUsoDEDEf6p1kAuHXHgky9
         0m4AtvVoO+dt1UM3eHZcD0P3o+mtwi1Ez9U37jl7CRIja1wLfWNuYPcM1+bzcNUTU25B
         vLIQZm071y/OY85qmSEb3RcTadAKPhmxVIg1Y9kymdscGXcyJ6C3ewETdgggTpoYK6Wm
         NE0lNDCW+H7oR9nxTWncuvCkE2gJYhVrxgp5lRb3/7KrpP2BD0wanWgnEcY0QSDzf+xY
         znjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560907; x=1775165707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVJ/09f+kraUH4FlZGqso9M+eYHC0bMs9ktLcorknuk=;
        b=AwAWo0wbEmPnWyvDLeLrkcxpVlm+Aj4GSWzuDmlB3Pubm+DT4NRwbmvoJJLRO/HjEd
         Z4FiDtKnBmuTHZlPj2wjbRL1VAhFxOTRfxwUo+we+IcgELIN4g144HGA/hESBGMaE9AV
         /6kROTLkBweGFG1beUtX5kfmnz5OI7VIt6Xk9kVai2rjz6kUzbkd6zh6ViKfUMVnvXZ6
         qvJVaXSWbgDql/7pWHQnBqAMR2AgCU4IYe3Ol/S5Gv9nnsheapeh9LFhpyfuRqFcQJgF
         4nCbIMI14+38jpphzicrXNym7qi0pIDQ8sb9sBM43/Y2YDd+Qk1rmzpWxFBys9xN91vh
         vSuw==
X-Gm-Message-State: AOJu0YwRxiGC9UvoohUz4rg0knOOs6IinfS3ae+5Nxc+q/A64jd5Lzso
	wltdvpCncfbd7GrcGg86oMqtbn7295TlvBodN3ohADtJqc35yUW0jHihs20yAoCG
X-Gm-Gg: ATEYQzxVuUFrtIWnminYLtn1Llcf3GvmZ7RcO8La8b3OrLW909JZN79Jyqwpp9P7rW7
	sOWdOegK5QJiARLuTNh3dYjCtCCMfIffDi8SVw5h0fSPrqWxbbGNIa8VQD5Mmcpqf1+NWjIv7hK
	wPw2OCO4oPRHgTBx+swFuQbgA2d0nquy5OgOkOSQKy9z8ewHlX3Ca8CjvDZESFe+HoPSxLsh4/Q
	pz2k5/bKtXHL1YtB4uU4UqgV41QW2y8fykQWaA8WTlJWw241dTHZjaheM31IU+XmiDOZ0i3TCFk
	zwXATC+0Z+G9nX6Jp+iPYHqkP1lwpx2J90h2VDpyYi7TOYZ96WGHpnNMIEsa+AhTp51npwl3TkN
	5wAJ+JnDxyQ6E2ytR/J+skOJXj5TXaN4iUQQvUDP85L2Cdtynr+L+RC0JOSQ3Mqb8cuhfF1E9tA
	K1L5uisAUx3vJupBMXh9pvHRf7diEesuCCu5s4/2S77pfV2Q==
X-Received: by 2002:a05:600c:c168:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-48727eddeacmr3457045e9.28.1774560906791;
        Thu, 26 Mar 2026 14:35:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:35:06 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/3] staging: media: atomisp: extract ISP2401 cleanup into helper function
Date: Thu, 26 Mar 2026 22:34:08 +0100
Message-ID: <20260326213442.876745-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326213442.876745-1-azpijr@gmail.com>
References: <20260326213442.876745-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To reduce indentation and improve the readability of
ia_css_stream_destroy(), extract the ISP2401-specific cleanup block into
a new static helper function, ia_css_stream_destroy_isp2401().

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 89 +++++++++++-----------
 1 file changed, 46 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 8d8b82dc59f1..0e848758723f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8189,10 +8189,53 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
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
+		assert(entry);
+		if (entry) {
+			if (!ia_css_pipeline_get_sp_thread_id(
+				ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
+				return;
+
+			terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
+
+			for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
+				ia_css_isys_stream_h isys_stream =
+					&terminal->context.virtual_input_system_stream[j];
+				if (stream->config.isys_config[j].valid && isys_stream->valid)
+					ia_css_isys_stream_destroy(isys_stream);
+			}
+		}
+	}
+
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+		for (i = 0; i < stream->num_pipes; i++) {
+			struct ia_css_pipe *entry = stream->pipes[i];
+			/*
+			 * free any mipi frames that are remaining:
+			 * some test stream create-destroy cycles do
+			 * not generate output frames
+			 * and the mipi buffer is not freed in the
+			 * deque function
+			 */
+			if (entry)
+				free_mipi_frames(entry);
+		}
+	}
+	stream_unregister_with_csi_rx(stream);
+}
+
 int
 ia_css_stream_destroy(struct ia_css_stream *stream)
 {
-	int i, j;
+	int i;
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
@@ -8206,48 +8249,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 
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
-					for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
-						ia_css_isys_stream_h isys_stream =
-							&sp_pipeline_input_terminal->context.virtual_input_system_stream[j];
-						if (stream->config.isys_config[j].valid && isys_stream->valid)
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

