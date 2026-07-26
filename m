Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549FA3DAC13
	for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785091453; cv=none; b=U4K0GYwO/j4PdH3sQItCSLDtLnpmfLM2Bxq91yRnpmvMWEruw8KCfQTeVSpY4gqKZNlI/AlA1AiSSmaK63iRaJIIAFmOCLqrKw7r6T7GQVbX+CwJJYhI0VCT2gnZoFzGxpOjqWy6LhxJ7ETjIg5od4ROdxpIpavP0KpNoSGdlgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785091453; c=relaxed/simple;
	bh=3pqsp60BObQV+pNo5o2Arb9c3893p1ylQBimojUrTFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n+7nHzdlA9e9ZQOu28r8AkyG4qx7cXLXGuWzbD3RLrtpESX0PI1KNZXjwP5+EU9oHmiGF0Q5P6VUc5SgM3RqG+JQI5d1Zf0XwuBXr1AnxL+zcEDt/LqNhkF7o8+i33UYiStlq+G6r9XDhZOjrLWoi62KDdgpUtGEQ5FATcQPds8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWNfuS04; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWNfuS04"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c86945164so15600781fa.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785091448; x=1785696248; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aOcphe1QFtqh/werO9A3icZFM2dqm8HG7XMhE0aSoG4=;
        b=TWNfuS04e47tK+3ElI3Fw6+GJqhxhsEpObX503j7rxGDNjDvH+xaRHf+I5QIKYWAut
         1IzPGU0X8nNI9sMqTKS/BlC9Hn6m9lOM5OSV+sIHR7/yrIOL9Hq2awu7xRVPervTrGrf
         6XIPGkzIOQCkL5twrRFgMkURyi4rl0JnLDbwBbncCkZvOaR/zXwyu0mY2s4QfYxDcb5o
         MzB+nlhfVpvyE9Z1Gg/T3LMnp5NmLs9F07eb9XPCnyZqaeOmBI8QEdtSKEad0KHpiU30
         /SrcN38eglQmcL4g+JuSLmbuXIdxssiFTl3ROTV7Qcce2tmh/eP1xVZbLbVgHwVda9y6
         jTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785091448; x=1785696248;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aOcphe1QFtqh/werO9A3icZFM2dqm8HG7XMhE0aSoG4=;
        b=htZa8PBoWvpnjyWbI27nMwrvBd1COzxeZv37Cgu1tLX+JsNjztpxb8QeP13VliB/wc
         zWWVjRdmPhNQj4Xn69JE3Ue0xy8mtMnuPrsUK57kMtyJA+bnIohHSH7pKfUpvGs8Q+XW
         ny4F4jG8tE0rRqaZM5SQso9rgaKDQQ0sY2UzF8BvfKtCkFxdkc1vLzNI9jS6xhLQAhNw
         Azfp2tq5vMlt3dW0VIjkB9HQiJLVYGGcFfLweQKzj4WFnO0mBb2hJjiN11sOBx2h5YZh
         rMlHiNjj5Nm8+o/Qcew0Q53dUiVTT3yV/nx51ekBB2JyoYO4qXy+SRsWtmDHpm9D4WwZ
         /HDA==
X-Forwarded-Encrypted: i=1; AHgh+RokYaWK/3foPVn5PGPUUZylHDjm9S47Z+6z06/arQojqeAkzEZr1HA2UEAtOF0jGr9XJ90xNQyFHaIgHC0X@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhm3BZWsrFtf6kLszdx7FZ5ambZu8zten5FqOZ20XM49j/VW8g
	nLo7F6ZYMllNXmIoa1E5k/QiZytdKxSgGx0bklJkPtAGxdaSlieQX619
X-Gm-Gg: AR+sD115nehA/EhEoVW0WbT3fWyN/e6OWyLSVYZe0hac80uoRQ2ThsDu1cFNP6tRK7G
	CtrGshh27RbJxPJvc95uXeXnAAFEeVJS30F8LLfMAYp7K7Jc61Sa2FKFW5uFqRU+o8LNyRlmXfR
	ZDDs4TmmF02gPl+/qUd1/2qFQO5xuup0O5MYE/nUiEjZabU2gz3Rkrx+xGIJrFjYcUDnAhLwBrm
	xnBB9qRENRBWPeDWjPdG7O6cVi65NmCtjrzo17l1JEE0NVgcxwRyXjQuPd/PI//NwDvUfOIvJXs
	zQ23ItLEaBNQ5P7EQYKm8uRToF9eXoVuVj8fTICaea2uIGtKs8oiJdJu5vU/cwxl0vHdvGbXAUF
	k4z2QmQfXDP/thmrDWFwwa+JUI2Xp4tZnAIfFGgh7z7tJVxlnETxLF92sGqERlC3bHnlNtjx4Bv
	9O0bDWw2l4Xg==
X-Received: by 2002:a05:651c:a05:b0:39c:792f:337f with SMTP id 38308e7fff4ca-39f2885edb4mr10471431fa.37.1785091447978;
        Sun, 26 Jul 2026 11:44:07 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22173131sm9434621fa.2.2026.07.26.11.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:44:07 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Sun, 26 Jul 2026 21:43:55 +0300
