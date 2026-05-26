Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC773A0E8E
	for <linux-staging@lists.linux.dev>; Tue, 26 May 2026 20:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779825799; cv=none; b=QCfHpFNF/EPTQQH5VcJV/KQPIBlLiRxBpJI9UVWu9i9/QGaF1zhBfSS8aIg5NjxEIe0lzH1vadTN3YTMtA8MssimjdqynEPocgU0so3I+2MyzQgu60lbJATKNPNxOZk5t6MNqwDQDpeB0jSSlPn8hpaCWQuubzUWwSxZWEhKjN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779825799; c=relaxed/simple;
	bh=Tmx7giCY7jcU/O3x7HDf6eeT9iqTu1+8bKDyDQf5c1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icSQjqxjqm4xP1arfbFn6nBxKC/XX7kIvbu2YoTPi1Dm9T5wz8iI5SPl9xOuYNDRWpdxJKLRx/AGaqyM0ZHuR6gRqqZllwhaqSkWFGBqgy+8pzFFUD6jQAteg2UzCdmsLT16bMqrH9OsQXEv5W6m9H/qZ8md6Onn+RtYZn/BgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=L6gr+CvQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GWIr3NbW; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="L6gr+CvQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GWIr3NbW"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A17CB7A00BE;
	Tue, 26 May 2026 16:03:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 26 May 2026 16:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1779825796; x=1779912196; bh=fBt7zRIXgXaa4srXxXqPS
	jZ04aOmSzU5+JrtLTBzeKY=; b=L6gr+CvQVmBED/ck2oQq1HIvBOZ8a5QJEQ2TX
	5B+KvH87HoMeB8ZAFqmYQgz9sKnFSW/GKoqLfZHtBt0fUDDvIzXff9ssZV6g2R91
	G0v4U5auWQbTqNDRVOXcDb/j/Vr7TSbLFAtndUiPsCkOs/02h2drC1SaoERoyrgG
	DUMsDO7drQ+A4qkFlQTfmF6EA1sgRB2/KUJEbkm6Ta9n0Lahf8FboHD0U3q+IZUI
	ROFedZnLa8MqfwIPvrwLhxHHGl2AvscLSXoXzNVWcOmoTyBRcf1F/qZg78wCZxee
	f3Nm2Y+Lr/hhsQ7StVerx6C20x5J872BhQa4eRtd8yjtZBagw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779825796; x=1779912196; bh=fBt7zRIXgXaa4srXxXqPSjZ04aOmSzU5+Jr
	tLTBzeKY=; b=GWIr3NbWHAlryER8nQZRotBaiy8y7ckpQLTHXCyzcyfvFGzGc3p
	nOELODtRbm7K9d9jyUnSTnP7M+Dxch0XUFDTN4CQTMvgrNlMXgH41QyLcA8Mjae1
	5Mq8jLO/P7XgDix0Nn7ZuP3V3SegRGGqfNMSqob8N+7+Zu5SI41m3dGxYhkZUd4I
	ZIJwXzMhvKDpIAj64f+Ob6h+P655j6VvQkOXVkS654nFoLMnGJ+H6GOJW7xLRp4n
	v5o73JD5xBsA3yEj7CXaow21RvIAplYUzZjHEs83LpMcFVZijtTOwuKbdhS+CyTg
	+21G1uscYtXFpAHzNr8OchVBGWj9WWxWyBA==
X-ME-Sender: <xms:g_wVah88vZ9rIMhNzE_b8hP2qhIrXmi0qVLnhE6oL6OiRdL-hay6ig>
    <xme:g_wVat6DnBggG5b5j1Gm3XsTFRnUicd8XgcAyF-vcwybxBOiu8k94URr-PMSxy34R
    aQtabbvZuGMauRAF9NVWxLQ-xeKTyAWp2U5TW6O7jIfp_ixV6pGuLY>
