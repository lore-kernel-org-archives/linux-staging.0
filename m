Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0AA33A708
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944641; cv=none; b=gpXkkNTl7viCv0ESGgdVo9jKqLZT3l5RJJksWiNuViiMQA9uQDF6I06OyCwC/dWNUiub/VxckdAuVvPQpBa95OcdJbzkuMKaSjRcFZV/OIJsvqweM5opOAk61tMRlHGVdBsHeJjwmp+RyDAIE2iOXd8phBy+R6VPGV2xWWKGi4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944641; c=relaxed/simple;
	bh=vz3zl/3kAgDjGicZo1CQ74cjgKIrvemajTZVBVpOX4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ycp1I5KM2/nnX3Ut6lUPlkIx/nTZJsjCBTK2AaNM2HSLIgFczPI+K0Ln6vc352Un6n/k+qD/kznkG5ebVZuljVjo3Nx9y3Kdq/o2LuCEUbmFMSU2uirv/qkAFois274kyHU2BBdH6yeK8YsJQMuZX5F+VAwuz7wtDJUtjMzIQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3PSqvM7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3PSqvM7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so459114a91.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944640; x=1784549440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GCAuneNa/1gKb9DW8CBD7WKj6dTVzcbk/e+PXY8YBw=;
        b=g3PSqvM70ZLbzE2yEaHrQOviNTpnfvgSscTaQrEmeXuAX3KclKVdxlxBIk9eJV1aNS
         +xe0lC26MTQgEF5OwANt9vWq/o2aScVaLqbm+iFsxC5VV+kGAyqXYImWVBqvQrdD6uuz
         F5ODPvNkzkGWCgYgSIIBxyjz8CdbYIPmCehUJ0y7tKxJfOHM13flJI4SIzKG9PV5mtqs
         Oin5eJeJn1nzWIg/imyZAmKSzBJSy0NDl9/g97LMA5R75Es2pLuk7d3lq3DaSd8+hqrh
         76FpAX2xFQR8KUgpvQ+87CDW/Y3Dr4lT/h3KjwnTamvXixBsfTx2l6SrUZb6Y+fpwzXY
         aGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944640; x=1784549440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GCAuneNa/1gKb9DW8CBD7WKj6dTVzcbk/e+PXY8YBw=;
        b=avbfruKbmzYy5TNMoScc+cR5WjVTbswElj5bhnSkwqPmgNjLg7bojvkzP5HJwxUPLT
         kS+0NwTWqwu8jb2lgSIAzF3d/p8ive/l8Wk/lGpEWSNhhQM/rRrHlMEzGo/1Y2h90yDS
         4D+psNnyzd5cEmYD21cNs+yrY8cZ0Z8S5+Gx0oQU+UoYV/3/lC36u/SWo1MIwYa/j4s6
         q2ngFdGT7veja0vVc8+luqcWP/wJAuucY14sapPy+JgBm4CeSJCn17hvqP3bcUH8zsoj
         /VGTsxoAQ0AFhso8XyenMXmj5LuX/O+2HSwmpeyhKYde8nV5CRJFsMAE5+nRItqnDpzX
         CdPg==
X-Forwarded-Encrypted: i=1; AHgh+RqaJIbrlta6a9+RY/erEIA6p7d8XGeWkm/FbnK3Zo8wFlvooZmLgJ9TS1sCnLqHsLZq3NktthXLH62a6TtN@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf9C3IVNDX7z5lk3rzZzFRRvXajIifimas9IH9eT1ObDwTHH30
	tR+2A6gKosiHqy1zt9QK1IKAd44HbfAnPuSvnH8gvIlWxbu8wF2xlYr6
X-Gm-Gg: AfdE7cn7SAYG4PtZH4ge7C14CTqeaiac+NKiPR1r6a+MUnYFtQ4grMmIDOX8p8c83lg
	eeS1npZR7IHEDdQTq4cQzec4AC7XhP74OFiTtYA6nIc9r6l/LtGZnCRqaStNluE8bzSbnEOwGIG
	VroVOVsJvAsQQW8WnAFHxzwGSydJ4/waMy+0eqftOUkOmjRqIsTzujR66xs50j8DzMYrG1/AzM9
	dzq3IcMxkJpK8cDh3GreQBQcokuNXJx7Nna0Tog6eTMRDzGa5CH/4VqOzFhLkY1eBeuXAgJoiJQ
	I3eW17IuZHlu9qr5uPdNGZ4mb5kOr1LTlcgtbSqA5QbU7gZEfyXW5xHZNI3c/NiLUQ2ZwVOTkH6
	3sVYa6hylX39Uih0tfF/bK8mmCDq6VrKB/z+ngODKZaWmibiOd3Vdn0MEcYphu7BQLF3R3ZR/xs
	IPUUr87T0MRg==