Subject: [PATCH] staging: media: atomisp: remove unused functions from
 ia_css_debug
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-atomisp-remove-ia_css_debug-v1-1-1a2fe651438b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1lNoK6h4FRmkxqgRtNJYGRDvP
 lWXjw//BKHAJFBnJwQ6WNivCeaTAU5uHUlxnwxW20KXtlBu9wvLpgIt/kjVtSjS9tTFUVmsXIU
 m16bMIR22QAP/nnvzfS2xmwn3ewnX9QcPJ919fwAAAA==
X-Change-ID: 20260726-atomisp-remove-ia_css_debug-2c8a8c130173
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785091445; l=31376;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=3pqsp60BObQV+pNo5o2Arb9c3893p1ylQBimojUrTFM=;
 b=dxc0BAngtzRt+Bab+KzuPxgqxXrcLJKUQqbeOX7Hii/g6/UPmtC9O7zLec57Ftfp7ilTdQmHG
 I4gX/2uM4DEBrHQtWlexFRwvrKVhkok7M0//1AFYQvJpXt8i8AcudIU
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These functions are declared and defined but never called; remove them.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../pci/runtime/debug/interface/ia_css_debug.h     | 178 ------
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   | 670 ---------------------
 2 files changed, 848 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index 2d0e906530af..a639875b7283 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -132,27 +132,6 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
 __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
 					const char *fmt, ...);
 
-
-/*! @brief Function to set the global dtrace verbosity level.
- * @param[in]	trace_level	Maximum level of the messages to be traced.
- * @return	None
- */
-void ia_css_debug_set_dtrace_level(
-    const unsigned int	trace_level);
-
-/*! @brief Function to get the global dtrace verbosity level.
- * @return	global dtrace verbosity level
- */
-unsigned int ia_css_debug_get_dtrace_level(void);
-
-/* ISP2401 */
-/*! @brief Dump GAC hardware state.
- * Dumps the GAC ACB hardware registers. may be useful for
- * detecting a GAC which got hang.
- * @return	None
- */
-void ia_css_debug_dump_gac_state(void);
-
 /*! @brief Dump internal sp software state.
  * Dumps the sp software state to tracing output.
  * @return	None
@@ -164,72 +143,6 @@ void ia_css_debug_print_sp_debug_state(
     const struct sh_css_sp_debug_state *state);
 #endif
 
-/*! @brief Dump all related binary info data
- * @param[in]  bi	Binary info struct.
- * @return	None
- */
-void ia_css_debug_binary_print(
-    const struct ia_css_binary *bi);
-
-void ia_css_debug_sp_dump_mipi_fifo_high_water(void);
-
-/*! \brief Dump pif A isp fifo state
- * Dumps the primary input formatter state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_pif_a_isp_fifo_state(void);
-
-/*! \brief Dump pif B isp fifo state
- * Dumps the primary input formatter state to tracing output.
- * \return	None
- */
-void ia_css_debug_dump_pif_b_isp_fifo_state(void);
-
-/*! @brief Dump stream-to-memory sp fifo state
- * Dumps the stream-to-memory block state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_str2mem_sp_fifo_state(void);
-
-/*! @brief Dump all fifo state info to the output
- * Dumps all fifo state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_all_fifo_state(void);
-
-/*! @brief Dump the frame info to the trace output
- * Dumps the frame info to tracing output.
- * @param[in]	frame		pointer to struct ia_css_frame
- * @param[in]	descr		description output along with the frame info
- * @return	None
- */
-void ia_css_debug_frame_print(
-    const struct ia_css_frame	*frame,
-    const char	*descr);
-
-/*! @brief Function to enable sp sleep mode.
- * Function that enables sp sleep mode
- * @param[in]	mode		indicates when to put sp to sleep
- * @return	None
- */
-void ia_css_debug_enable_sp_sleep_mode(enum ia_css_sp_sleep_mode mode);
-
-/*! @brief Function to wake up sp when in sleep mode.
- * After sp has been put to sleep, use this function to let it continue
- * to run again.
- * @return	None
- */
-void ia_css_debug_wake_up_sp(void);
-
-/*! @brief Function to dump isp parameters.
- * Dump isp parameters to tracing output
- * @param[in]	stream		pointer to ia_css_stream struct
- * @param[in]	enable		flag indicating which parameters to dump.
- * @return	None
- */
-void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
-				  unsigned int enable);
-
 void ia_css_debug_dump_isp_binary(void);
 
 void sh_css_dump_sp_raw_copy_linecount(bool reduced);
@@ -312,95 +225,4 @@ void ia_css_debug_dump_stream_config(
     const struct ia_css_stream_config *config,
     int num_pipes);
 