X-ME-Received: <xmr:g_wVaqlbQLeuegAA_08MeOEIQyblQTi01Oo6sH_D-DIBWdDDqJD0yOjR5g>
X-ME-Proxy-Cause: dmFkZTFEWoqr3jxQdnEdv3oXFzj2HWLkhGqowdjzFNnehaLuwRb+tUkhNvIXGyBp9z8/yS
    FVdbaFw4nhIoe0vhvJ+5TJ8g9rjAsWnCHL/mA7iYaaVZ3zXu3XQvPQJ44omddd3uGEUWiP
    ZcSx1ZLqi2FGxm3XeQZ3GzCyeUCaEH4RqP+UU12I+dtYunNBcOJ1tDCLTwsmTQIJWGfdIC
    qd38FlSFIUGEAd359RRxMmTg1LTanIZF9BKBkRq+3vfkeD6GAMghwokG2cBtz+s1jfaddk
    MRIfwmAwy83s5DEQ38HfG5yZhYbSMmQ1ALdSnfDGdEN5QZfMoHo9hNJUAQkdMfmPGbBzpN
    54gLQ7+nwd/FimLqgf8snFcqFIq/aj2LDEXXDbI8MEDTslvc+O0mH9pwGnMiUJVqfI8H+B
    tQ2x+j6ZvUoOXjL9Vx+q6hkCboh9uBEVDDdyuvKDrsOiHb7oa/bwFkVPuNAoQK8z/dw0QJ
    ga3TmC7K/q01GBizBIZRVXxC6f2OD2MbkQzyw9cGl6baG0rZtLsZiHlG1mWohTo4lE3BQU
    c9vQgm9Qba/JXEGKUfGrvIfmOjU3XBmYXzGfZjCM75x2g3a+oYOPfhYL1TDaZZtFJZUYJa
    GQ7w9DcvROZsKqtt6Jkp5xEQQMN5vpW2ESdiPZiw2PSrsn45+hvohqR62Vxg
X-ME-Proxy: <xmx:g_wVagFjBUmQC2DHB2Q6motE47dQLgolS5AwQ62H5Y856q3K9tyg4Q>
    <xmx:g_wVah9ReAi5Op2zSVUR21SnL0rzE6J0HgoCycqpGD4bYRCuceAqyQ>
    <xmx:g_wVahk3lVV0kp_AFRqSE7BD8oaVyJOK9dR_JVu5Y0Bjl9Sf1hAOxA>
    <xmx:g_wVasAG4MjdZ4taI8mhjzHz25T06BhmFe1IscuF7P_vQ9ntXyjGQg>
    <xmx:hPwVatNQalTc9yAKg6TvoOfFWvC4OqqqtXDHgfQt_zld16HiKm4JAMnq>
Feedback-ID: i372e487a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 May 2026 16:03:11 -0400 (EDT)
From: Jeongin Yeo <jeongin.yeo@luaberry.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	matt@mattwardle.net,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jeongin Yeo <jeongin.yeo@luaberry.com>
Subject: [PATCH v2] media: atomisp: remove function name from dev_dbg calls
Date: Tue, 26 May 2026 20:02:22 +0000
Message-ID: <20260526200222.330280-1-jeongin.yeo@luaberry.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the hardcoded function name prefix from dev_dbg() output
strings within ia_css_binary_find(). dev_dbg() can already emit
the function name via dynamic_debug's 'f' flag, so embedding it
in the format string is redundant.

This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
introducing __func__ to format strings.

No functional changes.

Signed-off-by: Jeongin Yeo <jeongin.yeo@luaberry.com>
---
Changes in v2:
- Remove the function name strings entirely instead of converting
  them to __func__, per feedback from Greg KH. dev_dbg() can already
  emit function names via dynamic_debug's 'f' flag.
- Link to v1: https://lore.kernel.org/r/20260526104750.1284935-1-jeongin.yeo@luaberry.com

 .../atomisp/pci/runtime/binary/src/binary.c   | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index e9016d7775dc3..22f11155500b1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -925,7 +925,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 	/* MW: used after an error check, may accept NULL, but doubtful */
 	assert(binary);
 
