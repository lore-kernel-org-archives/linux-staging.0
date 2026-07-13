Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F63F6C3A
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944683; cv=none; b=dDGAgMlHtNigpoPY7YshYAatRHcAN8lydID/jo1zTush5ghNDpFF9RRjEpd2Uxi9N2FSK/JuIGTwHL/zzfHKY3SAymdZXfOuZWUulfZ8+O251IdRhxHt2KJRmUag8Qryk9vh/sOag0GG85LyJ6hS6LeFrdlsyKJCCxLfsumhQeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944683; c=relaxed/simple;
	bh=G2NQafJclYTeJRa5vR4Nkq85FyLNUI0JvtBWv+71DF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6FnhVSNMPBx+BPdVpMRRl3/g9qCv+HCSuuyjrILKaE8mTTzQXAUxMqBl+H3sILBe09hNZNFiBWJyiz8IlziY/izl9R2kJhh3OY5N/7DIotwnuCFlL3OTRSMcv41/VCCaR4gJeFVadMOYazRgtTIKX2zJiJVYyd9Uz59MD49SbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq+dDphM; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq+dDphM"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1732457b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944682; x=1784549482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=Hq+dDphMekXrvKeGD6NQ77x1TAt8cnUR/Cf4ib9YBJ75/h+FQp8vCLdfb1Hv6wFdAu
         mPKG6qtfFgAXooQajKjgAdbGFGFeW5pE9jhNkRnuA6jc3LLoDId0fTnQuWzmOivkn8Fb
         lezsHt1bX7Enem+C0s7SVQbBebqahd49QRtkdEh/3m10wpZuwEz9Hi+xj06VLLKyH+H0
         1AmGzb4X/G1OQ6Puo2yhB6aQQRdelfFOib42EWTqmvHx8S02Uv6yyM9XaC0bPlJYkkZ0
         ap+n91ECL3lWlgQr+iCqWHfmqzS2ljCElyMoD5K9lnv2mjef5L6VCme7wFDID/mnuTea
         Yj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944682; x=1784549482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=Ko2dBqA7xymMrKQSNMwML4BU/AHncUKrlOxJAQsv5+M+bA0wHv7s5xBvX0XR5/0Q1t
         y662TKhc0SPDhhQhPTcibrKx5N0Rg4y+hAI5SSOpjVBZpcEhoMl9g55lRQAXjaUcNEDb
         jQf85pQ3wN+xrWcUv2lodWQX2CI17ZSscEPK27MpR3vAER5st59XHlBSL595wdFxzDgt
         +A0pgAw6B1Hyhf+wzepNrG0L01ng7/vS7aqlNSEunqFzVTaWBa2vRQU/vh8nVsP53VwI
         I5yQHcPBXKPYO9OC6hk2E4kjJPmSlXrau4m1LxAvUmUObII2qiT1FaZyZ1Jv9CaZ3jik
         8uzg==
X-Forwarded-Encrypted: i=1; AHgh+RoaY+2jS82Tkz2z5SorEC5IjdUklxEpsUr9WXN2Kfe0eM4LQtcCQzwgkjXCuxPIC0ooRR16fzp8EaymyCow@lists.linux.dev
X-Gm-Message-State: AOJu0YzijAbAfXrUU2vDQj+FT1INIQsa0gqYJTDNTOuMq+fRAKdIt6+H
	ah4xVrm46qnXmG3z8in6KzWi2S6TAG/KtAQIzVt06ZG8N+QlPhtCRO/D
X-Gm-Gg: AfdE7cluSvUKVKEIIZ+9I7WdkjXMWQfgD5JBHOIfqh0lCeLUDHbCeHIeTWBsHn+bpeH
	xl533Ti2Jfm7Hk+hs03whY9Vrx6iV2+Wd+Wpeoc7xgF+jnyk0w+cpNYRw/918ewDzWW+MMXBWYL
	oUWXG4qr9bkSNoSFQ1qTJSgJnzf6tkFRNCguxs5O7kGcXCzm5u9sZc92vJufVrHEiexaNNaYBJR
	WKygYp6xM7A6kJaivIdPMwqYSRTNeZ+hImGm7sewKEG5cKLENFCWL65Eg+TH13KMl9Odqjx0Qic
	A0PjVY13Ofak+RfOZKAzko02yXZ4xVpPCmCB27MJNd6MyTNB8aLwdpK0tmRGe6xQIWT1fCz4SSs
	dhCScftT5bbg0B1pA8dygAsqu0HAgYAlbog9KZCPvbeGzDRa/ug3S4T6xRc6zbhedUr3LY7uI4N
	1PmHdOUz5lzQ==
X-Received: by 2002:a05:6300:220a:b0:3bf:aab1:cc8b with SMTP id adf61e73a8af0-3c110b436f6mr8836067637.46.1783944681879;
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
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
Subject: [PATCH v7 14/19] media: meson: vdec: Correct atomic counter placement in dst_buf_done
Date: Mon, 13 Jul 2026 17:37:09 +0530
Message-ID: <20260713120840.17427-15-linux.amoon@gmail.com>
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

Fix an end-of-stream (EOS) boundary condition logic flaw in
dst_buf_done() by relocating the atomic decrement helper to execute
after state evaluation.

Previously, decrementing sess->esparser_queued_bufs at the entry point
of the function corrupted the conditional checks for the final video
frame. This premature decrement tricked the driver into flagging the
second-to-last buffer as the final frame (V4L2_BUF_FLAG_LAST) during
teardown sequences, which cut off the true final frame and broke
compliance validation.

Resolve this by moving atomic_dec() to execute immediately after the EOS
conditional tracking block finishes evaluating, right before invoking
v4l2_m2m_buf_done(). This ensures accurate stream termination
signaling.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index f02c21d5a9c18..303236f0647c0 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -314,6 +314,9 @@ static void dst_buf_done(struct amvdec_session *sess,
 	dev_dbg(dev, "Buffer %u done, ts = %llu, flags = %08X\n",
 		vbuf->vb2_buf.index, timestamp, flags);
 	vbuf->field = field;
+
+	atomic_dec(&sess->esparser_queued_bufs);
+
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	/* Buffer done probably means the vififo got freed */
-- 
2.50.1