-/**
- * @brief Initialize the debug mode.
- *
- * WARNING:
- * This API should be called ONLY once in the debug mode.
- *
- * @return
- *	- true, if it is successful.
- *	- false, otherwise.
- */
-bool ia_css_debug_mode_init(void);
-
-/**
- * @brief Disable the DMA channel.
- *
- * @param[in]	dma_ID		The ID of the target DMA.
- * @param[in]	channel_id	The ID of the target DMA channel.
- * @param[in]	request_type	The type of the DMA request.
- *				For example:
- *				- "0" indicates the writing request.
- *				- "1" indicates the reading request.
- *
- * This is part of the DMA API -> dma.h
- *
- * @return
- *	- true, if it is successful.
- *	- false, otherwise.
- */
-bool ia_css_debug_mode_disable_dma_channel(
-    int dma_ID,
-    int channel_id,
-    int request_type);
-/**
- * @brief Enable the DMA channel.
- *
- * @param[in]	dma_ID		The ID of the target DMA.
- * @param[in]	channel_id	The ID of the target DMA channel.
- * @param[in]	request_type	The type of the DMA request.
- *				For example:
- *				- "0" indicates the writing request.
- *				- "1" indicates the reading request.
- *
- * @return
- *	- true, if it is successful.
- *	- false, otherwise.
- */
-bool ia_css_debug_mode_enable_dma_channel(
-    int dma_ID,
-    int channel_id,
-    int request_type);
-
-/**
- * @brief Dump tracer data.
- * [Currently support is only for SKC]
- *
- * @return
- *	- none.
- */
-void ia_css_debug_dump_trace(void);
-
-/* ISP2401 */
-/**
- * @brief Program counter dumping (in loop)
- *
- * @param[in]	id		The ID of the SP
- * @param[in]	num_of_dumps	The number of dumps
- *
- * @return
- *	- none
- */
-void ia_css_debug_pc_dump(sp_ID_t id, unsigned int num_of_dumps);
-
-/* ISP2500 */
-/*! @brief Dump all states for ISP hang case.
- * Dumps the ISP previous and current configurations
- * GACs status, SP0/1 statuses.
- *
- * @param[in]	pipe	The current pipe
- *
- * @return	None
- */
-void ia_css_debug_dump_hang_status(
-    struct ia_css_pipe *pipe);
-
-/*! @brief External command handler
- * External command handler
- *
- * @return	None
- */
-void ia_css_debug_ext_command_handler(void);
-
 #endif /* _IA_CSS_DEBUG_H_ */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..cfe9164c07ad 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -133,17 +133,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 	va_end(ap);
 }
 
-void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
-{
-	dbg_level = trace_level;
-	return;
-}
-
-unsigned int ia_css_debug_get_dtrace_level(void)
-{
-	return dbg_level;
-}
-
 static const char *debug_stream_format2str(const enum atomisp_input_format
 	stream_format)
 {
@@ -300,235 +289,6 @@ static const char *debug_frame_format2str(const enum ia_css_frame_format
 	}
 }
 