-	dev_dbg(atomisp_dev, "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
+	dev_dbg(atomisp_dev, "enter: descr=%p, (mode=%d), binary=%p\n",
 		descr, descr->mode, binary);
 
 	mode = descr->mode;
@@ -992,7 +992,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		/* printf("sh_css_binary_find: evaluating candidate:
 		 * %d\n",candidate->id); */
 		dev_dbg(atomisp_dev,
-			"ia_css_binary_find() candidate = %p, mode = %d ID = %d\n",
+			"candidate = %p, mode = %d ID = %d\n",
 			candidate, candidate->pipeline.mode, candidate->id);
 
 		/*
@@ -1003,14 +1003,14 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		if (!candidate->enable.continuous &&
 		    continuous && (mode != IA_CSS_BINARY_MODE_COPY)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
+				"[%d] continue: !%d && %d && (%d != %d)\n",
 				__LINE__, candidate->enable.continuous,
 				continuous, mode, IA_CSS_BINARY_MODE_COPY);
 			continue;
 		}
 		if (striped && candidate->iterator.num_stripes == 1) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: binary is not striped\n",
+				"[%d] continue: binary is not striped\n",
 				__LINE__);
 			continue;
 		}
@@ -1019,37 +1019,37 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    (mode != IA_CSS_BINARY_MODE_COPY) &&
 		    (mode != IA_CSS_BINARY_MODE_CAPTURE_PP) &&
 		    (mode != IA_CSS_BINARY_MODE_VF_PP)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d != %d)\n",
+			dev_dbg(atomisp_dev, "[%d] continue: (%d != %d)\n",
 				__LINE__, candidate->pipeline.isp_pipe_version, isp_pipe_version);
 			continue;
 		}
 		if (!candidate->enable.reduced_pipe && enable_reduced_pipe) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: !%d && %d\n",
 				__LINE__, candidate->enable.reduced_pipe, enable_reduced_pipe);
 			continue;
 		}
 		if (!candidate->enable.dvs_6axis && enable_dvs_6axis) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: !%d && %d\n",
 				__LINE__, candidate->enable.dvs_6axis, enable_dvs_6axis);
 			continue;
 		}
 		if (candidate->enable.high_speed && !enable_high_speed) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: %d && !%d\n",
 				__LINE__, candidate->enable.high_speed, enable_high_speed);
 			continue;
 		}
 		if (!candidate->enable.xnr && need_xnr) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: %d && !%d\n",
 				__LINE__, candidate->enable.xnr, need_xnr);
 			continue;
 		}
 		if (!(candidate->enable.ds & 2) && enable_yuv_ds) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: !%d && %d\n",
 				__LINE__, ((candidate->enable.ds & 2) != 0), enable_yuv_ds);
 			continue;
 		}
 		if ((candidate->enable.ds & 2) && !enable_yuv_ds) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: %d && !%d\n",
 				__LINE__, ((candidate->enable.ds & 2) != 0), enable_yuv_ds);
 			continue;
 		}
@@ -1065,13 +1065,13 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 				       /* or more than one output pin. */
 				       xcandidate->num_output_pins > 1)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
+				"[%d] continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
 				__LINE__, req_vf_info, candidate->enable.vf_veceven,
 				candidate->vf_dec.is_variable, xcandidate->num_output_pins, 1);
 			continue;
 		}
 		if (!candidate->enable.dvs_envelope && need_dvs) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: !%d && %d\n",
 				__LINE__, candidate->enable.dvs_envelope, (int)need_dvs);
 			continue;
 		}
@@ -1079,37 +1079,37 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		ia_css_binary_internal_res(req_in_info, req_bds_out_info,
 					   req_bin_out_info, &dvs_env, candidate, &internal_res);
 		if (internal_res.width > candidate->internal.max_width) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
+			dev_dbg(atomisp_dev, "[%d] continue: (%d > %d)\n",
 				__LINE__, internal_res.width, candidate->internal.max_width);
 			continue;
 		}
 		if (internal_res.height > candidate->internal.max_height) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
+			dev_dbg(atomisp_dev, "[%d] continue: (%d > %d)\n",
 				__LINE__, internal_res.height, candidate->internal.max_height);
 			continue;
 		}
 		if (!candidate->enable.ds && need_ds && !(xcandidate->num_output_pins > 1)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: !%d && %d\n",
 				__LINE__, candidate->enable.ds, (int)need_ds);
 			continue;
 		}
 		if (!candidate->enable.uds && !candidate->enable.dvs_6axis && need_dz) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && !%d && %d\n",
