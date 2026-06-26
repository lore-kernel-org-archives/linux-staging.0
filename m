Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB1481B1
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492032; cv=none; b=eznE5ilJIQ6z/WyjYkYUiTdKmmhJSlgS0z60ZNblEPV7+mhelovvF/m2IfxqPpHudD58EoW37d8AcXezJAlbL++iZQ2cKagzKS+rBmsO8lUYleIoyFaOffJGJn2fik4gmP7AOv0epDtvQNbwy7ax8AEaqNiVAIIMNeO57WvFG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492032; c=relaxed/simple;
	bh=TGDLvvCVGmvqtdxVLR+8MsqId329e6OscgKxGUUUdFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4ZhWBJ9SpRUDSyMrjjZVBero2ESujzxE7IP2cg2rgBsoQCyFhGnYiCB+oS/fovH7LPn2vbz4tO54ohlZwf1eRR/bGLYyk7gusQEEDS4PO41i/edvHA/PG8DPW46IJzX1QCTs5tK8oWLG+knvpT2n9ZlaJ9ev5DXmEuzGCs8XKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=L3lVkbi4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="L3lVkbi4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so8207845e9.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492029; x=1783096829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=L3lVkbi4TXFbZp2DlMPeKOClnkgqMmtbtU2mdfeCVVycio7S1pxXRWbEHDeS+E5Fpi
         D973EXriLhsdjoa3BPhQjwHgAmlgB6AJ8hujRrBdJX5+NhtGF1s/yo3kunkJh9M6fx0h
         gm68RxeFaOSdeoGZ7LKb1WM4xIeQNz+PVlgMK8Rf6j1lhQiErt3ZXlrg0yh3mkGYpIzY
         +kBc31f4O5LmoBgcxJDFFLtshIsOTJhsXTe/armCS7V4ftj2XBbK3WVxXsQUjrjsw06P
         UWzOFjuwN1snt5f6NIeR+Xujs+CAkgmd9gAhpaZVInH8Gh3y2BqXhYjIg4bR0jErNqBR
         Awxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492029; x=1783096829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=pAwpU4eIez1DDE4s61vru4M8D6NO2N0DLyqOMQNIqYLl1dAP6+qrHIHrxhZadKaZ7W
         qKKpcVcos2V4JwIYSmWzlpxemo66pUkU2KSX1tC726culs+Sz9FWVTG5DzJmcbWQ9e/u
         BRHu4sjPX8/464E54Rfpvjl/5cPlmgpEJSKkOPicVWf5lZ5avvuwh4OeJaOo6W3GM2sp
         5l0kin3kmNFmDErWet2Jt+Wewkd36hQEw6JPHq8WsFRqMGeHIXAt2j8vGLJ0uM2KaKVK
         VkPbko6h/jJIDYHQwI6qRCcoG3Fm2d7u4fIks13oSURW/In6uatcJuXiry+o1hdcLSev
         uKog==
X-Forwarded-Encrypted: i=1; AFNElJ+ZzjwHWNyiln/navRhzQyLJVQhaXbYto6px3QHKgnvZaUKbYSycTZc+ookr4UufxmaLDWTkIPgemoR4Tl7@lists.linux.dev
X-Gm-Message-State: AOJu0YxnCdoaTHGHK8I1JVDZ+5vGumsHFT613X/Rpvfy45VuA0sjOD5c
	Kvu/m42Xi1PZOzomqIOuV9JgVpsj7xaNqYW15hF/B9jB/bg9ueR9KA8t9H2TDSB+HX/L
X-Gm-Gg: AfdE7cmpn4m34DRbeM0qpiNBgx+wIP/AJcgFq3mf+5zpA6Kn39rZ8xC/ubBFpGxA0rA
	hbY/neow1OdyNL6h/TSx3AJp5356W3DrU8oAPxIKegXLE2pYNtRCzAtgT4xJVUHzJWjOcUOm5k+
	9lvtVTAPXr0Ej1XVYuRP7zgyPnw7VG1WMPFK60YC3TkCV4/a6ZCFYAjO8pNsx1tsm3MzJUBDsVQ
	iJJfEX5F2pMfc7HY7vFOi7CJhjL3HWaIynZyCdEvoxh8LiKarlV+YOvEx8n0vsy1xHshjlEXpR0
	ROlvtRkIcC87b2VUzoBnf6dkQVADl9zswzr7d9Fx7XK3Bu6lTUBMj/qkud6CK7s5yNahYXsnwUl
	OUoPGoxDb4aaOnFBkFJANYF5+9zW+0hAQpIW2I66bC+pPBrO1OpG+4b+ucGGR8TOvSziXxxDAES
	pSZals6QKCaDdlT+lSnrYYSZrHYuKgBhaPINMaxAZIZokHr8kRMHTsFoTcUUQX6RoB1i1b/dG4w
	pTrCpPXaCmbYZWWhdkjNTTU20z2Zeh347w=
X-Received: by 2002:a05:600c:8109:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-492667ca5fbmr116117235e9.0.1782492028118;
        Fri, 26 Jun 2026 09:40:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm30866825e9.12.2026.06.26.09.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:27 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: [PATCH] media: meson: vdec: fix use-after-free of prev_frame in codec_vp9_rm_noshow_frame()
Date: Fri, 26 Jun 2026 18:40:25 +0200
Message-ID: <20260626164025.52694-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
ref_frames_list without excluding vp9->prev_frame. When the previously
decoded frame was a non-show (alt-ref) frame and the current frame is a
non-show inter frame, the freed object is the one vp9->prev_frame still
points to; codec_vp9_set_mpred_mv() then dereferences the stale pointer
(use_prev_frame_mvs and codec_vp9_get_frame_mv_paddr()), a use-after-free.

The sibling cleanup codec_vp9_show_frame() already guards this pointer
(tmp == vp9->prev_frame); rm_noshow_frame() simply omits the same check.
Add it.

The fields that drive this path (show_frame, frame_type, intra_only) are
parsed from the VP9 bitstream, so a crafted stream fed to the stateless
decoder can trigger the free-then-use.

Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84..572f418c9 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1247,6 +1247,15 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 		if (tmp->show)
 			continue;
 
+		/*
+		 * prev_frame is still referenced by the MV predictor in
+		 * codec_vp9_set_mpred_mv(); the sibling codec_vp9_show_frame()
+		 * already excludes it before freeing. Do the same here to avoid
+		 * a use-after-free of vp9->prev_frame.
+		 */
+		if (tmp == vp9->prev_frame)
+			continue;
+
 		pr_debug("rm noshow: %u\n", tmp->index);
 		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
 		list_del(&tmp->list);
-- 
2.43.0

