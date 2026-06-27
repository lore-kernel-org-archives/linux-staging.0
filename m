Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B8374192
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542351; cv=none; b=EewABEDfeCEZrj6j3rMIUB7Ubqc6ndKc2dMhOCKXhsLTSJ1csNUFei4k18K4sRNaAZyaZbLp0zF1dlNaX27yJDHb7ZvGVLnsGZmoi0f/wFzPRR6j/a/3IMOZtHsi7q1tF/EYhDQansCWdRGsKROwzeuZ9YFiuQMVBRPlE8APMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542351; c=relaxed/simple;
	bh=nxNYPvmWkiMyssbGy/vyBZfAMksgd8lEg6+v+sNqj9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UwqCr3api7NFoo922Y262mJwt+MFhEzYntKBsB5YLuLObjJ5mw4xDd/7QhSpMF60wDCB7SPmB9AMpPH53uZokhHkZZO6p5ZK/PcodWaMnke+NiTDZsXkQyVNlNMtoKpt2JQjvrJVz0rvWxHtv+ZkFs7c6VSd8WmGCIPmoVFMsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=eXJmvX8u; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="eXJmvX8u"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47122683cf3so26172f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542348; x=1783147148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=eXJmvX8uhTvdxV0MB0kKd8YxKZHkK4XLRgqOQ4InmyKarAs7umPqH9fpsccsSHopep
         tQEbHtvbPxpDFu4JqzMCaefoC6OYb3WYWlt5X1V4S+na1+8Ia4npDmI9kuJvDcV1iDva
         GpuugIuzaRGkFAsxuJiOAvV11DN3pC3VF/pXjnDZU5w/7TQLY3truMZUwnc0QF7UVsVZ
         JMezTQdH8L4hKBYQl2/ZuX9N1GiUQXphDG23PNWLZbtvUE2KVllZTOdZkdiN/o3tjHZj
         jM3I5rk+4o82DPyu6f6epd0xPjy5+t/XxdUJpiS4ax2HBheoMuTmImuwXgVMujcw1mAF
         8SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542348; x=1783147148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=q/FU+sSs9fcXztMqZz2k0MmftqYZIy/6MM0yQRqi3e+lghPLELzwSFGzCtyGgV/2NY
         sBKEnHncjlVLgEyrgNJPfYKWlUaXMNCUxaOMsIRGWTPEbNYEs9t/MOqfY20PdMaue0ZS
         2wWZUtenaFhMQ/qW048BxvKbqUaSOiQfoN+HKLTgwESPxtQzW6j2rkwTDdQYyx+4mJkj
         fWhJWzrDjQKxujun7yz9iNfOq/UPreo2JvIy69xQHxwxZqLsB02MEmzJMmMhoelcpKfn
         N12q9xG9W3D4TFoPEemhazRXKE/ycAiXPDB4R3gpdvzQgRdBux0xOC900+kM5XVG3WTI
         OuMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqjfgt2b7Ii4vwKDFoN0PRuqLFyQYaAoMMTgypVUvOO1GbnWIun7MuOYJRPB8rSvmTaIaEKYPZTGVvif1Vo@lists.linux.dev
X-Gm-Message-State: AOJu0YzkVeX6eFU+/9JmBhE/0dR24hP5e8Kj/hUP4il876gt7lLOjjzg
	wTbxZ4y6jn2SOcfL569ccLohi0lJpTIhFBRXUnxBjbpyZamEuJLYb/aSUNyXjE/cIY7h
