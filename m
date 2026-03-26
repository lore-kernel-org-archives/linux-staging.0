Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EE030DEB0
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560918; cv=none; b=TNv2hqTuO8WRn7mxlr0Dsxigui0CP/E6WdgN82bHtYfSCOtExYH9yAlQ7RR9xUB9WUMUnW2bp4zrI2VnuqjtdOPE3zK8zD4IDWnQO86QjHgS52gN3Sycjilw9lpwPnikX9BUCrj7cF6hTm304BW5MaIJiQS+zTPhTLLxHz3t9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560918; c=relaxed/simple;
	bh=ez5aAwkAd5qsck46sQ1rbD1CCA7NFpeVTS9fL0whzBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSEPRqI70JTFvqwquKApAg1thkSa3tBb0sDTUQ9OjfOTf/5ajerPUsc5Gq9psAFZ2BF8qkVa3Ts4YD8eIvCrhlMSoH8dOy2ekQ1+9AJowofjqM8Iiqhkq0Jb4ysWx7JL/oQI4RXYS7cB24puW4Wzaqcy43xAdNnmfgRKSNa02AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5lkAirp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5lkAirp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fb112c09so14791915e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560915; x=1775165715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmSa6Nj2pzOSB63unXnRZ4rb/ic4PWoX2DWS6MyutAs=;
        b=C5lkAirpmiKHuXgELgUGIkseG0HLhYzPLSH5J5TcMIoBzyqinn8ko3DtTNuZH3hwGJ
         cCNKpMs5yR96ywBcGx+Mqd/MK0z1gI8516SsqoxI520kBLVq15A7yFP/9H9MQSZ3eWL0
         aGpDAE0PQzXwG9dzL19sx7pBN2F35aM32ZAEXJeu/yOFtmh8TuUMZZCWeiLU1fUzz/ti
         tbPLsQc/VgSZW8Tpk/6LW3vgULsOK+1VqFuSnPTR5fHzPj5PqyFPOt6PgucKCRcWHDyq
         4j2+6/1V5TTkhwA0scWdabmWvj+gmf00k4QcNO6YDfDr5btaInZfNxN/wcyh1vO6WIZV
         +Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560915; x=1775165715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmSa6Nj2pzOSB63unXnRZ4rb/ic4PWoX2DWS6MyutAs=;
        b=Im4WcEzdiMwniOtVxcsu9WoCiQI2Ah837r5mMuTGf19MAgSMoQ0hOayjduwJHg8B8f
         Kv38l05r7F8Yh25moaekzalmlwoOKyb9yoaXFVgzCcZg4FT9fWgSoEmVmhQ/WLHeaczF
         vQ1OBbd7WDL8bFerc7WcpwGb/EgluwjArbarTCfDhSeLimdIr07/UGqRU1vjjHw/7iL9
         /JTa2hdSor7gEw4XMYUFxv7jzOkV7kZI/N113ReNe0v5QoFmyfss9cCd+UFdbR0Mi/Dx
         sb9kUqarWzdiwbQtSGFQU4EHvThKah5ic3p9x11ekVmeJP/CbIMXAgZPa54Qnc5mDsvk
         ehyQ==
X-Gm-Message-State: AOJu0Yz3cXHQVacWKge9THZElmM4w0ZP4QhKAX9CBPQnLZk4yL2C7kEN
	En5lfPgcK6FKSxf8lERWwpoo+/cRC35h6nKAfhEmoMf6Khnp4fZ95/6fTXKmWXNQ
X-Gm-Gg: ATEYQzyeAwLPKkW4r5veqCmeJ3p+HlW0I2ksRAzWRv6v7+S0KDT4yYhK/pfNloWRMXS
	auZ4H5OSPpQBgD2FHGFuBqKBrfkmY1udfp11R9HTCKOB9nQiQE7vuRO47+dPWs0036jcNxP0bJL
	SpnGdtqUD0Mrl5CaDeWQa2cFsDlKnPCOMnQI1S1PCO8DB5EqHaDh+b2SkL3np1W4NTDKjzqVWIb
	0hXsCgmFwHcqzbKC3BI6WrOTAB+8sZaCdyaiWBagmUaVC6g2r17qojTxLl4BNt09pC3r5+Qjzgy
	0f+G4HOEUpLczQ1QxhW6qmklTxbZ+jLv/6dJ4AQc7f8dEkVwZXAqUq7q4bipIgWNKVngsTT+YMS
	kjNT5I7PWTMQSUoz+abrGUFB9x8Pv3hi0vY/pg1hJv2Q+kCg/YUyq/RlTW6BjBUpBUZF3yH9Ao4
	71TCrF0NmUKSSd/rGITtRQXcEl0ZEp0vO7H5dHfzoWkYYkzg==
X-Received: by 2002:a05:600c:a44:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-48727efc11dmr2581025e9.9.1774560914810;
        Thu, 26 Mar 2026 14:35:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:35:14 -0700 (PDT)
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
Subject: [PATCH v2 3/3] staging: media: atomisp: improve cleanup robustness in ia_css_stream_destroy_isp2401()
Date: Thu, 26 Mar 2026 22:34:09 +0100
Message-ID: <20260326213442.876745-4-azpijr@gmail.com>
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

Remove the 'assert(entry)' call. In the atomisp driver, assert() is a
wrapper around BUG(), which intentionally crashes the entire kernel.
This is dangerous and inappropriate for a simple null pointer check
during stream teardown. Replace it with a safe 'if (!entry) continue;'
check.

Change the early 'return' to a 'continue'. In a destruction
path, it is better to proceed with cleaning up as many resources as
possible rather than aborting early, which would result in memory leaks
for the remaining pipes.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 27 +++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 0e848758723f..8c368940acd8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8198,26 +8198,25 @@ static void ia_css_stream_destroy_isp2401(struct ia_css_stream *stream)
 		unsigned int sp_thread_id;
 		struct sh_css_sp_pipeline_terminal *terminal;
 
-		assert(entry);
-		if (entry) {
-			if (!ia_css_pipeline_get_sp_thread_id(
+		if (!entry)
+			continue;
+
+		if (!ia_css_pipeline_get_sp_thread_id(
 				ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
-				return;
+			continue;
 
-			terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
+		terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
 
-			for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
-				ia_css_isys_stream_h isys_stream =
-					&terminal->context.virtual_input_system_stream[j];
-				if (stream->config.isys_config[j].valid && isys_stream->valid)
-					ia_css_isys_stream_destroy(isys_stream);
-			}
+		for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
+			ia_css_isys_stream_h isys_stream =
+				&terminal->context.virtual_input_system_stream[j];
+			if (stream->config.isys_config[j].valid && isys_stream->valid)
+				ia_css_isys_stream_destroy(isys_stream);
 		}
 	}
 
 	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		for (i = 0; i < stream->num_pipes; i++) {
-			struct ia_css_pipe *entry = stream->pipes[i];
 			/*
 			 * free any mipi frames that are remaining:
 			 * some test stream create-destroy cycles do
@@ -8225,8 +8224,8 @@ static void ia_css_stream_destroy_isp2401(struct ia_css_stream *stream)
 			 * and the mipi buffer is not freed in the
 			 * deque function
 			 */
-			if (entry)
-				free_mipi_frames(entry);
+			if (stream->pipes[i])
+				free_mipi_frames(stream->pipes[i]);
 		}
 	}
 	stream_unregister_with_csi_rx(stream);
-- 
2.53.0

