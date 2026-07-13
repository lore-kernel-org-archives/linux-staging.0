Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2740627B
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944631; cv=none; b=u0c6jSicAiA3zNzSfO85irWKPwbxo9DCT7ZpyORQxr7jwkCf9hDv2VfD0M9GoupIfytYdPHK41uvn4ld2XLT8mEbW/rOhDNf8FLIzapiYyKXRNcpt1CFv9VuNuPA5P7CjGT2U4eF285/7/XPx86yJSVLsIRnLnQxreZhZT/OulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944631; c=relaxed/simple;
	bh=0h03bQuoUWZdGVlD74sLbbLEbbwu1nwFtUhUFitPw/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9EO7q1oDabpYIKZ3/YvpZV1xwSyM47vwE7EOJdQtzbrv0lmxbizIZWzkonLmGNURZvzMwDjvFLVVQ/ujql5ig1H7Tcl8Cfn/+ETCkhRwiWoJgwUds+grJFlPQtjYvuMnuFvSduJm5xz6KjKnfGya4PSaMqMjMvy4tX7AE7KoIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtONpVPO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtONpVPO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848595b338cso3446379b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944629; x=1784549429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g+WRe3x8NF1Lsmp6BpHJTM0uwdyJj9zKy0hm9x5WoY=;
        b=KtONpVPO4LcOHG8gfSNZNut1la4HkJOlA6soP0oV590gTu/6HPRSh2klWuU3b03OPy
         eWcwEFXNzAxZ5g6/pGbdty2w9ytfkage6OJu5lNezk5pZqGmOEhOn1Y832G4HoYokdWw
         75QVUuKYznje0dfuDFo7hwiI1BTA5vJKB/UI9iZQGanedfuLJphypjtAvdZG2epNg7h9
         q3OcW+CAaWm1ESROYFVw4c5/4/+8IcpCGd1t9P+9MdF9CJl18DlkKoxI0yRsoCcRwcvk
         KetrRYXR0qMX7QbwGT8+xXmeZcMAEkh909iI1mfJ2xmhumyhyJejFITpZttMV7Y2/ows
         rpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944629; x=1784549429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0g+WRe3x8NF1Lsmp6BpHJTM0uwdyJj9zKy0hm9x5WoY=;
        b=RPBghmQDsYNIlzPSfki08xrXXe8CiC7vXd7aDtyW5wFozSAFUGoyN24++3EtTbwmKT
         oOY3cHu7hHCM0ulC7J7Fp+2n1GS/tTo0bH0HJ/PCATUP0vpQjyw1yOus4IOT8ab8+jcA
         cZbbf8v6Qel/f5CZlquxBcs6tbqjnUkmjPPIM0DljhKPt7cqKCrgBXKBB0NMRWABudhE
         NhAnPxbaRpZWUZMc34kEKHLgZfi+B21j/Ho54wgW0PXNMLluEGQuCuyVG66+dRng19Zq
         vnx8yAbI9d2Jwo8vesuleRkW5RgiHLjBZst7YDs8K0HDmEWep9rHRj/HKLzCMd8FLGmf
         O8Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rp8SO2hZjQNDKhzXvz5BI0BXcCfL5UIxyY0ZjlBHqkb0on3oZRt78comkyVEf+NWraHoTBXNeiG/wr441C3@lists.linux.dev
X-Gm-Message-State: AOJu0YzHlszKaG1zyzxtdW7AguzecafgfdjRtMpP9tbcB9spoXZFo+84
	MO5Ptpn386WS4DdRCDsKpxuSRu87R2ARpHzrp3jL4ZmbjQOvjNeKAh0C