+				"[%d] continue: !%d && !%d && %d\n",
 				__LINE__, candidate->enable.uds, candidate->enable.dvs_6axis,
 				(int)need_dz);
 			continue;
 		}
 		if (online && candidate->input.source == IA_CSS_BINARY_INPUT_MEMORY) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: %d && (%d == %d)\n",
+				"[%d] continue: %d && (%d == %d)\n",
 				__LINE__, online, candidate->input.source,
 				IA_CSS_BINARY_INPUT_MEMORY);
 			continue;
 		}
 		if (!online && candidate->input.source == IA_CSS_BINARY_INPUT_SENSOR) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && (%d == %d)\n",
+				"[%d] continue: !%d && (%d == %d)\n",
 				__LINE__, online, candidate->input.source,
 				IA_CSS_BINARY_INPUT_SENSOR);
 			continue;
@@ -1117,7 +1117,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		if (req_bin_out_info->res.width < candidate->output.min_width ||
 		    req_bin_out_info->res.width > candidate->output.max_width) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d > %d) || (%d < %d)\n",
+				"[%d] continue: (%d > %d) || (%d < %d)\n",
 				__LINE__, req_bin_out_info->padded_width,
 				candidate->output.min_width, req_bin_out_info->padded_width,
 				candidate->output.max_width);
@@ -1128,19 +1128,19 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    req_vf_info) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
 				dev_dbg(atomisp_dev,
-					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
+					"[%d] continue: (%d < %d)\n",
 					__LINE__, req_vf_info->res.width,
 					candidate->output.max_width);
 				continue;
 			}
 		}
 		if (req_in_info->padded_width > candidate->input.max_width) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
+			dev_dbg(atomisp_dev, "[%d] continue: (%d > %d)\n",
 				__LINE__, req_in_info->padded_width, candidate->input.max_width);
 			continue;
 		}
 		if (!binary_supports_output_format(xcandidate, req_bin_out_info->format)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d\n",
+			dev_dbg(atomisp_dev, "[%d] continue: !%d\n",
 				__LINE__, binary_supports_output_format(xcandidate,
 									req_bin_out_info->format));
 			continue;
@@ -1152,7 +1152,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    is supported. */
 		    !binary_supports_output_format(xcandidate, req_vf_info->format)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d > %d) && (%p != NULL) && !%d\n",
+				"[%d] continue: (%d > %d) && (%p != NULL) && !%d\n",
 				__LINE__, xcandidate->num_output_pins, 1, req_vf_info,
 				binary_supports_output_format(xcandidate, req_vf_info->format));
 			continue;
@@ -1163,7 +1163,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    req_vf_info && candidate->enable.vf_veceven &&
 		    !binary_supports_vf_format(xcandidate, req_vf_info->format)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
+				"[%d] continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
 				__LINE__, xcandidate->num_output_pins, 1,
 				req_vf_info, candidate->enable.vf_veceven,
 				binary_supports_vf_format(xcandidate, req_vf_info->format));
@@ -1175,7 +1175,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    req_vf_info && candidate->enable.vf_veceven) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
 				dev_dbg(atomisp_dev,
-					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
+					"[%d] continue: (%d < %d)\n",
 					__LINE__, req_vf_info->res.width,
 					candidate->output.max_width);
 				continue;
@@ -1184,20 +1184,20 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 
 		if (!supports_bds_factor(candidate->bds.supported_bds_factors,
 					 descr->required_bds_factor)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
+			dev_dbg(atomisp_dev, "[%d] continue: 0x%x & 0x%x)\n",
 				__LINE__, candidate->bds.supported_bds_factors,
 				descr->required_bds_factor);
 			continue;
 		}
 
 		if (!candidate->enable.dpc && need_dpc) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
+			dev_dbg(atomisp_dev, "[%d] continue: 0x%x & 0x%x)\n",
 				__LINE__, candidate->enable.dpc, descr->enable_dpc);
 			continue;
 		}
 
 		if (candidate->uds.use_bci && enable_capture_pp_bli) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
+			dev_dbg(atomisp_dev, "[%d] continue: 0x%x & 0x%x)\n",
 				__LINE__, candidate->uds.use_bci, descr->enable_capture_pp_bli);
 			continue;
 		}
-- 
2.43.0