-static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
-	const char *descr)
-{
-	assert(state);
-	assert(descr);
-
-	ia_css_debug_dtrace(2, "FIFO channel: %s\n", descr);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "source valid",
-			    state->src_valid);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "fifo accept",
-			    state->fifo_accept);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "fifo valid",
-			    state->fifo_valid);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "sink accept",
-			    state->sink_accept);
-	return;
-}
-
-void ia_css_debug_dump_pif_a_isp_fifo_state(void)
-{
-	fifo_channel_state_t pif_to_isp, isp_to_pif;
-
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_IF0_TO_ISP0, &pif_to_isp);
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_ISP0_TO_IF0, &isp_to_pif);
-	debug_print_fifo_channel_state(&pif_to_isp, "Primary IF A to ISP");
-	debug_print_fifo_channel_state(&isp_to_pif, "ISP to Primary IF A");
-}
-
-void ia_css_debug_dump_pif_b_isp_fifo_state(void)
-{
-	fifo_channel_state_t pif_to_isp, isp_to_pif;
-
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_IF1_TO_ISP0, &pif_to_isp);
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_ISP0_TO_IF1, &isp_to_pif);
-	debug_print_fifo_channel_state(&pif_to_isp, "Primary IF B to ISP");
-	debug_print_fifo_channel_state(&isp_to_pif, "ISP to Primary IF B");
-}
-
-void ia_css_debug_dump_str2mem_sp_fifo_state(void)
-{
-	fifo_channel_state_t s2m_to_sp, sp_to_s2m;
-
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_STREAM2MEM0_TO_SP0, &s2m_to_sp);
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_SP0_TO_STREAM2MEM0, &sp_to_s2m);
-	debug_print_fifo_channel_state(&s2m_to_sp, "Stream-to-memory to SP");
-	debug_print_fifo_channel_state(&sp_to_s2m, "SP to stream-to-memory");
-}
-
-void ia_css_debug_dump_all_fifo_state(void)
-{
-	int i;
-	fifo_monitor_state_t state;
-
-	fifo_monitor_get_state(FIFO_MONITOR0_ID, &state);
-
-	for (i = 0; i < N_FIFO_CHANNEL; i++)
-		debug_print_fifo_channel_state(&state.fifo_channels[i],
-					       "squepfstqkt");
-	return;
-}
-
-static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
-{
-	assert(info);
-	ia_css_debug_dtrace(2, "id = %d\n", info->sp.id);
-	ia_css_debug_dtrace(2, "mode = %d\n", info->sp.pipeline.mode);
-	ia_css_debug_dtrace(2, "max_input_width = %d\n", info->sp.input.max_width);
-	ia_css_debug_dtrace(2, "min_output_width = %d\n",
-			    info->sp.output.min_width);
-	ia_css_debug_dtrace(2, "max_output_width = %d\n",
-			    info->sp.output.max_width);
-	ia_css_debug_dtrace(2, "top_cropping = %d\n", info->sp.pipeline.top_cropping);
-	ia_css_debug_dtrace(2, "left_cropping = %d\n", info->sp.pipeline.left_cropping);
-	ia_css_debug_dtrace(2, "xmem_addr = %d\n", info->xmem_addr);
-	ia_css_debug_dtrace(2, "enable_vf_veceven = %d\n",
-			    info->sp.enable.vf_veceven);
-	ia_css_debug_dtrace(2, "enable_dis = %d\n", info->sp.enable.dis);
-	ia_css_debug_dtrace(2, "enable_uds = %d\n", info->sp.enable.uds);
-	ia_css_debug_dtrace(2, "enable ds = %d\n", info->sp.enable.ds);
-	ia_css_debug_dtrace(2, "s3atbl_use_dmem = %d\n", info->sp.s3a.s3atbl_use_dmem);
-	return;
-}
-
-void ia_css_debug_binary_print(const struct ia_css_binary *bi)
-{
-	unsigned int i;
-
-	debug_binary_info_print(bi->info);
-	ia_css_debug_dtrace(2,
-			    "input:  %dx%d, format = %d, padded width = %d\n",
-			    bi->in_frame_info.res.width,
-			    bi->in_frame_info.res.height,
-			    bi->in_frame_info.format,
-			    bi->in_frame_info.padded_width);
-	ia_css_debug_dtrace(2,
-			    "internal :%dx%d, format = %d, padded width = %d\n",
-			    bi->internal_frame_info.res.width,
-			    bi->internal_frame_info.res.height,
-			    bi->internal_frame_info.format,
-			    bi->internal_frame_info.padded_width);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
-		if (bi->out_frame_info[i].res.width != 0) {
-			ia_css_debug_dtrace(2,
-					    "out%d:    %dx%d, format = %d, padded width = %d\n",
-					    i,
-					    bi->out_frame_info[i].res.width,
-					    bi->out_frame_info[i].res.height,
-					    bi->out_frame_info[i].format,
-					    bi->out_frame_info[i].padded_width);
-		}
-	}
-	ia_css_debug_dtrace(2,
-			    "vf out: %dx%d, format = %d, padded width = %d\n",
-			    bi->vf_frame_info.res.width,
-			    bi->vf_frame_info.res.height,
-			    bi->vf_frame_info.format,
-			    bi->vf_frame_info.padded_width);
-	ia_css_debug_dtrace(2, "online = %d\n", bi->online);
-	ia_css_debug_dtrace(2, "input_buf_vectors = %d\n",
-			    bi->input_buf_vectors);
-	ia_css_debug_dtrace(2, "deci_factor_log2 = %d\n", bi->deci_factor_log2);
-	ia_css_debug_dtrace(2, "vf_downscale_log2 = %d\n",
-			    bi->vf_downscale_log2);
-	ia_css_debug_dtrace(2, "dis_deci_factor_log2 = %d\n",
-			    bi->dis.deci_factor_log2);
-	ia_css_debug_dtrace(2, "dis hor coef num = %d\n",
-			    bi->dis.coef.pad.width);
-	ia_css_debug_dtrace(2, "dis ver coef num = %d\n",
-			    bi->dis.coef.pad.height);
-	ia_css_debug_dtrace(2, "dis hor proj num = %d\n",
-			    bi->dis.proj.pad.height);
-	ia_css_debug_dtrace(2, "sctbl_width_per_color = %d\n",
-			    bi->sctbl_width_per_color);
-	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
-	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
-	return;
-}
-
-void ia_css_debug_frame_print(const struct ia_css_frame *frame,
-			      const char *descr)
-{
-	char *data = NULL;
-
-	assert(frame);
-	assert(descr);
-
-	data = (char *)HOST_ADDRESS(frame->data);
-	ia_css_debug_dtrace(2, "frame %s (%p):\n", descr, frame);
-	ia_css_debug_dtrace(2, "  resolution    = %dx%d\n",
-			    frame->frame_info.res.width, frame->frame_info.res.height);
-	ia_css_debug_dtrace(2, "  padded width  = %d\n",
-			    frame->frame_info.padded_width);
-	ia_css_debug_dtrace(2, "  format        = %d\n", frame->frame_info.format);
-	switch (frame->frame_info.format) {
-	case IA_CSS_FRAME_FORMAT_NV12:
-	case IA_CSS_FRAME_FORMAT_NV16:
-	case IA_CSS_FRAME_FORMAT_NV21:
-	case IA_CSS_FRAME_FORMAT_NV61:
-		ia_css_debug_dtrace(2, "  Y = %p\n",
-				    data + frame->planes.nv.y.offset);
-		ia_css_debug_dtrace(2, "  UV = %p\n",
-				    data + frame->planes.nv.uv.offset);
-		break;
-	case IA_CSS_FRAME_FORMAT_YUYV:
-	case IA_CSS_FRAME_FORMAT_UYVY:
-	case IA_CSS_FRAME_FORMAT_CSI_MIPI_YUV420_8:
-	case IA_CSS_FRAME_FORMAT_CSI_MIPI_LEGACY_YUV420_8:
-	case IA_CSS_FRAME_FORMAT_YUV_LINE:
-		ia_css_debug_dtrace(2, "  YUYV = %p\n",
-				    data + frame->planes.yuyv.offset);
-		break;
-	case IA_CSS_FRAME_FORMAT_YUV420:
-	case IA_CSS_FRAME_FORMAT_YUV422:
-	case IA_CSS_FRAME_FORMAT_YUV444:
-	case IA_CSS_FRAME_FORMAT_YV12:
-	case IA_CSS_FRAME_FORMAT_YV16:
-	case IA_CSS_FRAME_FORMAT_YUV420_16:
-	case IA_CSS_FRAME_FORMAT_YUV422_16:
-		ia_css_debug_dtrace(2, "  Y = %p\n",
-				    data + frame->planes.yuv.y.offset);
-		ia_css_debug_dtrace(2, "  U = %p\n",
-				    data + frame->planes.yuv.u.offset);
-		ia_css_debug_dtrace(2, "  V = %p\n",
-				    data + frame->planes.yuv.v.offset);
-		break;
-	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
-		ia_css_debug_dtrace(2, "  RAW PACKED = %p\n",
-				    data + frame->planes.raw.offset);
-		break;
-	case IA_CSS_FRAME_FORMAT_RAW:
-		ia_css_debug_dtrace(2, "  RAW = %p\n",
-				    data + frame->planes.raw.offset);
-		break;
-	case IA_CSS_FRAME_FORMAT_RGBA888:
-	case IA_CSS_FRAME_FORMAT_RGB565:
-		ia_css_debug_dtrace(2, "  RGB = %p\n",
-				    data + frame->planes.rgb.offset);
-		break;
-	case IA_CSS_FRAME_FORMAT_QPLANE6:
-		ia_css_debug_dtrace(2, "  R    = %p\n",
-				    data + frame->planes.plane6.r.offset);
-		ia_css_debug_dtrace(2, "  RatB = %p\n",
-				    data + frame->planes.plane6.r_at_b.offset);
-		ia_css_debug_dtrace(2, "  Gr   = %p\n",
-				    data + frame->planes.plane6.gr.offset);
-		ia_css_debug_dtrace(2, "  Gb   = %p\n",
-				    data + frame->planes.plane6.gb.offset);
-		ia_css_debug_dtrace(2, "  B    = %p\n",
-				    data + frame->planes.plane6.b.offset);
-		ia_css_debug_dtrace(2, "  BatR = %p\n",
-				    data + frame->planes.plane6.b_at_r.offset);
-		break;
-	case IA_CSS_FRAME_FORMAT_BINARY_8:
-		ia_css_debug_dtrace(2, "  Binary data = %p\n",
-				    data + frame->planes.binary.data.offset);
-		break;
-	default:
-		ia_css_debug_dtrace(2, "  unknown frame type\n");
-		break;
-	}
-	return;
-}
-
 #if SP_DEBUG != SP_DEBUG_NONE
 
 void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