X-Gm-Gg: AfdE7cnsMNF7H8OmlbTBca4PAEhUHxrMjkDXpTPYYtkzLp/sCCxPWTgcBai8C+0mrVS
	5+TQYalZZGjAdf9yUyxlLUOgdDruDnc2v6f81OVdjGriaBPVEu2uCArdLTDNOnnhOnIvQWYnlCj
	nXz5nDZ2m2MHb61G/zs7FgaffgRzinT5Ru3Zu8Mqez+P4yqawQ6V1O3wYZtZcMeN0BnfS41GIh1
	FgyBA2/y1i/Aqi7UEy7UD1KuCL80AKblPtiyqDYVYCbZ/tHpZsjyue7e773m9vUpRv9i7FEwWnR
	Wi+T7ZBYSXz2Cokd9nuWUUOXc0WvKVRy43VVQSRdjc0SpopcMr8avISWglMpAU9Cdv3Del4p02P
	LRFSrO+/QsUJqY1r+oub5UBRMPTHbyWjUMvJ1MqtvhgU4T4Dm9BDy5BYBDzlO7Oi+62WouZrom0
	VCrRBoj1VsBy3c27noaW+/
X-Received: by 2002:a05:6a21:6088:b0:3bf:9fc0:f6c2 with SMTP id adf61e73a8af0-3c1109ec872mr8713076637.11.1783944629120;
        Mon, 13 Jul 2026 05:10:29 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:28 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 09/19] media: meson: vdec: Fix vp9 header update failure on invalid payloads
Date: Mon, 13 Jul 2026 17:37:04 +0530
Message-ID: <20260713120840.17427-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure vp9_update_header() returns an explicit error code on invalid or
malformed buffer payloads instead of silently returning zero.

When v4l2-compliance injects short, empty, or uninitialized test buffers,
the validation logic catches the out-of-bounds size anomalies, but
returning 0 tricks the calling esparser infrastructure into treating
it as a successful 0-byte header conversion. This causes the hardware
decoder engine to stall out, resulting in subsequent stream-on timeouts
and failure marks inside v4l2-test-buffers.cpp.

Fix this by returning -EINVAL across all validation and bounds check
failures to force immediate core framework buffer drops. Additionally,
tighten array pointer checks, secure the mag_ptr bounds loop, and
convert the superframe parsing indexer into an explicit if/else block
for readability.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 959673742e699..edbfc829e2da8 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -97,11 +97,15 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 	unsigned char *old_header = NULL;
 
 	dp = (uint8_t *)vb2_plane_vaddr(buf, 0);
+	if (!dp)
+		return -EINVAL;
+
 	dsize = vb2_get_plane_payload(buf, 0);
 
-	if (dsize == vb2_plane_size(buf, 0)) {
-		dev_warn(core->dev, "%s: unable to update header\n", __func__);
-		return 0;
+	if (dsize <= 0 || dsize > vb2_plane_size(buf, 0)) {
+		dev_warn(core->dev, "%s: invalid payload size %d\n",
+			 __func__, dsize);
+		return -EINVAL;
 	}
 
 	marker = dp[dsize - 1];
@@ -109,13 +113,16 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 		num_frames = (marker & 0x7) + 1;
 		mag = ((marker >> 3) & 0x3) + 1;
 		mag_ptr = dsize - mag * num_frames - 2;
-		if (dp[mag_ptr] != marker)
-			return 0;
+		if (mag_ptr < 0 || dp[mag_ptr] != marker)
+			return -EINVAL;
 
 		mag_ptr++;
 		for (cur_frame = 0; cur_frame < num_frames; cur_frame++) {
 			frame_size[cur_frame] = 0;
 			for (cur_mag = 0; cur_mag < mag; cur_mag++) {
+				if (mag_ptr >= dsize)
+					return -EINVAL;
+
 				frame_size[cur_frame] |=
 					(dp[mag_ptr] << (cur_mag * 8));
 				mag_ptr++;
@@ -140,7 +147,7 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 
 	if (new_frame_size >= vb2_plane_size(buf, 0)) {
 		dev_warn(core->dev, "%s: unable to update header\n", __func__);
-		return 0;
+		return -ENOMEM;
 	}
 
 	for (cur_frame = num_frames - 1; cur_frame >= 0; cur_frame--) {
-- 
2.50.1

