Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D603538D3E4
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543342; cv=none; b=b5cvImlpMj/ILScpgbUw1GIFV3tpPX7XnuaNkL/Rk+OQbY6ELcIRfG2iCSsNCzVeyDRhSQqbgcK6VGgpJqNJOxs8VI4MVtoq89UpTJ+/gSDUrhd3b658adlixIR4+Se5lkQFwqvfoPptq4aizyQVshmz5eXJqqU2n9PedK9FhGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543342; c=relaxed/simple;
	bh=9MtYuRi0f8vvz9OlNCUO2lRqNo4uQ41E0m6ZuTR4ysM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npf6oVx0wpHzinOHNIwxwMzZK3tfmFJ3qmspMI8K92ZofwFCvCqe/HlLpVRk0Xksj8oALZjxCSRLQ4W1gN6de9hFqY4D0xsnxMFFvxSkDgvAyd0RCuMkDMv1oWuWFm67Se/CymBTotkX13gSFQFWYgll5VUAMiBE81EEverouW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=QaRd0CB5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="QaRd0CB5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46f34d8f888so1359931f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543339; x=1783148139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI0+mugrNh7ILt3xdXuUk2twFjJ58HUZZs7uu1IE4s8=;
        b=QaRd0CB5jZNXdFIAzjLbQEPy4zFtkxO7FSnlgXBjUQYtmQ7ZZDLAUCKRtnaz8KWRfi
         WShgakI7sPo6pqQc0t0VwSWYUJolfpN+h8fh0MlUbtiwTA+Sxygd9iJq//+/va8VBPdC
         6WQ2eYsaNkzxwMXi+59w2Kc+KAH3/w2ZGNX0ugDIbXyUOFzWfLPT5/UOUmbUYQzjrdbg
         L8lF/svw6QkbQXaFP20Z5C86TXIJzIvN0Ay+Kjlp1T0OWTAwIcWpGRrc6kZfB9KCuV7v
         HUNtgMpRcyHELyzd+Q7fQ5aLfCLIxmfWplunp3zwh8pxX1FlUHI34ulKJadTFooC+Kao
         df2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543339; x=1783148139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CI0+mugrNh7ILt3xdXuUk2twFjJ58HUZZs7uu1IE4s8=;
        b=Sc56PPqq9pgdx5E5D6Oy1UP3R1hnw65ZJ5ycFGpsxAa4AxIeHxJWFerwqr/JzIb6IJ
         Bm2Ghl6N2d1AlHF1887x5CA9yj+4Nue55Bt2LrymVIkJolxpnd9a98XCFNi6WiurOBeR
         UmBTaZ4qNx15EmDtzX5EY4U9hsAWelRhkHrsAGdNRlBdCfg0Bmkx9gNZtuzdS5qLB8l9
         +oKdjuvViESxW5XQjLuK+UeDxOV6q5Y9sg987H2lrg+dpoupNe4GCiaDSb9VNR7y8IyI
         fs4F0cIOtaHhX8Ww+QlzQOwlJpKYqfpOlYazqCHtuelduVc1+yRSX6kWkrX9uJfquE/C
         8vfw==
X-Forwarded-Encrypted: i=1; AHgh+RoH2I5snoAgc06Js9eCyzfE3xKkpVd7+Y03Q+EvI5uS+lfyhXcK7w1vfaPzW/dgPKMBeeAqCpAVBwK5faV2@lists.linux.dev
X-Gm-Message-State: AOJu0YzfbMZM0fdxFv2IUo/bOQNozOiQNOBrXIkt0hL8H2RtmHnxpKt4
	R5Xsbw18BQsq4NWOesOb/qlcG943/85EfJpUAJjv2u0U90ab24kxNGu8SI2+JPjajlTc