X-Received: by 2002:a17:90b:4fd2:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38dc77c61d6mr7650924a91.39.1783944639617;
        Mon, 13 Jul 2026 05:10:39 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:38 -0700 (PDT)
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
Subject: [PATCH v7 10/19] media: meson: vdec: Fix race conditions and leaks in esparser pipeline
Date: Mon, 13 Jul 2026 17:37:05 +0530
Message-ID: <20260713120840.17427-11-linux.amoon@gmail.com>
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

Fix a circular locking dependency (lockdep warning) and a potential KASAN
wild-memory-access race condition within the asynchronous esparser queue
by restructuring register write and context evaluation blocks.

Previously, evaluating hardware ownership checks outside of core->lock
introduced a time-of-check to time-of-use vulnerability, risking register
corruption during parallel stream initialization cycles. Additionally,
abruptly exiting the payload queue loop without sanitizing timestamp
trackers left metadata dynamically stranded in memory, triggering regular
kmemleak warnings.

Fix these flaws by moving the hardware session ownership validation and
atomic stop signal checks directly inside the core->lock mutex region in
esparser_queue(). Ensure that presentation timestamp pointers are cleanly
removed via amvdec_remove_ts() on all early-exit routes. Finally, refine
the VP9 payload evaluation logic to correctly catch negative error passes
from vp9_update_header() and pass the session context explicitly to the
padding helper to secure memory operations.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 29 ++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index edbfc829e2da8..b9f36fef4be12 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -199,12 +199,16 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
  * the ESPARSER interrupt.
  */
 static u32 esparser_pad_start_code(struct amvdec_core *core,
+				   struct amvdec_session *sess,
 				   struct vb2_buffer *vb,
 				   u32 payload_size)
 {
 	u32 pad_size = 0;
 	u8 *vaddr = vb2_plane_vaddr(vb, 0);
 
+	if (!sess || READ_ONCE(sess->should_stop) || !sess->priv || !vaddr)
+		return 0;
+
 	if (payload_size < ESPARSER_MIN_PACKET_SIZE) {
 		pad_size = ESPARSER_MIN_PACKET_SIZE - payload_size;
 		memset(vaddr + payload_size, 0, pad_size);
@@ -313,6 +317,9 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	u32 offset;
 	u32 pad_size;
 
+	if (READ_ONCE(sess->should_stop) || !sess->priv)
+		return -ESHUTDOWN;
+
 	/*
 	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
 	 * shortage of CAPTURE buffers on the decoder side.
@@ -349,24 +356,38 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	vbuf->sequence = sess->sequence_out++;
 
 	if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
-		payload_size = vp9_update_header(core, vb);
+		int res = vp9_update_header(core, vb);
 
-		if (payload_size == 0) {
-			dev_err(core->dev, "esparser: VP9 header update failed\n");
+		if (res <= 0) {
+			dev_err(core->dev,
+				"esparser: VP9 header update failed (%d)\n",
+				res);
 			amvdec_remove_ts(sess, vb->timestamp);
 			return -EBADMSG;
 		}
+		payload_size = res;
+	}
+
+	pad_size = esparser_pad_start_code(core, sess, vb, payload_size);
+
+	/* Protect hardware register writes under core->lock */
+	mutex_lock(&core->lock);
+	if (core->cur_sess != sess || READ_ONCE(sess->should_stop)) {
+		mutex_unlock(&core->lock);
+		amvdec_remove_ts(sess, vb->timestamp);
+		return -ESHUTDOWN;
 	}
 
-	pad_size = esparser_pad_start_code(core, vb, payload_size);
 	ret = esparser_write_data(core, phy, payload_size + pad_size);
 
 	if (ret <= 0) {
 		dev_warn(core->dev, "esparser: input parsing error\n");
 		amvdec_remove_ts(sess, vb->timestamp);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
+		mutex_unlock(&core->lock);
 		return -EIO;
 	}
+	mutex_unlock(&core->lock);
 
 	atomic_inc(&sess->esparser_queued_bufs);
 
-- 
2.50.1