X-Gm-Gg: AfdE7cnigBhzLxPqwidY075u5ZNRHiCNCb7l7XIEpKuicP8qPCBjXgIUa7xuPfFgSMa
	c6RFOl1K0w5SYcyG+g2/dytVDYknThnF/kWBAk6HHuxuTd2n5HfTTKMn3MYrzpVIFTDfE5kW16u
	kRpjt5r/fe96OsmIaoN9P1Y8yYYxy/HDPhJDAfjz78htFABI0w15IxVj7NKW7HRYpjLPMZFCal0
	5qCzmZ2qr6+6oZXnZvLXuFZc/5KaYtEjcSPoac1ch378mmxtizw/hZinNosHfpKUOXQJe3HGtfj
	Om6B7YBl/h0z7l9o1B++l3u23tVi/1tlTTz/ozRyXJVbOAG61CxTP8xyLPwzlwEgDgw0Zq52t/s
	VIYL0c6+tx8eKzu1CJpCG1G+jYtrmweCt4gES4WIeZqP5jmdwXi/naQajDnCybunpLj1gblbbLb
	SELRdNOCFmiE1Sm8EBBHjRMRYHK5rdeH7ufkRODLuA7qvGxhiUzRhXz3AP/awsEWybvmUtFar1k
	1ifkA2woIYS4Y/1sXDsUeX73BGFpwCzzNQ=
X-Received: by 2002:a5d:67cb:0:b0:46e:64f3:ee74 with SMTP id ffacd0b85a97d-46fb94541e4mr4577099f8f.45.1782542348074;
        Fri, 26 Jun 2026 23:39:08 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c22c680fasm31551666f8f.34.2026.06.26.23.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:07 -0700 (PDT)
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
Subject: [PATCH v2] media: meson: vdec: fix use-after-free of in-use frames in codec_vp9_rm_noshow_frame()
Date: Sat, 27 Jun 2026 08:39:05 +0200
Message-ID: <20260627063905.79363-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
ref_frames_list without excluding frames that are still in use. When the
previously decoded frame was a non-show (alt-ref) frame and the current
frame is a non-show inter frame, the freed object is the one
vp9->prev_frame still points to; codec_vp9_set_mpred_mv() then
dereferences the stale pointer (use_prev_frame_mvs and
codec_vp9_get_frame_mv_paddr()), a use-after-free. Freeing a frame that
is still an active reference (codec_vp9_is_ref()) or the current frame
has the same in-use-then-free shape and additionally desyncs the
reference bookkeeping in codec_vp9_sync_ref().

The sibling cleanup codec_vp9_show_frame() already guards exactly these
cases before freeing:

	if (codec_vp9_is_ref(vp9, tmp) || tmp == vp9->prev_frame)
		continue;

rm_noshow_frame() simply omits the same check. Add it, also skipping
cur_frame, so both cleanup paths agree on which frames are safe to free.

The fields that drive this path (show_frame, frame_type, intra_only) are
parsed from the VP9 bitstream, so a crafted stream fed to the stateless
decoder can trigger the free-then-use.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: Per Dan Carpenter's review, also skip active reference frames
    (codec_vp9_is_ref()) and cur_frame, matching codec_vp9_show_frame()
    exactly — freeing an in-use altref/reference frame here also caused a
    codec_vp9_sync_ref() desync, not just the prev_frame UAF.

 drivers/staging/media/meson/vdec/codec_vp9.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84193..dad75950933c 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1238,6 +1238,8 @@ static void codec_vp9_show_existing_frame(struct codec_vp9 *vp9)
 	pr_debug("showing frame %u\n", param->p.frame_to_show_idx);
 }
 
+static bool codec_vp9_is_ref(struct codec_vp9 *vp9, struct vp9_frame *frame);
+
 static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 {
 	struct codec_vp9 *vp9 = sess->priv;
@@ -1247,6 +1249,18 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 		if (tmp->show)
 			continue;
 
+		/*
+		 * Mirror codec_vp9_show_frame(): never free an active
+		 * reference frame, the previously decoded frame, or the
+		 * current frame here. prev_frame is still dereferenced by the
+		 * MV predictor in codec_vp9_set_mpred_mv(), and freeing an
+		 * in-use altref/reference also desyncs codec_vp9_sync_ref();
+		 * either is a use-after-free of an in-use frame.
+		 */
+		if (codec_vp9_is_ref(vp9, tmp) || tmp == vp9->prev_frame ||
+		    tmp == vp9->cur_frame)
+			continue;
+
 		pr_debug("rm noshow: %u\n", tmp->index);
 		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
 		list_del(&tmp->list);
-- 
2.53.0