X-Gm-Gg: AfdE7ckM81dRY5fxztSPuvt6X24RFyYpjIM247iWvNObr4WmToS218e6YeXEDKCItqR
	QbTeFx46ajeZReWxMrcEP3N4Rc7krtdeBLXeqphTsZo6rWyphRJ3TZbR2pwToI3zEtkHs4A5f7b
	12nekgPuapIX8Cax0iQKRgwRPsLN4iOJnn4wQFLOEQVRdP4+fIwQgThcJwGa1vxnoNWc8CQcAtZ
	CBm/YT7m9cfRiGlX5T8WXTevybmaXrnzYQWtzt6wrpfL3bzE4DcrmGy8IC8WBsDWfclAtQ20JQw
	EqQNt3P8m4NKv5G8iePBv8dRCoWn518QGWYLv75op24IOnhRuBtCJ5MaQYD2ZTiALLI8TLqYTuU
	QpeU7s/Bmjt/bBoZVm52vrtK9TISmqjS2TM+cknA9BJOvjNxixwXVcPiqUcXWYgxxM3FWZo3Zhz
	wv8FIqAgyhLNl85Y8+A+rVzVl8ff8kSqrRyUCcUJU+YoJq++xcKuqi/vbEl9tGqNajNP2F7C89P
	/40TJPtAaq86PEgj9Ml+aozdp4RgQHE0IM=
X-Received: by 2002:a05:6000:2501:b0:470:c049:b444 with SMTP id ffacd0b85a97d-470c049b6a1mr1348264f8f.0.1782543339444;
        Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 2/2] media: meson: vdec: guard against NULL prev_frame in codec_vp9_set_mpred_mv()
Date: Sat, 27 Jun 2026 08:55:34 +0200
Message-ID: <20260627065534.88527-3-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codec_vp9_set_mpred_mv() dereferences vp9->prev_frame unconditionally,
both when computing use_prev_frame_mvs (prev_frame->width, ->height,
->intra_only, ->show, ->type) and when programming the previous-frame
MV read registers via codec_vp9_get_frame_mv_paddr(vp9, vp9->prev_frame)
(HEVC_MPRED_MV_RD_START_ADDR, HEVC_MPRED_MV_RPTR and the RD_END_ADDR
computation).

vp9->prev_frame is only assigned (= vp9->cur_frame) after a frame has
been processed, and is NULL after allocation and after a flush. The
caller, codec_vp9_process_frame(), reaches codec_vp9_set_mpred_mv()
whenever the frame is a non-key, non-intra-only frame, without checking
that a previous frame exists. A stream whose first decoded frame is an
inter frame (malformed/adversarial input, or the first frame after a
drain) therefore triggers a NULL pointer dereference.

Disable previous-frame MV use (clear HEVC_MPRED_CTRL4 BIT(6), which the
function already does up front) and return early when prev_frame is
NULL, before any dereference. There are no previous-frame motion
vectors to consume in that case, so this is the correct behaviour as
well as the safe one.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 27 +++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 5ca27930239f..1df641202687 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -993,19 +993,32 @@ static void codec_vp9_set_mpred_mv(struct amvdec_core *core,
 				   struct codec_vp9 *vp9)
 {
 	int mpred_mv_rd_end_addr;
-	int use_prev_frame_mvs = vp9->prev_frame->width ==
-					vp9->cur_frame->width &&
-				 vp9->prev_frame->height ==
-					vp9->cur_frame->height &&
-				 !vp9->prev_frame->intra_only &&
-				 vp9->prev_frame->show &&
-				 vp9->prev_frame->type != KEY_FRAME;
+	int use_prev_frame_mvs;
 
 	amvdec_write_dos(core, HEVC_MPRED_CTRL3, 0x24122412);
 	amvdec_write_dos(core, HEVC_MPRED_ABV_START_ADDR,
 			 vp9->workspace_paddr + MPRED_ABV_OFFSET);
 
 	amvdec_clear_dos_bits(core, HEVC_MPRED_CTRL4, BIT(6));
+
+	/*
+	 * prev_frame is NULL when an inter frame is the first frame decoded
+	 * (e.g. a stream starting on a non-key frame, or the first frame
+	 * after a flush). There are no previous-frame motion vectors to use
+	 * and every read below would dereference a NULL pointer, so leave
+	 * prev-MV use disabled (BIT(6) already cleared) and bail out.
+	 */
+	if (!vp9->prev_frame)
+		return;
+
+	use_prev_frame_mvs = vp9->prev_frame->width ==
+				vp9->cur_frame->width &&
+			     vp9->prev_frame->height ==
+				vp9->cur_frame->height &&
+			     !vp9->prev_frame->intra_only &&
+			     vp9->prev_frame->show &&
+			     vp9->prev_frame->type != KEY_FRAME;
+
 	if (use_prev_frame_mvs)
 		amvdec_write_dos_bits(core, HEVC_MPRED_CTRL4, BIT(6));
 
-- 
2.53.0