@@ -826,133 +586,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 	return;
 }
 
-/* this function is for debug use, it can make SP go to sleep
-  state after each frame, then user can dump the stable SP dmem.
-  this function can be called after ia_css_start_sp()
-  and before sh_css_init_buffer_queues()
-*/
-void ia_css_debug_enable_sp_sleep_mode(enum ia_css_sp_sleep_mode mode)
-{
-	const struct ia_css_fw_info *fw;
-	unsigned int HIVE_ADDR_sp_sleep_mode;
-
-	fw = &sh_css_sp_fw;
-	HIVE_ADDR_sp_sleep_mode = fw->info.sp.sleep_mode;
-
-	(void)HIVE_ADDR_sp_sleep_mode;	/* Suppress warnings in CRUN */
-
-	sp_dmem_store_uint32(SP0_ID,
-			     (unsigned int)sp_address_of(sp_sleep_mode),
-			     (uint32_t)mode);
-}
-
-void ia_css_debug_wake_up_sp(void)
-{
-	/*hrt_ctl_start(SP); */
-	sp_ctrl_setbit(SP0_ID, SP_SC_REG, SP_START_BIT);
-}
-
-#define FIND_DMEM_PARAMS_TYPE(stream, kernel, type) \
-	(struct CONCATENATE(CONCATENATE(sh_css_isp_, type), _params) *) \
-	findf_dmem_params(stream, offsetof(struct ia_css_memory_offsets, dmem.kernel))
-
-#define FIND_DMEM_PARAMS(stream, kernel) FIND_DMEM_PARAMS_TYPE(stream, kernel, kernel)
-
-/* Find a stage that support the kernel and return the parameters for that kernel */
-static char *
-findf_dmem_params(struct ia_css_stream *stream, short idx)
-{
-	int i;
-
-	for (i = 0; i < stream->num_pipes; i++) {
-		struct ia_css_pipe *pipe = stream->pipes[i];
-		struct ia_css_pipeline *pipeline = ia_css_pipe_get_pipeline(pipe);
-		struct ia_css_pipeline_stage *stage;
-
-		for (stage = pipeline->stages; stage; stage = stage->next) {
-			struct ia_css_binary *binary = stage->binary;
-			short *offsets = (short *)&binary->info->mem_offsets.offsets.param->dmem;
-			short dmem_offset = offsets[idx];
-			const struct ia_css_host_data *isp_data =
-			    ia_css_isp_param_get_mem_init(&binary->mem_params,
-							  IA_CSS_PARAM_CLASS_PARAM, IA_CSS_ISP_DMEM0);
-			if (dmem_offset < 0)
-				continue;
-			return &isp_data->address[dmem_offset];
-		}
-	}
-	return NULL;
-}
-
-void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
-				  unsigned int enable)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "ISP PARAMETERS:\n");
-
-	assert(stream);
-	if ((enable & IA_CSS_DEBUG_DUMP_FPN)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_fpn_dump(FIND_DMEM_PARAMS(stream, fpn), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_OB)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_ob_dump(FIND_DMEM_PARAMS(stream, ob), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_SC)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_sc_dump(FIND_DMEM_PARAMS(stream, sc), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_WB)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_wb_dump(FIND_DMEM_PARAMS(stream, wb), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_DP)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_dp_dump(FIND_DMEM_PARAMS(stream, dp), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_BNR)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_bnr_dump(FIND_DMEM_PARAMS(stream, bnr), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_S3A)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_s3a_dump(FIND_DMEM_PARAMS(stream, s3a), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_DE)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_de_dump(FIND_DMEM_PARAMS(stream, de), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_YNR)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_nr_dump(FIND_DMEM_PARAMS_TYPE(stream, nr, ynr),  IA_CSS_DEBUG_VERBOSE);
-		ia_css_yee_dump(FIND_DMEM_PARAMS(stream, yee), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_CSC)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_csc_dump(FIND_DMEM_PARAMS(stream, csc), IA_CSS_DEBUG_VERBOSE);
-		ia_css_yuv2rgb_dump(FIND_DMEM_PARAMS_TYPE(stream, yuv2rgb, csc),
-				    IA_CSS_DEBUG_VERBOSE);
-		ia_css_rgb2yuv_dump(FIND_DMEM_PARAMS_TYPE(stream, rgb2yuv, csc),
-				    IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_GC)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_gc_dump(FIND_DMEM_PARAMS(stream, gc), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_TNR)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_tnr_dump(FIND_DMEM_PARAMS(stream, tnr), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_ANR)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_anr_dump(FIND_DMEM_PARAMS(stream, anr), IA_CSS_DEBUG_VERBOSE);
-	}
-	if ((enable & IA_CSS_DEBUG_DUMP_CE)
-	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
-		ia_css_ce_dump(FIND_DMEM_PARAMS(stream, ce), IA_CSS_DEBUG_VERBOSE);
-	}
-}
-
 void sh_css_dump_sp_raw_copy_linecount(bool reduced)
 {
 	const struct ia_css_fw_info *fw;
@@ -1014,48 +647,6 @@ void ia_css_debug_dump_isp_binary(void)
 	}
 }
 
-/*
- * @brief Initialize the debug mode.
- * Refer to "ia_css_debug.h" for more details.
- */
-bool ia_css_debug_mode_init(void)
-{
-	bool rc;
-
-	rc = sh_css_sp_init_dma_sw_reg(0);
-	return rc;
-}
-
-/*
- * @brief Disable the DMA channel.
- * Refer to "ia_css_debug.h" for more details.
- */
-bool
-ia_css_debug_mode_disable_dma_channel(int dma_id,
-				      int channel_id, int request_type)
-{
-	bool rc;
-
-	rc = sh_css_sp_set_dma_sw_reg(dma_id, channel_id, request_type, false);
-
-	return rc;
-}
-
-/*
- * @brief Enable the DMA channel.
- * Refer to "ia_css_debug.h" for more details.
- */
-bool
-ia_css_debug_mode_enable_dma_channel(int dma_id,
-				     int channel_id, int request_type)
-{
-	bool rc;
-
-	rc = sh_css_sp_set_dma_sw_reg(dma_id, channel_id, request_type, true);
-
-	return rc;
-}
-
 static void __printf(1, 2) dtrace_dot(const char *fmt, ...)
 {
 	va_list ap;
@@ -1617,264 +1208,3 @@ ia_css_debug_dump_stream_config(
 	ia_css_debug_dump_mipi_buffer_config(&config->mipi_buffer_config);
 	ia_css_debug_dump_metadata_config(&config->metadata_config);
 }
-
-/*
-    Trace support.
-
-    This tracer is using a buffer to trace the flow of the FW and dump misc values (see below for details).
-    Currently, support is only for SKC.
-    To enable support for other platforms:
-     - Allocate a buffer for tracing in DMEM. The longer the better.
-     - Use the DBG_init routine in sp.hive.c to initiatilize the tracer with the address and size selected.
-     - Add trace points in the SP code wherever needed.
-     - Enable the dump below with the required address and required adjustments.
-	   Dump is called at the end of ia_css_debug_dump_sp_state().
-*/
-
-/*
- dump_trace() : dump the trace points from DMEM2.
- for every trace point, the following are printed: index, major:minor and the 16-bit attached value.
- The routine looks for the first 0, and then prints from it cyclically.
- Data forma in DMEM2:
-  first 4 DWORDS: header
-   DWORD 0: data description
-    byte 0: version
-    byte 1: number of threads (for future use)
-    byte 2+3: number ot TPs
-   DWORD 1: command byte + data (for future use)
-    byte 0: command
-    byte 1-3: command signature
-   DWORD 2-3: additional data (for future use)
-  Following data is 4-byte oriented:
-    byte 0:   major
-	byte 1:   minor
-	byte 2-3: data
-*/
-#if TRACE_ENABLE_SP0 || TRACE_ENABLE_SP1 || TRACE_ENABLE_ISP
-static void debug_dump_one_trace(enum TRACE_CORE_ID proc_id)
-{
-#if defined(HAS_TRACER_V2)
-	u32 start_addr;
-	u32 start_addr_data;
-	u32 item_size;
-	u32 tmp;
-	u8 tid_val;
-	enum TRACE_DUMP_FORMAT dump_format;
-
-	int i, j, max_trace_points, point_num, limit = -1;
-	/* using a static buffer here as the driver has issues allocating memory */
-	static u32 trace_read_buf[TRACE_BUFF_SIZE] = {0};
-	static struct trace_header_t header;
-	u8 *header_arr;
-
-	/* read the header and parse it */
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "~~~ Tracer ");
-	switch (proc_id) {
-	case TRACE_SP0_ID:
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP0");
-		start_addr = TRACE_SP0_ADDR;
-		start_addr_data = TRACE_SP0_DATA_ADDR;
-		item_size = TRACE_SP0_ITEM_SIZE;
-		max_trace_points = TRACE_SP0_MAX_POINTS;
-		break;
-	case TRACE_SP1_ID:
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP1");
-		start_addr = TRACE_SP1_ADDR;
-		start_addr_data = TRACE_SP1_DATA_ADDR;
-		item_size = TRACE_SP1_ITEM_SIZE;
-		max_trace_points = TRACE_SP1_MAX_POINTS;
-		break;
-	case TRACE_ISP_ID:
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ISP");
-		start_addr = TRACE_ISP_ADDR;
-		start_addr_data = TRACE_ISP_DATA_ADDR;
-		item_size = TRACE_ISP_ITEM_SIZE;
-		max_trace_points = TRACE_ISP_MAX_POINTS;
-		break;
-	default:
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "\t\ttraces are not supported for this processor ID - exiting\n");
-		return;
-	}
-
-	if (!IS_ISP2401) {
-		tmp = ia_css_device_load_uint32(start_addr);
-		point_num = (tmp >> 16) & 0xFFFF;
-
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, " ver %d %d points\n", tmp & 0xFF,
-				    point_num);
-	} else {
-		/* Loading byte-by-byte as using the master routine had issues */
-		header_arr = (uint8_t *)&header;
-		for (i = 0; i < (int)sizeof(struct trace_header_t); i++)
-			header_arr[i] = ia_css_device_load_uint8(start_addr + (i));
-
-		point_num = header.max_tracer_points;
-
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, " ver %d %d points\n", header.version,
-				    point_num);
-
-		tmp = header.version;
-	}
-	if ((tmp & 0xFF) != TRACER_VER) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "\t\tUnknown version - exiting\n");
-		return;
-	}
-	if (point_num > max_trace_points) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "\t\tToo many points - exiting\n");
-		return;
-	}
-	/* copy the TPs and find the first 0 */
-	for (i = 0; i < point_num; i++) {
-		trace_read_buf[i] = ia_css_device_load_uint32(start_addr_data +
-				    (i * item_size));
-		if ((limit == (-1)) && (trace_read_buf[i] == 0))
-			limit = i;
-	}
-	if (IS_ISP2401) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "Status:\n");
-		for (i = 0; i < SH_CSS_MAX_SP_THREADS; i++)
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "\tT%d: %3d (%02x)  %6d (%04x)  %10d (%08x)\n", i,
-					    header.thr_status_byte[i], header.thr_status_byte[i],
-					    header.thr_status_word[i], header.thr_status_word[i],
-					    header.thr_status_dword[i], header.thr_status_dword[i]);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "Scratch:\n");
-		for (i = 0; i < MAX_SCRATCH_DATA; i++)
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "%10d (%08x)  ",
-					    header.scratch_debug[i], header.scratch_debug[i]);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "\n");
-	}
-	/* two 0s in the beginning: empty buffer */
-	if ((trace_read_buf[0] == 0) && (trace_read_buf[1] == 0)) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "\t\tEmpty tracer - exiting\n");
-		return;
-	}
-	/* no overrun: start from 0 */
-	if ((limit == point_num - 1) ||
-	    /* first 0 is at the end - border case */
-	    (trace_read_buf[limit + 1] ==
-	     0))   /* did not make a full cycle after the memset */
-		limit = 0;
-	/* overrun: limit is the first non-zero after the first zero */
-	else
-		limit++;
-
-	/* print the TPs */
-	for (i = 0; i < point_num; i++) {
-		j = (limit + i) % point_num;
-		if (trace_read_buf[j]) {
-			if (!IS_ISP2401) {
-				TRACE_DUMP_FORMAT dump_format = FIELD_FORMAT_UNPACK(trace_read_buf[j]);
-			} else {
-				tid_val = FIELD_TID_UNPACK(trace_read_buf[j]);
-				dump_format = TRACE_DUMP_FORMAT_POINT;
-
-				/*
-				* When tid value is 111b, the data will be interpreted differently:
-				* tid val is ignored, major field contains 2 bits (msb) for format type
-				*/
-				if (tid_val == FIELD_TID_SEL_FORMAT_PAT)
-					dump_format = FIELD_FORMAT_UNPACK(trace_read_buf[j]);
-			}
-			switch (dump_format) {
-			case TRACE_DUMP_FORMAT_POINT:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,	"\t\t%d %d:%d value - %d\n",
-				    j, FIELD_MAJOR_UNPACK(trace_read_buf[j]),
-				    FIELD_MINOR_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_UNPACK(trace_read_buf[j]));
-				break;
-			/* ISP2400 */
-			case TRACE_DUMP_FORMAT_VALUE24_HEX:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,	"\t\t%d, %d, 24bit value %x H\n",
-				    j,
-				    FIELD_MAJOR_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_24_UNPACK(trace_read_buf[j]));
-				break;
-			/* ISP2400 */
-			case TRACE_DUMP_FORMAT_VALUE24_DEC:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,	"\t\t%d, %d, 24bit value %d D\n",
-				    j,
-				    FIELD_MAJOR_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_24_UNPACK(trace_read_buf[j]));
-				break;
-			/* ISP2401 */
-			case TRACE_DUMP_FORMAT_POINT_NO_TID:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,	"\t\t%d %d:%d value - %x (%d)\n",
-				    j,
-				    FIELD_MAJOR_W_FMT_UNPACK(trace_read_buf[j]),
-				    FIELD_MINOR_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_UNPACK(trace_read_buf[j]));
-				break;
-			/* ISP2401 */
-			case TRACE_DUMP_FORMAT_VALUE24:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,	"\t\t%d, %d, 24bit value %x (%d)\n",
-				    j,
-				    FIELD_MAJOR_UNPACK(trace_read_buf[j]),
-				    FIELD_MAJOR_W_FMT_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_24_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_24_UNPACK(trace_read_buf[j]));
-				break;
-			case TRACE_DUMP_FORMAT_VALUE24_TIMING:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,	"\t\t%d, %d, timing %x\n",
-				    j,
-				    FIELD_MAJOR_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_24_UNPACK(trace_read_buf[j]));
-				break;
-			case TRACE_DUMP_FORMAT_VALUE24_TIMING_DELTA:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,	"\t\t%d, %d, timing delta %x\n",
-				    j,
-				    FIELD_MAJOR_UNPACK(trace_read_buf[j]),
-				    FIELD_VALUE_24_UNPACK(trace_read_buf[j]));
-				break;
-			default:
-				ia_css_debug_dtrace(
-				    IA_CSS_DEBUG_TRACE,
-				    "no such trace dump format %d",
-				    dump_format);
-				break;
-			}
-		}
-	}
-#else
-	(void)proc_id;
-#endif /* HAS_TRACER_V2 */
-}
-#endif /* TRACE_ENABLE_SP0 || TRACE_ENABLE_SP1 || TRACE_ENABLE_ISP */
-
-void ia_css_debug_dump_trace(void)
-{
-#if TRACE_ENABLE_SP0
-	debug_dump_one_trace(TRACE_SP0_ID);
-#endif
-#if TRACE_ENABLE_SP1
-	debug_dump_one_trace(TRACE_SP1_ID);
-#endif
-#if TRACE_ENABLE_ISP
-	debug_dump_one_trace(TRACE_ISP_ID);
-#endif
-}
-
-/* ISP2401 */
-void ia_css_debug_pc_dump(sp_ID_t id, unsigned int num_of_dumps)
-{
-	unsigned int pc;
-	unsigned int i;
-	hrt_data sc = sp_ctrl_load(id, SP_SC_REG);
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP%-1d Status reg: 0x%X\n", id, sc);
-	sc = sp_ctrl_load(id, SP_CTRL_SINK_REG);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP%-1d Stall reg: 0x%X\n", id, sc);
-	for (i = 0; i < num_of_dumps; i++) {
-		pc = sp_ctrl_load(id, SP_PC_REG);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP%-1d PC: 0x%X\n", id, pc);
-	}
-}

---
base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
change-id: 20260726-atomisp-remove-ia_css_debug-2c8a8c130173

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

